import 'package:expensemanager/config/config.dart';
import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/services/services.dart';
import 'package:expensemanager/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WalletListTile extends StatelessWidget {
  final Wallet wallet;

  WalletListTile(this.wallet) : super(key: Key(wallet.id));

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    if (user != null) {
      return Dismissible(
        key: Key(wallet.id),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            WalletDatabaseService(user).deleteWallet(wallet);
          }
        },
        background: buildRightSwipeBackground(),
        child: InkWell(
          onLongPress: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => WalletBottomSheet(
                wallet: wallet,
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.15),
                ),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10),
                  Expanded(child: buildMeta(context)),
                  buildAmount(user),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Container buildRightSwipeBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Column buildMeta(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 2),
        Row(
          children: <Widget>[
            Text(
              DateFormat().add_jm().format(wallet.timestamp),
              style: transactionSubtitleStyle,
            ),
            (wallet.name != null)
                ? Expanded(
                    flex: 1,
                    child: Text(
                      ' / ' + wallet.name,
                      overflow: TextOverflow.ellipsis,
                      style: transactionSubtitleStyle,
                    ),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }

  Text buildAmount(User user) {
    return Text(
      formatAmount(user, wallet.amount),
      style: transactionAmountStyle(
        (wallet.amount > 0) ? Colors.green[400] : Colors.red[700],
      ),
    );
  }
}

class DateLabela extends StatelessWidget {
  final String date;

  const DateLabela(this.date);

  @override
  Widget build(BuildContext context) {
    return Text(
      date.toUpperCase(),
      style: TextStyle(
        fontSize: 13,
        color: Colors.grey,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
