import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../models/entities/transaction.dart';
import '../../helpers/wallet_helpers.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    var icon = const Icon(CupertinoIcons.shopping_cart);
    var prefix = '-';
    if (transaction.isCredit) {
      icon = const Icon(CupertinoIcons.plus_circled);
      prefix = '+';
    } else if (transaction.isTransfer) {
      icon = const Icon(CupertinoIcons.arrowshape_turn_up_right_circle);
    }

    var title = transaction.details;
    if (transaction.isReceived) {
      title =
          'Received money from ${transaction.userCreate!.fullName.toUpperCase()}';
    }
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 20,
      minVerticalPadding: 4,
      minLeadingWidth: 24,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            transaction.createdTime ?? '',
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Theme.of(context).disabledColor),
          ),
          const SizedBox(height: 4),
          Text(
              'Wallet balance ${WalletHelpers.parseNumberToCurrencyText(transaction.balance)}'),
        ],
      ),
      trailing: Text(
        '$prefix ${WalletHelpers.parseNumberToCurrencyText(transaction.amount)}',
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      leading: icon,
    );
  }
}
