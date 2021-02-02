import 'package:expensemanager/data/categories.dart';
import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/services/category.dart';
import 'package:expensemanager/services/database/filter_db.dart';
import 'package:expensemanager/services/services.dart';
import 'package:expensemanager/shared/shared.dart';
import 'package:flutter/material.dart' hide Key;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

// class myPie {
//   String name;
//   int value;

//   myPie(this.name, this.value);

//   factory myPie.fromJson(dynamic json) {
//     return myPie(json['name'] as String, json['value'] as int);
//   }

//   @override
//   String toString() {
//     return '{ ${this.name}, ${this.value} }';
//   }

//   @override
//   toList() {}
// }

class DailyTransactionList extends StatefulWidget {
  static const String routeName = '/filter';
  final List<PieChartSectionData> pieData;
  const DailyTransactionList({Key key, this.pieData}) : super(key: key);

  @override
  _DailyTransactionListState createState() => _DailyTransactionListState();
}

class _DailyTransactionListState extends State<DailyTransactionList> {
  int touchedIndex;
  List<dynamic> pieData = List<dynamic>();
  @override
  void dispose() {
    // _navigationController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    print({"myPie": pieData});

    super.initState();

    // _navigationController = CircularBottomNavigationController(selectedPos);
  }

  // List<PieChartSectionData> viewPoint() {
  //   print({"elopie": viewPoint});
  //   return List.generate(pieData.length, (i) {
  //     final isTouched = i == touchedIndex;
  //     final double fontSize = isTouched ? 25 : 16;
  //     final double radius = isTouched ? 60 : 50;

  //     return PieChartSectionData(
  //       color: Colors.blue,
  //       value: pieData[i].value,
  //       title: '${pieData[i].name}:\n${pieData[i].value}%',
  //       radius: MediaQuery.of(context).size.height * 0.12,
  //       titleStyle: TextStyle(
  //           fontSize: 15,
  //           fontWeight: FontWeight.bold,
  //           color: const Color(0xff4c3788)),
  //       titlePositionPercentageOffset: 0.6,
  //     );
  //   });
  // }

