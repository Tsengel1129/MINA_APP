import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/services/database/filter_db.dart';
import 'package:expensemanager/services/services.dart';
import 'package:expensemanager/shared/shared.dart';
import 'package:flutter/material.dart' hide Key;
import 'package:provider/provider.dart';

class DailyFilteredList extends StatefulWidget {
  //TransactionList
  // final String date;
  // final Map<String, List<Transaction>> grouped;
  final DateTime selectedPrimaryDay;
  final DateTime selectedSecondaryDay;
  final List<String> mySelectedCategories;
  final String filterTransferType;
  final String filterWalletId;
  const DailyFilteredList(
      {this.selectedPrimaryDay,
      this.selectedSecondaryDay,
      this.mySelectedCategories,
      this.filterTransferType,
      this.filterWalletId});

  @override
  _DailyFilteredListState createState() => _DailyFilteredListState();
}

class _DailyFilteredListState extends State<DailyFilteredList> {
  // DailyFilteredList(selectedPrimaryDay, selectedPrimaryDay2,
  //     mySelectedCategories, filterTransferType);
  //DailyTransactionList
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return StreamBuilder<List<Transaction>>(
      stream: FilterDatabaseService(user).filterTransaction(
          widget.selectedPrimaryDay,
          widget.selectedSecondaryDay,
          widget.mySelectedCategories,
          widget.filterTransferType,
          widget.filterWalletId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            print("empty");

            return NoTransactionsFound();
          }

          if (snapshot.hasError) {
            print("errorha");
            return Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  'Уучлаарай ямар нэг зүйл буруу байна. Та дахин оролдоно уу!!',
                ),
              ),
            );
          }
          print("mall");
          var grouped = FilterDatabaseService(user)
              .groupTransactionsByFilter(snapshot.data);

          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: grouped.keys.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.white,
                child: TransactionList(
                  date: grouped.keys.elementAt(index),
                  grouped: grouped,
                ),
              );
            },
          );
        }

        return Container();
      },
    );
  }
}

// class NoTransactionsFound extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(30),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           SizedBox(height: 20),
//           Image.asset(
//             'assets/images/money_man.png',
//             width: MediaQuery.of(context).size.width * 0.5,
//           ),
//           SizedBox(height: 40),
//           Text(
//             S.of(context).homeDailyNoTransactionsTextTitle,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           SizedBox(height: 15),
//           Text(
//             S.of(context).homeDailyNoTransactionsTextSubtitle,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
