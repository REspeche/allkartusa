import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/config.dart';
import '../../models/index.dart'
    show AppModel, Product, ProductAttribute, ProductVariation;
import '../../services/index.dart';
import '../../widgets/product/product_variant.dart';
import '../product_variant_mixin.dart';

mixin WooVariantMixin on ProductVariantMixin {
  Future<void> getProductVariations({
    BuildContext? context,
    Product? product,
    void Function({
      Product? productInfo,
      List<ProductVariation>? variations,
      Map<String?, String?> mapAttribute,
      ProductVariation? variation,
    })?
        onLoad,
  }) async {
    if (product!.attributes == null) {
      return;
    }

    var mapAttribute = <String?, String?>{};
    var variations = <ProductVariation>[];
    Product? productInfo;
    ProductVariation? variation;

    final lang = Provider.of<AppModel>(context!, listen: false).langCode;
    await Services()
        .api
        .getProductVariations(product, lang: lang)!
        .then((value) {
      variations = value!.toList();
    });

    if (variations.isEmpty) {
      for (var attr in product.attributes!) {
        mapAttribute.update(attr.name, (value) => attr.options![0]['name'],
            ifAbsent: () => attr.options![0]['name']);
      }
    } else {
      await Services().api.getProduct(product.id, lang: lang)!.then((onValue) {
        if (onValue != null) {
          productInfo = onValue;
        }
      });

      if (productInfo!.defaultAttributes.isEmpty &&
          (kProductDetail.autoSelectFirstAttribute)) {
        /// Load default attributes from first variation.
        for (var variant in variations) {
          if (variant.price == product.price) {
            for (var attribute in variant.attributes) {
              for (var attr in product.attributes!) {
                if (attr.name == attribute.name) {
                  mapAttribute.update(
                      attr.name, (value) => attr.options![0]['name'],
                      ifAbsent: () => attr.options![0]['name']);
                }
              }
              mapAttribute.update(attribute.name, (value) => attribute.option,
                  ifAbsent: () => attribute.option);
            }
            break;
          }
          if (mapAttribute.isEmpty) {
            var firstItem = variations[0];
            for (var attribute in firstItem.attributes) {
              mapAttribute.update(attribute.name, (value) => value,
                  ifAbsent: () {
                return attribute.option;
              });
            }
          }
        }
      }

      if (productInfo!.defaultAttributes.isNotEmpty) {
        /// Load default attributes from Woo.
        for (var attribute in productInfo!.defaultAttributes) {
          /// Convert slug to name.
          final option = productInfo!.attributeSlugMap[attribute.option];
          mapAttribute[attribute.name] = option;
        }
      }

      /// Check default attributes
      for (var item in variations) {
        if (item.hasSameAttributes(mapAttribute)) {
          variation = item;
          break;
        }
      }

      if (variation == null) {
        /// Clear default attributes if it's invalid.
        // mapAttribute.clear();
      }
    }

    onLoad!(
        productInfo: productInfo,
        variations: variations,
        variation: variation,
        mapAttribute: mapAttribute);
    return;
  }

  bool couldBePurchased(
    List<ProductVariation>? variations,
    ProductVariation? productVariation,
    Product product,
    Map<String?, String?>? mapAttribute,
  ) {
    final isAvailable =
        productVariation != null ? productVariation.id != null : true;

    final isValidProductVariant = productVariation != null
        ? isValidProductVariation(variations!, mapAttribute)
        : true;

    return isValidProductVariant &&
        isPurchased(productVariation, product, mapAttribute!, isAvailable);
  }

  /// Return true if mapAttribute match with any of variations.
  bool isValidProductVariation(
      List<ProductVariation> variations, Map<String?, String?>? mapAttribute) {
    for (var variation in variations) {
      if (variation.hasSameAttributes(mapAttribute!)) {
        /// Hide out of stock variation
        if ((kAdvanceConfig['hideOutOfStock'] ?? false) &&
            !variation.inStock!) {
          return false;
        }
        return true;
      }
    }
    return false;
  }

  void onSelectProductVariant({
    ProductAttribute? attr,
    String? val,
    List<ProductVariation>? variations,
    Map<String?, String?>? mapAttribute,
    Function? onFinish,
  }) {
    Map<String?, String?> updateMapData(Map data, String key) {
      final valueUpdate = data[key].toString();
      final mapClone = Map<String?, String?>.from(mapAttribute!);
      mapClone.update(attr!.name, (value) => valueUpdate,
          ifAbsent: () => val.toString());
      return mapClone;
    }

    if (kProductDetail.hideInvalidAttributes) {
      final previousVal = mapAttribute![attr!.name];

      /// Unselect if option is selected.
      if (val.toString() == previousVal) {
        mapAttribute[attr.name] = null;
        final productVariation = updateVariation(variations!, mapAttribute);
        onFinish!(mapAttribute, productVariation);
        return;
      }
    }
    final optionSelect = attr!.options!
        .where((element) =>
            element['slug'] == val.toString() ||
            element['name'] == val.toString())
        .first;

    /// Check option with name
    final cloneMapAttribute =
        updateMapData(((optionSelect is Map) ? optionSelect : {}), 'name');

    if (!isValidProductVariation(variations!, cloneMapAttribute)) {
      /// Check option with slug
      mapAttribute =
          updateMapData(((optionSelect is Map) ? optionSelect : {}), 'slug');

      if (!isValidProductVariation(variations, mapAttribute)) {
        /// Reset other choices
        mapAttribute.clear();
        mapAttribute[attr.name] = val.toString();
      }
    } else {
      mapAttribute = cloneMapAttribute;
    }

    final productVariation = updateVariation(variations, mapAttribute);
    onFinish!(mapAttribute, productVariation);
  }

  List<Widget> getProductAttributeWidget(
    String lang,
    Product product,
    Map<String?, String?>? mapAttribute,
    Function onSelectProductVariant,
    List<ProductVariation> variations,
  ) {
    var listWidget = <Widget>[];

    final checkProductAttribute = product.attributes?.isNotEmpty ?? false;
    if (checkProductAttribute) {
      for (var attr in product.attributes!) {
        if (attr.name?.isNotEmpty ?? false) {
          var options =
              _getValidAttributeOptions(attr, mapAttribute!, variations);

          /// Deselect invalid option.
          if (options.isEmpty) {
            mapAttribute[attr.name] = null;
            options = _getValidAttributeOptions(attr, mapAttribute, variations);
          }

          final itemSelected = attr.options!.firstWhere(
              (element) =>
                  element['slug'] == mapAttribute[attr.name] ||
                  element['name'] == mapAttribute[attr.name],
              orElse: () => null);

          var selectedValue = itemSelected != null ? itemSelected['name'] : '';
          final attrType = kProductVariantLayout[attr.cleanSlug ?? attr.name] ??
              kProductVariantLayout[attr.name!.toLowerCase()] ??
              'box';

          /// For product variation swatches (image)
          Map<String?, String?>? imageUrls;
          if (attrType == 'image') {
            imageUrls = {};
            for (var option in attr.options!) {
              if (option['description'].toString().contains('http')) {
                imageUrls[option['name']] = option['description'];
              }
            }
          }

          listWidget.add(
            BasicSelection(
              imageUrls: imageUrls,
              options: options,
              title: kProductVariantLanguage[lang] != null
                  ? kProductVariantLanguage[lang]
                          [attr.cleanSlug ?? attr.name] ??
                      kProductVariantLanguage[lang][attr.name!.toLowerCase()] ??
                      attr.label!.toLowerCase()
                  : attr.label!.toLowerCase(),
              type: attrType,
              value: selectedValue,
              onChanged: (val) => onSelectProductVariant(
                  attr: attr,
                  val: val,
                  mapAttribute: mapAttribute,
                  variations: variations),
            ),
          );
          listWidget.add(
            const SizedBox(height: 20.0),
          );
        }
      }
    }
    return listWidget;
  }

  List<Widget> getProductTitleWidget(BuildContext context,
      ProductVariation? productVariation, Product product) {
    final isAvailable =
        // ignore: unnecessary_null_comparison
        productVariation != null ? productVariation.id != null : true;
    return makeProductTitleWidget(
        context, productVariation, product, isAvailable);
  }

  List<Widget> getBuyButtonWidget(
    BuildContext context,
    ProductVariation? productVariation,
    Product product,
    Map<String?, String?>? mapAttribute,
    int maxQuantity,
    int quantity,
    Function addToCart,
    Function onChangeQuantity,
    List<ProductVariation>? variations,
  ) {
    final isAvailable =
        couldBePurchased(variations, productVariation, product, mapAttribute);

    return makeBuyButtonWidget(
        context,
        productVariation,
        product,
        mapAttribute!,
        maxQuantity,
        quantity,
        addToCart,
        onChangeQuantity,
        isAvailable);
  }

  List<String> _getValidAttributeOptions(ProductAttribute attr,
      Map<String?, String?> mapAttribute, List<ProductVariation> variations) {
    return List<String>.from(
      attr.options!
          .map((e) {
            var copy = Map<String?, String?>.from(mapAttribute);
            copy[attr.name] = e['name'];

            if (kProductDetail.hideInvalidAttributes) {
              if (isValidProductVariation(variations, copy)) {
                return e['name'];
              }
              return null;
            } else {
              return e['name'];
            }
          })
          .toList()

          /// To filter null value.
          .whereType<String>(),
    );
  }
}
