// ignore_for_file: prefer_single_quotes, lines_longer_than_80_chars final 
Map<String, dynamic> environment =
{
  "appConfig": "lib/config/config_en.json",
  "serverConfig": {
    "consumerKey": "ck_0b19c733f006148edd10524f5784b5df56598eb7",
    "url": "http://allkartusa.incloux.com.ar",
    "consumerSecret": "cs_4e3d735cd71a9a7b3c69e1f39cdfe594e14faa4a",
    "type": "wcfm"
  },
  "defaultDarkTheme": false,
  "loginSMSConstants": {
    "countryCodeDefault": "US",
    "dialCodeDefault": "+1",
    "nameDefault": "United States"
  },
  "storeIdentifier": {
    "disable": true,
    "android": "com.incloux.allkartusa",
    "ios": "1469772800"
  },
  "advanceConfig": {
    "DefaultLanguage": "en",
    "DetailedBlogLayout": "halfSizeImageType",
    "EnablePointReward": false,
    "hideOutOfStock": false,
    "EnableRating": true,
    "hideEmptyProductListRating": true,
    "EnableShipping": true,
    "EnableSkuSearch": true,
    "showStockStatus": true,
    "GridCount": 3,
    "isCaching": true,
    "kIsResizeImage": false,
    "DefaultCurrency": {
      "symbol": "\$",
      "decimalDigits": 2,
      "symbolBeforeTheNumber": true,
      "currency": "USD",
      "currencyCode": "usd",
      "smallestUnitRate": 100
    },
    "Currencies": [
      {
        "symbol": "\$",
        "decimalDigits": 2,
        "symbolBeforeTheNumber": true,
        "currency": "USD",
        "currencyCode": "usd",
        "smallestUnitRate": 100
      }
    ],
    "DefaultStoreViewCode": "",
    "EnableAttributesConfigurableProduct": [
      "color",
      "size"
    ],
    "EnableAttributesLabelConfigurableProduct": [
      "color",
      "size"
    ],
    "isMultiLanguages": false,
    "EnableApprovedReview": false,
    "EnableSyncCartFromWebsite": false,
    "EnableSyncCartToWebsite": false,
    "EnableShoppingCart": false,
    "EnableFirebase": true,
    "RatioProductImage": 1.2,
    "EnableCouponCode": false,
    "ShowCouponList": false,
    "ShowAllCoupons": false,
    "ShowExpiredCoupons": true,
    "AlwaysShowTabBar": false,
    "PrivacyPoliciesPageId": 25569,
    "QueryRadiusDistance": 10
  },
  "defaultDrawer": {
    "background": null,
    "items": [
      {
        "type": "home",
        "show": true
      },
      {
        "type": "blog",
        "show": true
      },
      {
        "type": "categories",
        "show": true
      },
      {
        "type": "cart",
        "show": true
      },
      {
        "type": "profile",
        "show": true
      },
      {
        "type": "login",
        "show": true
      },
      {
        "type": "category",
        "show": true
      }
    ]
  },
  "defaultSettings": [
    "products",
    "chat",
    "wishlist",
    "notifications",
    "language",
    "currencies",
    "darkTheme",
    "order",
    "point",
    "rating",
    "privacy",
    "about"
  ],
  "loginSetting": {
    "IsRequiredLogin": true,
    "showAppleLogin": true,
    "showFacebook": true,
    "showSMSLogin": false,
    "showGoogleLogin": true,
    "showPhoneNumberWhenRegister": false,
    "requirePhoneNumberWhenRegister": false,
    "isResetPasswordSupported": true,

    /// For Facebook login.
    /// These configs are only used for FluxBuilder's Auto build feature.
    /// To update manually, follow this below doc:
    /// https://support.inspireui.com/help-center/articles/42/44/32/social-login#login
    "facebookAppId": "456506365847948",
    "facebookLoginProtocolScheme": "fb430258564493822",
  },
  "oneSignalKey": {
    "enable": false,
    "appID": "8b45b6db-7421-45e1-85aa-75e597f62714"
  },
  "onBoardingData": [
    {
      "title": "Connecting Race World",
      "desc": "See all things happening around karting race in USA. Fast, convenient and clean.",
      "image": "assets/images/allkart_splash1.png"
    },
    {
      "title": "Take Advantage Now",
      "desc": "Sell free without commissions until May 1, then pay only 5% on the sale.",
      "image": "assets/images/allkart_splash2.png"
    },
    {
      "title": "Let's Get Started",
      "desc": "Waiting no more, let's see what offer you!",
      "image": "assets/images/allkart_splash3.png"
    }
  ],
  "adConfig": {
    "enable": false,
    "facebookTestingId": "",
    "googleTestingId": [
      "123",
      "457"
    ],
    "ads": [
      {
        "type": "banner",
        "provider": "google",
        "iosId": "ca-app-pub-3940256099942544/2934735716",
        "androidId": "ca-app-pub-3940256099942544/6300978111",
        "showOnScreens": [
          "home",
          "search"
        ],
        "hideOnScreens": []
      },
      {
        "type": "banner",
        "provider": "google",
        "iosId": "ca-app-pub-2101182411274198/5418791562",
        "androidId": "ca-app-pub-2101182411274198/4052745095",
        "hideOnScreens": []
      },
      {
        "type": "interstitial",
        "provider": "google",
        "iosId": "ca-app-pub-3940256099942544/4411468910",
        "androidId": "ca-app-pub-3940256099942544/4411468910",
        "hideOnScreens": []
      },
      {
        "type": "reward",
        "provider": "google",
        "iosId": "ca-app-pub-3940256099942544/1712485313",
        "androidId": "ca-app-pub-3940256099942544/4411468910",
        "hideOnScreens": []
      },
      {
        "type": "banner",
        "provider": "facebook",
        "iosId": "IMG_16_9_APP_INSTALL#430258564493822_876131259906548",
        "androidId": "IMG_16_9_APP_INSTALL#430258564493822_489007588618919",
        "hideOnScreens": []
      },
      {
        "type": "interstitial",
        "provider": "facebook",
        "iosId": "430258564493822_489092398610438",
        "androidId": "IMG_16_9_APP_INSTALL#430258564493822_489092398610438",
        "hideOnScreens": []
      }
    ]
  },
  "firebaseDynamicLinkConfig": {
    "isEnabled": true,
    "uriPrefix": "https://fluxstoreinspireui.page.link",
    "link": "https://mstore.io/",
    "androidPackageName": "com.incloux.allkartusa",
    "androidAppMinimumVersion": 1,
    "iOSBundleId": "com.incloux.mstore.allkartusa",
    "iOSAppMinimumVersion": "1.0.1",
    "iOSAppStoreId": "1469772800"
  },
  "languagesInfo": [
    {
      "name": "English",
      "icon": "assets/images/country/gb.png",
      "code": "en",
      "text": "English",
      "storeViewCode": ""
    }
  ],
  "unsupportedLanguages": [
    "ku"
  ],
  "paymentConfig": {
    "DefaultCountryISOCode": "US",
    "DefaultStateISOCode": "FL",
    "EnableShipping": true,
    "EnableAddress": true,
    "EnableCustomerNote": true,
    "EnableAddressLocationNote": false,
    "EnableAlphanumericZipCode": false,
    "EnableReview": true,
    "allowSearchingAddress": true,
    "GuestCheckout": false,
    "EnableOnePageCheckout": false,
    "NativeOnePageCheckout": false,
    "CheckoutPageSlug": {
      "en": "checkout"
    },
    "EnableCreditCard": false,
    "UpdateOrderStatus": false,
    "ShowOrderNotes": true,
    "EnableRefundCancel": false
  },
  "payments": {
    "paypal": "assets/icons/payment/paypal.png",
    "stripe": "assets/icons/payment/stripe.png",
    "razorpay": "assets/icons/payment/razorpay.png",
    "tap": "assets/icons/payment/tap.png"
  },
  "stripeConfig": {
    "serverEndpoint": "https://stripe-server.vercel.app",
    "publishableKey": "pk_test_MOl5vYzj1GiFnRsqpAIHxZJl",
    "enabled": true,
    "paymentMethodId": "stripe",
    "returnUrl": "fluxstore://inspireui.com",
    "enableManualCapture": false
  },
  "paypalConfig": {
    "clientId": "ASlpjFreiGp3gggRKo6YzXMyGM6-NwndBAQ707k6z3-WkSSMTPDfEFmNmky6dBX00lik8wKdToWiJj5w",
    "secret": "ECbFREri7NFj64FI_9WzS6A0Az2DqNLrVokBo0ZBu4enHZKMKOvX45v9Y1NBPKFr6QJv2KaSp5vk5A1G",
    "production": true,
    "paymentMethodId": "paypal",
    "enabled": true
  },
  "razorpayConfig": {
    "keyId": "rzp_test_SDo2WKBNQXDk5Y",
    "keySecret": "RrgfT3oxbJdaeHSzvuzaJRZf",
    "paymentMethodId": "razorpay",
    "enabled": true
  },
  "tapConfig": {
    "SecretKey": "sk_test_XKokBfNWv6FIYuTMg5sLPjhJ",
    "paymentMethodId": "tap",
    "enabled": true
  },
  "mercadoPagoConfig": {
    "accessToken": "TEST-5726912977510261-102413-65873095dc5b0a877969b7f6ffcceee4-613803978",
    "production": false,
    "paymentMethodId": "woo-mercado-pago-basic",
    "enabled": true
  },
  "defaultCountryShipping": [
    {
      "name": "United Stated",
      "iosCode": "US",
      "icon": "https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png"
    }
  ],
  "afterShip": {
    "api": "e4bee949914ed4d22ad9657db3d245682",
    "tracking_url": "https://allkartusa8s.aftership.com"
  },
  "productDetail": {
    "height": 0.4,
    "marginTop": 0,
    "safeArea": false,
    "showVideo": true,
    "showBrand": true,
    "showThumbnailAtLeast": 1,
    "layout": "simpleType",
    "borderRadius": 3,
    "enableReview": false,
    "attributeImagesSize": 50,
    "showSku": true,
    "showStockQuantity": true,
    "showProductCategories": true,
    "showProductTags": true,
    "hideInvalidAttributes": false
  },
  "productVariantLayout": {
    "color": "color",
    "size": "box",
    "height": "option",
    "color-image": "image"
  },
  "productAddons": {
    "allowImageType": true,
    "allowVideoType": true,
    "allowCustomType": true,
    "allowedCustomType": [
      "png",
      "pdf",
      "docx"
    ],
    "allowMultiple": false,
    "fileUploadSizeLimit": 5
  },
  "cartDetail": {
    "minAllowTotalCartValue": 0,
    "maxAllowQuantity": 10
  },
  "productVariantLanguage": {
    "en": {
      "color": "Color",
      "size": "Size",
      "height": "Height",
      "color-image": "Color"
    }
  },
  "excludedCategory": 311,
  "saleOffProduct": {
    "ShowCountDown": true,
    "Color": "#C7222B"
  },
  "notStrictVisibleVariant": true,
  "configChat": {
    "EnableSmartChat": true,
    "showOnScreens": ["profile"],
    "hideOnScreens": [],
    "version": "2",
  },
  "smartChat": [
    {
      "app": "https://wa.me/17864848787",
      "iconData": "whatsapp",
      "description": "WhatsApp"
    },
    {"app": "tel:17864848787", "iconData": "phone", "description": "Call Us"},
    {"app": "sms://17864848787", "iconData": "sms", "description": "Send SMS"}
  ],
  "adminEmail": "allkartusa@gmail.com",
  "adminName": "Customer Service",
  "vendorConfig": {
    "VendorRegister": true,
    "DisableVendorShipping": false,
    "ShowAllVendorMarkers": true,
    "DisableNativeStoreManagement": true,
    "dokan": "my-account?vendor_admin=true",
    "wcfm": "store_manager?vendor_admin=true"
  },
  "loadingIcon": {
    "type": "pulse",
    "size": 30
  }
};