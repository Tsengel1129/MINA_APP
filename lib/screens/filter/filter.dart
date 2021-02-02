import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:expensemanager/config/colors.dart';
import 'package:expensemanager/config/utils.dart';
import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/models/user.dart';
import 'package:expensemanager/services/category.dart';
import 'package:expensemanager/services/services.dart';
import 'package:expensemanager/shared/animation/scaleRoute.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:expensemanager/shared/shared.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:radio_grouped_buttons/custom_buttons/custom_radio_buttons_group.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'filteredTransaction.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = '/filter';
  const FilterScreen({
    Key key,
  }) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  double bottomNavBarHeight = 60;

  int selectedPos = 2;
  bool selected = false;
  bool isExpense = true;
  bool isIncome = false;
  bool isWtoW = false;
  String filterWalletId;
  String selectedType;
  DateTime selectedPrimaryDay;
  DateTime selectedSecondaryDay;
  String filterTransferType;

  List<String> mySelectedCategories;
  // String selectedWallet;

  // DateTime timestamp;
  // setTransferType(String value) => setState(() => filterTransferType = value);

  setIsWtoW(bool value) => setState(() => isWtoW = value);
  setIsIncome(bool value) => setState(() => isIncome = value);

  setIsExpense(bool value) => setState(() => isExpense = value);
  CircularBottomNavigationController _navigationController;
  TextEditingController _dateController = TextEditingController();

  void initState() {
    // _range = '';

    selectedPrimaryDay = new DateTime(
        new DateTime.now().year,
        DateTime.now().month,
        new DateTime.now().subtract(const Duration(days: 7)).day);
    ;
    selectedSecondaryDay = new DateTime(
        new DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
    filterTransferType = '';
    setDate();
    super.initState();
    // var date = DateTime.now();
    // setDate(date);
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  List<String> buttonList = [
    "7 хоногоор",
    "Сараар",
    "Жилээр",
    "Дурын",
  ];
  // setDate(DateTime date) {
  //   timestamp = date;
  //   _dateController.text = DateFormat().add_yMMMMd().format(date);
  // }
  setDate() {
    _dateController.text =
        DateFormat('yyyy-MM-dd').format(selectedPrimaryDay).toString() +
            "--->" +
            DateFormat('yyyy-MM-dd').format(selectedSecondaryDay).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          S.of(context).filterTitle,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: submit(),
      body: new Padding(
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: Colors.grey.withOpacity(0.9),
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 160,
                      child: CustomRadioButton(
                          buttonLables: buttonList,
                          buttonValues: buttonList,
                          radioButtonValue: (value, index) {
                            if (mounted) {
                              setState(() {
                                selectedType = value;
                              });
                            }

                            print("Button value " + value.toString());
                            print("Integer value " + index.toString());
                          },
                          horizontal: true,
                          enableShape: true,
                          buttonSpace: 5,
                          buttonColor: Colors.white,
                          buttonWidth: 150,
                          selectedColor: Theme.of(context).accentColor),
                    ),
                    datePicker(),
                    buildTypeSelector(),
                    buildCategorySelector(),
                  ])),
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (mounted) {
      setState(() {
        if (args.value is PickerDateRange) {
          selectedPrimaryDay = args.value.startDate;
          selectedSecondaryDay = DateTime(args.value.endDate.year,
                  args.value.endDate.month, args.value.endDate.day + 1) ??
              DateTime(args.value.startDate.year, args.value.startDate.month,
                  args.value.startDate.day + 1);

          print({
            "startDate": selectedPrimaryDay,
            "endDate": selectedSecondaryDay
          });
          // limitLastDay = DateTime.fromMicrosecondsSinceEpoch(timestamp);

        }
      });
    }
  }

  void showAlertDialog(
    BuildContext context,
    // CategoryProvider categoryProvider, Category x
  ) {
    // Iterable<Category> categories;
    Widget cancelButton = FlatButton(
      child: Text("Цуцлах"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget okButton = FlatButton(
      child: Text("Тийм"),
      onPressed: () async {
        {
          setDate();
          Navigator.of(context).pop();

          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
              "Хугацаа сонгох",
              textAlign: TextAlign.center,
            ),
          ));
        }
      },
    );

    AlertDialog datePicker = AlertDialog(
      title: Text("Ангилал Устгах"),
      content: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.7,
          child: selector(context)),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return datePicker;
      },
    );
  }

  Widget selector(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          bottom: 0,
          child: SfDateRangePicker(
            onSelectionChanged: _onSelectionChanged,
            selectionMode: DateRangePickerSelectionMode.range,
            initialSelectedRange: PickerDateRange(
                DateTime.now().subtract(const Duration(days: 4)),
                DateTime.now().add(const Duration(days: 3))),
          ),
        )
      ],
    );
  }

  Widget datePicker() {
    if (selectedType == "Дурын") {
      return TextField(
        onTap: () => {
          if (mounted)
            {
              setState(() {
                // print(selectedCategory.toJson());
                showAlertDialog(context);
              })
            }
        },
        controller: _dateController,
        readOnly: true,
        decoration: InputDecoration(
          labelText: "Огноо",
        ),
      );
    }
    if (selectedType == "7 хоногоор") {
      var date = new DateTime.now();

      selectedPrimaryDay = DateTime(date.year, date.month, date.day - 7);
      selectedSecondaryDay = DateTime(date.year, date.month, date.day + 1);
    }
    if (selectedType == "Сараар") {
      var date = new DateTime.now();

      selectedPrimaryDay = DateTime(date.year, date.month - 1, date.day);
      selectedSecondaryDay = DateTime(date.year, date.month, date.day + 1);
    }
    if (selectedType == "Жилээр") {
      var date = new DateTime.now();

      selectedPrimaryDay = DateTime(
          date.subtract(const Duration(days: 365)).year, date.month, date.day);
      selectedSecondaryDay = DateTime(date.year, date.month, date.day + 1);
      print({
        "selectedPrimaryDay": selectedPrimaryDay,
        "selectedSecondaryDay": selectedSecondaryDay
      });
    }
    return Container();
  }

  Widget buildTypeSelector() {
    return Container(
      width: double.infinity,
      height: 45,
      child: Row(
        children: <Widget>[
          TransactionTypeSelector(
              title: S.of(context).transactionBottomSheetButtonTextExpense,
              isSelected: isExpense && !isIncome && !isWtoW,
              onPressed: () => {
                    setIsExpense(true),
                    setIsWtoW(false),
                    setIsIncome(false),
                    // setState(() {
                    //   filterTransferType = "expense";
                    //   print(filterTransferType);
                    // })
                  }),
          TransactionTypeSelector(
              title: S.of(context).transactionBottomSheetButtonTextIncome,
              isSelected: !isExpense && isIncome && !isWtoW,
              onPressed: () => {
                    setIsExpense(false),
                    setIsIncome(true),
                    setIsWtoW(false),
                    // setState(() {
                    //   filterTransferType = "income";
                    //   print(filterTransferType);
                    // })
                  }),
          TransactionTypeSelector(
              title: S.of(context).filterTransfer,
              isSelected: isWtoW || !isExpense && !isIncome,
              onPressed: () => {
                    setIsWtoW(true),
                    setIsExpense(false),
                    setIsIncome(false),
                    // setState(() {
                    //   filterTransferType = "transfer";
                    //   print(filterTransferType);
                    // })
                  }),
        ],
      ),
    );
  }

  Widget buildCategorySelector() {
    // if (isWtoW == false) {

    return Consumer<CategoryProvider>(builder: (context, categoryProvider, _) {
      var categories = categoryProvider.categories
          .where((x) => x.type == (isExpense ? 'expense' : 'income'))
          .toList();

      if (isExpense || isIncome == true) {
        if (isExpense == true && isIncome == false) {
          if (this.filterTransferType != "expense") {
            if (this.mySelectedCategories != null) {
              this.mySelectedCategories.clear();
            }
          }
          // if (this.mySelectedCategories != null) {
          //   this.mySelectedCategories.clear();
          // }
          this.filterTransferType = "expense";

          print({"filterTransferType": filterTransferType});

          return Expanded(
            // height: MediaQuery.of(context).size.height * 0.5,
            child: Container(
              // height: 80,
              child: ListView(
                children: <Widget>[
                  Container(
                    child: CheckboxGroup(
                      orientation: GroupedButtonsOrientation.VERTICAL,
                      onSelected: (List selected) => {
                        if (mounted)
                          {
                            setState(() {
                              mySelectedCategories = selected;
                              print("selectedCategories" +
                                  mySelectedCategories.toString());
                            }),
                          }
                      },
                      labels: [...categories.map((el) => el.name.toString())],
                      checked: mySelectedCategories,
                      itemBuilder: (Checkbox cb, Text txt, int i) {
                        return Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: InkWell(
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      color:
                                          expenseManagerBlue.withOpacity(0.15),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          cb,
                                          Container(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset(
                                              'assets/categories/${categories[i].icon}',
                                            ),
                                          ),
                                          Text(
                                            S.of(context).categoryName(
                                                transformCategoryToKey(
                                                    categories[i])),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (isExpense == false && isIncome == true && isWtoW == false) {
          if (this.filterTransferType != "income") {
            if (this.mySelectedCategories != null) {
              this.mySelectedCategories.clear();
            }
          }
          this.filterTransferType = "income";
          print({"filterTransferType": filterTransferType});

          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Container(
              // height: 80,
              child: ListView(
                children: <Widget>[
                  Container(
                    child: CheckboxGroup(
                      orientation: GroupedButtonsOrientation.VERTICAL,
                      onSelected: (List selected) => {
                        if (mounted)
                          {
                            setState(() {
                              mySelectedCategories = selected;
                              print("selectedCategories" +
                                  mySelectedCategories.toString());
                            }),
                          }
                      },
                      labels: [...categories.map((el) => el.name.toString())],
                      checked: mySelectedCategories,
                      itemBuilder: (Checkbox cb, Text txt, int i) {
                        return Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: InkWell(
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      color:
                                          expenseManagerBlue.withOpacity(0.15),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          cb,
                                          Container(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset(
                                              'assets/categories/${categories[i].icon}',
                                            ),
                                          ),
                                          Text(
                                            S.of(context).categoryName(
                                                transformCategoryToKey(
                                                    categories[i])),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));

                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: <Widget>[
                        //     Container(
                        //       alignment: Alignment.centerLeft,
                        //       height: 40,
                        //       child: Image.asset(
                        //         'assets/categories/${categories[i].icon}',
                        //       ),
                        //     ),
                        //     cb,
                        //     txt,
                        //   ],
                        // );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      } else if (isExpense == false && isIncome == false && isWtoW == true) {
        if (this.filterTransferType != "transfer") {
          if (this.mySelectedCategories != null) {
            this.mySelectedCategories.clear();
          }
        }
        this.mySelectedCategories = ["transfer"];
        this.filterTransferType = "transfer";

        var user = Provider.of<User>(context);

        return new StreamBuilder<List<Wallet>>(
            stream: WalletDatabaseService(user).wallets,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.length == 0) {
                  return NoWalletsFound();
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Уучлаарай ямар нэг зүйл буруу байна. Та дахин оролдоно уу!!',
                    ),
                  );
                }
                return new Container(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                          flex: 2,
                          child: new Container(
                            padding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                            child:
                                new Text(S.of(context).filterTransferAccount),
                          )),
                      new Expanded(
                        flex: 4,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: new InputDecorator(
                            decoration: const InputDecoration(
                              hintText: 'Дансаа сонгоно уу',
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            child: new DropdownButton(
                              underline: SizedBox(),
                              value: this.filterWalletId,
                              isDense: true,
                              onChanged: (String newValue) {
                                if (mounted) {
                                  setState(() {
                                    this.filterWalletId = newValue;
                                    print({"isdropnull": this.filterWalletId});
                                  });
                                }
                              },
                              items: snapshot.data.map((Wallet document) {
                                return DropdownMenuItem<String>(
                                    value: document.walletId,
                                    child: new Container(
                                      //color: primaryColor,
                                      child: new Text(document.name),
                                    ));
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );

                ;
              }
            });
      }
    });
  }

  Widget submit() {
    print({
      "selectedPrimaryDay1": selectedPrimaryDay,
      "selectedSecondaryDay1": selectedSecondaryDay,
      "mySelectedCategories1": mySelectedCategories,
      "filterTransferType1": filterTransferType,
      "filterWalletId1": filterWalletId,
    });
    return FloatingActionButton(
      onPressed: () {
        var user = Provider.of<User>(context, listen: false);

        // TransactionDatabaseService(user).updateFilterData(
        //     selectedPrimaryDay,
        //     selectedPrimaryDay,
        //     mySelectedCategories ?? [],
        //     filterTransferType,
        //     filterWalletId ?? '');

        Navigator.push(
            context,
            ScaleRoute(
                page: FilteredTransactionScreen(
                    selectedPrimaryDay: selectedPrimaryDay,
                    selectedSecondaryDay: selectedSecondaryDay,
                    mySelectedCategories: mySelectedCategories,
                    filterTransferType: filterTransferType,
                    filterWalletId: filterWalletId)));
      },
      elevation: 0,
      splashColor: Colors.white.withOpacity(0.5),
      backgroundColor: Theme.of(context).accentColor,
      foregroundColor: Colors.white,
      child: Icon(
        Icons.search,
        size: 32,
      ),
    );
  }

  @override
  void dispose() {
    _navigationController?.dispose();
    super.dispose();
  }
}
