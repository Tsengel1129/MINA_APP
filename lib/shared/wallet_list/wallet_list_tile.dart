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
          child: new Container(
              child:
                  Padding(padding: EdgeInsets.all(10), child: cards(context))),

          // child: Container(
          //   padding: const EdgeInsets.symmetric(vertical: 14),
          //   decoration: BoxDecoration(
          //     border: Border(
          //       bottom: BorderSide(
          //         color: Colors.grey.withOpacity(0.15),
          //       ),
          //     ),
          //   ),
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //     child: Row(
          //       children: <Widget>[
          //         // SizedBox(width: 10),
          //         // Expanded(child: buildMeta(context)),
          //         // buildAmount(user),
          //       ],
          //     ),
          //   ),
          // ),
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
    // card shape
    return GestureDetector(
      child: Container(
        height: (MediaQuery.of(context).size.height / 3),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      //cardModel- iin available haruulah
                      Text(
                        wallet.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      ),
                      //cardModel- iin currency haruulah
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    //cardModel- iin bankname haruulah
                    child: Text(
                      wallet.amount.toString() + wallet.currency,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FittedBox(
                    //cardModel- iin cardnumber haruulah
                    fit: BoxFit.contain,
                    child: Text(wallet.accountType,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              )
            ],
          ),
        ),
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