  Widget chart() {
    var user = Provider.of<User>(context);

    return Container(
      child: new StreamBuilder<List<dynamic>>(
        stream: FilterDatabaseService(user).getPieChart,
        builder: (context, snapshot) {
          if (snapshot.data == null) return Text("Loading...");
          // print({"finest": snapshot.data});

          return Expanded(
              child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(PieChartData(
                      pieTouchData:
                          PieTouchData(touchCallback: (PieTouchResponse) {
                        setState(() {
                          if (PieTouchResponse.touchInput is FlLongPressEnd ||
                              PieTouchResponse.touchInput is FlPanEnd) {
                            touchedIndex = -1;
                          } else {
                            touchedIndex = PieTouchResponse.touchedSectionIndex;
                          }
                        });
                      }),
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      // ignore: missing_return
                      sections: List.generate(snapshot.data.length, (index) {
                        int colorIndex = baseExpenseCategories.indexWhere(
                            (element) =>
                                element.name == snapshot.data[index]['name']);
                        // print({
                        //   "myColor": "0xff" +
                        //       baseExpenseCategories[colorIndex].color.toString()
                        // });
                        final isTouched = index == touchedIndex;
                        final double fontSize = isTouched ? 25 : 16;
                        final double radius = isTouched ? 40 : 30;
                        if (snapshot.data[index]['name'] == "No Expense") {
                          return PieChartSectionData(
                            color: Color(int.parse(("0xff737373"))),
                            value: 100,
                            title: "",
                            radius: radius,
                            titleStyle: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xffffffff)),
                          );
                        } else {
                          return PieChartSectionData(
                            color: Color(int.parse(("0xff" +
                                baseExpenseCategories[colorIndex]
                                    .color
                                    .toString()))),
                            value: double.parse(
                                snapshot.data[index]['usedBudget']),
                            title: snapshot.data[index]['name'],
                            radius: MediaQuery.of(context).size.height * 0.12,
                            titleStyle: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xffffffff)),
                          );
                        }
                      })))));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);

    return Column(children: [
      // Card(
      //   elevation: 5.0,
      //   color: Colors.grey[900],
      //   child: Row(
      //     children: <Widget>[
      //       const SizedBox(
      //         height: 18,
      //       ),
      //       Expanded(
      //         child: AspectRatio(
      //           aspectRatio: 1,
      //           child: Padding(
      //             padding: EdgeInsets.fromLTRB(
      //                 MediaQuery.of(context).size.width * 0.1, 0, 25.0, 0),
      //             child: Container(
      //               width: MediaQuery.of(context).size.width * 0.9,
      //               child: PieChart(
      //                 PieChartData(
      //                     pieTouchData:
      //                         PieTouchData(touchCallback: (pieTouchResponse) {
      //                       setState(() {
      //                         if (pieTouchResponse.touchInput
      //                                 is FlLongPressEnd ||
      //                             pieTouchResponse.touchInput is FlPanEnd) {
      //                           touchedIndex = -1;
      //                         } else {
      //                           touchedIndex =
      //                               pieTouchResponse.touchedSectionIndex;
      //                         }
      //                       });
      //                     }),
      //                     borderData: FlBorderData(
      //                       show: false,
      //                     ),
      //                     sectionsSpace: 15,
      //                     centerSpaceRadius: 40,
      //                     sections: this.pieData),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(
      //         width: 28,
      //       ),
      //     ],
      //   ),
      // ),

      Container(child: chart()),
      Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          child: Container(
              child: ListView(
            children: [
              StreamBuilder<List<Transaction>>(
                stream: TransactionDatabaseService(user).mainTransactions,
                builder: (context, snapshot) {
                  List<dynamic> listCategoryNames = [];

                  if (snapshot.hasData) {
                    if (snapshot.data.length == 0) {
                      FilterDatabaseService(user).dailyPieChart([
                        {
                          "name": "No Expense",
                          "budget": 100,
                          "id": "0",
                          "icon": "",
                          "type": "hooson",
                          "priority": "hooson",
                          "usedBudget": 0,
                        }
                      ]);

                      return NoTransactionsFound();
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
                    var grouped = TransactionDatabaseService(user)
                        .groupTransactionsByDate(snapshot.data);

                    // if (pieData.length != 0) {
                    //   pieData.clear();
                    //   List<Transaction> myGroup = snapshot.data.toList();

                    //   List<String> listCategoryNames = [];
                    //   int netTrxCount;
                    //   for (final e in myGroup) {
                    //     listCategoryNames.add(e.category.name);
                    //   }
                    //   netTrxCount = listCategoryNames.length;

                    //   var map = Map();
                    //   // var pieData = Map();
                    //   listCategoryNames.forEach((element) {
                    //     if (!map.containsKey(element)) {
                    //       map[element] = 1;
                    //     } else {
                    //       map[element] += 1;
                    //     }
                    //   });
                    //   var values = map.values;
                    //   var result =
                    //       values.reduce((sum, element) => sum + element);

                    //   map.forEach(
                    //       (k, v) => {pieData = myPie(k, v).toList()});
                    // }

                    List<Transaction> myGroup = snapshot.data.toList();
                    // print({"mylis": myGroup});

                    var groupedList = List<dynamic>();
                    List<Transaction> li = myGroup
                        .where((x) => x.category.type == 'expense')
                        .toList();

                    // print({"really": li?.isEmpty ?? false});
                    if (li.isEmpty == false &&
                        li[0].category.name != "No Expense") {
                      for (final e in li) {
                        if (baseExpenseCategories.any(
                            (element) => element.name == e.category.name)) {
                          listCategoryNames.add({
                            "name": e.category.name,
                            "budget": 10000,
                            "id": e.category.id,
                            "icon": e.category.icon,
                            "type": e.category.type,
                            "priority": e.category.priority,
                            "usedBudget": e.amount.toString(),
                            // "budget": double.parse(e.category.budget)
                          });

                          // print({"tuu": e.category.name});
                        }
                      }
                    } else {
                      listCategoryNames.add({
                        "name": "No Expense",
                        "budget": 100,
                        "id": "0",
                        "icon": "",
                        "type": "hooson",
                        "priority": "hooson",
                        "usedBudget": 0,
                      });
                    }

                    // if (li.isEmpty == true) {

                    // }
                    // listCategoryNames.forEach((category) => {
                    //       if (!map.containsKey(category['name']))
                    //         {
                    //           print({"allDt": category['name']})
                    //           // map[category['name']] +=
                    //           //     int.parse(category['value'])
                    //         }
                    //       else
                    //         {
                    //           // map[category['name']] +=
                    //           //     int.parse(category['value'])
                    //         }
                    //     });

                    Iterable<E> mapIndexed<E, T>(Iterable<T> items,
                        E Function(int index, T item) f) sync* {
                      var index = 0;

                      for (final item in items) {
                        yield f(index, item);
                        index = index + 1;
                      }
                    }

                    groupedList = mapIndexed(
                        listCategoryNames,
                        (index, item) => {
                              "id": item['id'],
                              "icon": item['icon'],
                              "name": item['name'],
                              "type": item['type'],
                              "priority": item['priority'].toString(),
                              "budget": item['budget'].toString(),
                              "usedBudget": item['usedBudget']
                            }).toList();
                    List<Category> list = categoryProvider.categories
                        .where((x) => x.type == 'expense')
                        .toList();

                    FilterDatabaseService(user).dailyPieChart(groupedList);

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
              ),
            ],
          )))
    ]);
  }
}

class NoTransactionsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
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
