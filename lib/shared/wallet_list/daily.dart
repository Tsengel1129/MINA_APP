import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/services/services.dart';
import 'package:expensemanager/shared/shared.dart';
import 'package:expensemanager/shared/wallet_list/wallet_list.dart';
import 'package:flutter/material.dart' hide Key;
import 'package:provider/provider.dart';

class DailyWalletList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return StreamBuilder<List<Wallet>>(
      stream: WalletDatabaseService(user).wallets,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return NoWalletsFound();
          }

          if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  'Уучлаарай ямар нэг зүйл буруу байна. Та дахин оролдоно уу!!',
                ),
              ),
            );
          }

          var grouped =
              WalletDatabaseService(user).groupWalletsByDate(snapshot.data);

          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: grouped.keys.length,
            itemBuilder: (context, index) {
              return WalletList(
                date: grouped.keys.elementAt(index),
                grouped: grouped,
              );
            },
          );
        }

        return Container();
      },
    );
  }
}

class NoWalletsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 20),
          Image.asset(
            'assets/images/money_man.png',
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          SizedBox(height: 40),
          Text(
            S.of(context).homeDailyNoTransactionsTextTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15),
          Text(
            S.of(context).homeDailyNoTransactionsTextSubtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
