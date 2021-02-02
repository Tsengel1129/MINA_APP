import 'package:expensemanager/config/config.dart';
import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/screens/screens.dart';
import 'package:expensemanager/services/services.dart';
import 'package:expensemanager/shared/animation/scaleRoute.dart';
import 'package:expensemanager/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../screens/home/home.dart';

class WalletListTile extends StatelessWidget {
  final Wallet wallet;

  WalletListTile(this.wallet) : super(key: Key(wallet.id));

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

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
          child: new Container(
              child:
                  Padding(padding: EdgeInsets.all(10), child: cards(context))),
        ),
      );
    }

    return Center(
      child: CircularProgressIndicator(),
    );
  }

  // delete wallet
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

  // Column buildMeta(BuildContext context) {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       SizedBox(height: 2),
  //       Row(
  //         children: <Widget>[
  //           Text(
  //             DateFormat().add_jm().format(wallet.timestamp),
  //             style: transactionSubtitleStyle,
  //           ),
  //           (wallet.name != null)
  //               ? Expanded(
  //                   flex: 1,
  //                   child: Text(
  //                     ' / ' + wallet.name,
  //                     overflow: TextOverflow.ellipsis,
  //                     style: transactionSubtitleStyle,
  //                   ),
  //                 )
  //               : Container(),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  // Text buildAmount(User user) {
  //   return Text(
  //     formatAmount(user, wallet.amount),
  //     style: transactionAmountStyle(
  //       (wallet.amount > 0) ? Colors.green[400] : Colors.red[700],
  //     ),
  //   );
  // }

  Widget cards(BuildContext context) {
    var user = Provider.of<User>(context);

    // card shape
    return GestureDetector(
      onTap: () {
        UserDatabaseService(user).updateUserDefaultWallet(wallet.walletId);
        Navigator.push(context, ScaleRoute(page: TransactionScreen()));
      },
      child: Container(
        height: (MediaQuery.of(context).size.height / 4),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          //circle 2 shapes on wallet
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                color: Colors.red.withOpacity(.8),
                                shape: BoxShape.circle),
                          ),
                          Transform.translate(
                            offset: Offset(-15, 0),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(.8),
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        //cardModel- currency
                        child: Text(
                          wallet.amount.toString() + ' ₮',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          //cardModel- account name
                          Text(
                            wallet.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      FittedBox(
                        //cardModel- accountType
                        fit: BoxFit.contain,
                        child: Text(wallet.accountType,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      // Padding(padding: EdgeInsets.only(bottom: 10))
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
