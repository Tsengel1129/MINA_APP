import 'package:expensemanager/config/config.dart';
import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/services/category.dart';
import 'package:expensemanager/shared/animation/scaleRoute.dart';
import 'package:expensemanager/shared/dialogs/update_category_budget.dart';
import 'package:expensemanager/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../screens/screens.dart';
import '../../screens/screens.dart';

// ignore: camel_case_types
class BudgetScreen extends StatefulWidget {
  static const String routeName = '/budget';
  final selectedCategory;

  const BudgetScreen({Key key, this.selectedCategory}) : super(key: key);

  @override
  _BudgetClassState createState() => _BudgetClassState();
}

class _BudgetClassState extends State<BudgetScreen> {
// class BudgetClass extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Category selectedCategory;

  setDeleteCategory(Category value) => setState(() => selectedCategory = value);
  setUpdateCategory(Category value) => setState(() => selectedCategory = value);
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);

    // var balance = Provider.of<double>(context);
    // var expenses = Provider.of<List<Transaction>>(context);
    if (user != null
        // && balance != null && expenses != null
        ) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          // key: _scaffoldKey,
          appBar: AppBar(
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back, color: Colors.black),
            //   onPressed: () => Navigator.of(context).pop(),
            // ),
            elevation: 2,
            title: Text(S.of(context).settingsBudgetPreferences),
            backgroundColor: Colors.white,
            centerTitle: true,
            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(Icons.refresh),
            //     onPressed: () => resetCategories(categoryProvider),
            //   )
            // ],
            bottom: TabBar(
              indicatorColor: Theme.of(context).accentColor,
              tabs: <Widget>[
                Tab(
                  child: Text(S.of(context).categoriesScreenTabBarTextIncome),
                ),
                Tab(
                  child: Text(S.of(context).categoriesScreenTabBarTextExpense),
                ),
              ],
            ),
          ),
          body: Builder(
            builder: (context) => TabBarView(
              children: <Widget>[
                ListView(children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ...buildIncome(
                        context,
                        categoryProvider,
                        categoryProvider.categories
                            .where((x) => x.type == 'income'),
                      ),
                    ],
                  ),
                ]),
                ListView(
                  children: <Widget>[
                    // Container(
                    //   margin: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                    // ),
                    new Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ...buildExpense(
                            context,
                            categoryProvider,
                            categoryProvider.categories
                                .where((x) => x.type == 'expense'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

      // InkWell(
      //     onTap: () {
      //       showModalBottomSheet(
      //         context: context,
      //         isScrollControlled: true,
      //         builder: (context) => UpdateBudgetDialog(
      //           initialValue: user.budget,
      //         ),
      //       );
      //     },
      //     child: GestureDetector(
      //       onLongPress: () =>
      //           Navigator.push(context, ScaleRoute(page: WalletScreen())),
      //       child: Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 20),
      //         padding: const EdgeInsets.all(25),
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //           color: Theme.of(context).accentColor,
      //           borderRadius: BorderRadius.circular(10),
      //         ),
      //         child: Row(
      //           children: <Widget>[
      //             Expanded(
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: <Widget>[
      //                   Text(
      //                     S
      //                         .of(context)
      //                         .expenseManagerOverviewTextBalanceHeading,
      //                     style: TextStyle(
      //                       fontSize: 12,
      //                       color: Colors.white,
      //                       fontWeight: FontWeight.w700,
      //                     ),
      //                   ),
      //                   SizedBox(height: 4),
      //                   // Text(
      //                   //   formatAmount(user, balance),
      //                   //   style: TextStyle(
      //                   //     fontSize: 30,
      //                   //     color: Colors.white,
      //                   //     fontWeight: FontWeight.w800,
      //                   //   ),
      //                   // ),
      //                   SizedBox(height: 8),
      //                   // (user.budget != null)
      //                   //     ? Text(
      //                   //         S
      //                   //             .of(context)
      //                   //             .expenseManagerOverviewTextBudgetSet(
      //                   //               user.currency.symbol,
      //                   //               calculateAbsoluteSum(expenses)
      //                   //                   .toStringAsFixed(2),
      //                   //               user.budget.toStringAsFixed(2),
      //                   //               DateFormat('MMMM y')
      //                   //                   .format(DateTime.now()),
      //                   //             ),
      //                   //         style: TextStyle(
      //                   //           fontSize: 12,
      //                   //           color: Colors.white,
      //                   //           fontWeight: FontWeight.w500,
      //                   //         ),
      //                   //       )
      //                   //     : Text(
      //                   //         S
      //                   //             .of(context)
      //                   //             .expenseManagerOverviewTextBudgetUnset,
      //                   //         style: TextStyle(
      //                   //           fontSize: 12,
      //                   //           color: Colors.white,
      //                   //           fontWeight: FontWeight.w500,
      //                   //         ),
      //                   //       ),
      //                 ],
      //               ),
      //             ),
      //             SizedBox(width: 60),
      //             // (user.budget != null)
      //             //     ? buildBudgetMeter(context, expenses, user)
      //             //     : Icon(Icons.category, size: 60, color: Colors.white),
      //           ],
      //         ),
      //       ),
      //     ));
    }

    return Container();
  }

  List<Widget> buildIncome(
    BuildContext context,
    CategoryProvider categoryProvider,
    Iterable<Category> categories,
  ) {
    return categories
        // .where((x) => x.priority == "Necessary")
        .map((x) => Container(
            margin: EdgeInsets.all(10),
            child: InkWell(
                onTap: () => setState(() {
                      setUpdateCategory(x);
                      print({"myUpdatedCatBudget": x.toJson()});

                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => UpdateCategoryBudgetDialog(
                            'income', selectedCategory),
                      );
                    }),
                child: Container(
                    key: Key(x.id),
                    margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: InkWell(
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              color: expenseManagerBlue.withOpacity(0.15),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                    'assets/categories/${x.icon}',
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  child: Text(
                                    x.name,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: SizedBox(
                                      height: 20,
                                      width: MediaQuery.of(context).size.width *
                                          0.49,
                                      child: Stack(
                                        children: <Widget>[
                                          SizedBox.expand(
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                child: (x.budget != "0.0" &&
                                                        x.usedBudget != "0.0")
                                                    ? LinearProgressIndicator(
                                                        value: roundDouble(
                                                            (double.parse(x
                                                                    .usedBudget) /
                                                                double.parse(
                                                                    x.budget)),
                                                            2),
                                                        valueColor:
                                                            new AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Color(
                                                                    0xff00ff00)),
                                                        backgroundColor:
                                                            Color(0xffD6D6D6),
                                                      )
                                                    : LinearProgressIndicator(
                                                        value: 0.0,
                                                        valueColor:
                                                            new AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Color(
                                                                    0xff00ff00)),
                                                        backgroundColor:
                                                            Color(0xffD6D6D6),
                                                      )),
                                          ),
                                          Center(
                                              child: (x.budget != "0.0" &&
                                                      x.usedBudget != "0.0")
                                                  ? Text(((double.parse(x
                                                                  .usedBudget) *
                                                              100 /
                                                              double.parse(
                                                                  x.budget))
                                                          .toString() +
                                                      "%"))
                                                  : Text("0.0%")),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )))))
        .toList();
  }

  List<Widget> buildExpense(
    BuildContext context,
    CategoryProvider categoryProvider,
    Iterable<Category> categories,
  ) {
    return categories
        .map((x) => InkWell(
            onTap: () => setState(() {
                  setUpdateCategory(x);
                  print({"myUpdatedCatBudget": x.toJson()});
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) =>
                        UpdateCategoryBudgetDialog('expense', selectedCategory),
                  );
                }),
            child: Container(
                key: Key(x.id),
                margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: InkWell(
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          color: expenseManagerBlue.withOpacity(0.15),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 30,
                              height: 30,
                              child: Image.asset(
                                'assets/categories/${x.icon}',
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              child: Text(
                                x.name,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(15.0),
                                child: SizedBox(
                                  height: 20,
                                  width:
                                      MediaQuery.of(context).size.width * 0.49,
                                  child: Stack(
                                    children: <Widget>[
                                      SizedBox.expand(
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            child: (x.budget != "0.0" &&
                                                    x.usedBudget != "0.0")
                                                ? LinearProgressIndicator(
                                                    value: roundDouble(
                                                        (double.parse(
                                                                x.usedBudget) /
                                                            double.parse(
                                                                x.budget)),
                                                        2),
                                                    valueColor:
                                                        new AlwaysStoppedAnimation<
                                                                Color>(
                                                            Color(0xff00ff00)),
                                                    backgroundColor:
                                                        Color(0xffD6D6D6),
                                                  )
                                                : LinearProgressIndicator(
                                                    value: 0.0,
                                                    valueColor:
                                                        new AlwaysStoppedAnimation<
                                                                Color>(
                                                            Color(0xff00ff00)),
                                                    backgroundColor:
                                                        Color(0xffD6D6D6),
                                                  )),
                                      ),
                                      Center(
                                          child: (x.budget != "0.0" &&
                                                  x.usedBudget != "0.0")
                                              ? Text(
                                                  ((double.parse(x.usedBudget) *
                                                              100 /
                                                              double.parse(
                                                                  x.budget))
                                                          .toString() +
                                                      "%"))
                                              : Text("0.0%")),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))))
        .toList();
  }

  CircleAvatar buildBudgetMeter(
    BuildContext context,
    List<Transaction> expenses,
    User user,
  ) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: (35 - 6).toDouble(),
        backgroundColor: Theme.of(context).accentColor,
        child: Text(
          ((calculateAbsoluteSum(expenses) / user.budget) * 100)
                  .toStringAsFixed(0) +
              '%',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
