import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/services/category.dart';
import 'package:expensemanager/services/services.dart';
import 'package:expensemanager/shared/animation/exitRoute.dart';
import 'package:expensemanager/shared/animation/scaleRoute.dart';
import 'package:expensemanager/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:provider/provider.dart';

import '../../screens/home/home.dart';
import '../../screens/screens.dart';

class TransactionBottomSheet extends StatefulWidget {
  final Transaction transaction;

  const TransactionBottomSheet({
    Key key,
    this.transaction,
  }) : super(key: key);

  @override
  _TransactionBottomSheetState createState() => _TransactionBottomSheetState();
}

class _TransactionBottomSheetState extends State<TransactionBottomSheet> {
  String id;
  String id2;

  double amount;
  double amount2;

  String description;
  DateTime timestamp;
  Category selectedCategory;
  List<Wallet> grouped;
  var _descriptionNode = FocusNode();
  var _amountNode = FocusNode();
  String selectedWallet;
  String selectedWallet2;

  bool isExpense = true;
  bool isIncome = false;
  bool isWtoW = false;
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  setIsWtoW(bool value) => setState(() => isWtoW = value);
  setIsIncome(bool value) => setState(() => isIncome = value);

  setIsExpense(bool value) => setState(() => isExpense = value);
  bool get isKeyboardOpen => MediaQuery.of(context).viewInsets.bottom > 0;
  bool isNumeric(String s) => (s == null) ? false : double.tryParse(s) != null;

  @override
  void initState() {
    super.initState();
    var date = DateTime.now();
    setDate(date);

    if (widget.transaction != null) {
      id = widget.transaction.id;
      id2 = widget.transaction.id2;
      amount = widget.transaction.amount;
      amount2 = widget.transaction.amount2;
      _amountController.text = amount.abs().toStringAsFixed(0);
      timestamp = widget.transaction.timestamp;
      setDate(timestamp);
      description = widget.transaction.description;
      _descriptionController.text = description;
      selectedCategory = widget.transaction.category;
      isExpense = selectedCategory.type == 'expense';
    }
    var user = Provider.of<User>(context, listen: false);
    grouped = WalletDatabaseService(user).groupWalletsByDate(null);
  }

  setDate(DateTime date) {
    timestamp = date;
    _dateController.text = DateFormat().add_yMMMMd().format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.95,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: ListView(
        children: <Widget>[
          Text(
            (widget.transaction == null)
                ? S.of(context).transactionBottomSheetTextHeadingAdd
                : S.of(context).transactionBottomSheetTextHeadingUpdate,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          buildTypeSelector(),
          SizedBox(height: 20),
          Column(
            children: <Widget>[
              buildCategorySelector(),
              SizedBox(height: 20),
              dropDown(),
              TextField(
                onTap: () async {
                  var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1990),
                    lastDate: DateTime.now(),
                  );

                  if (date != null) {
                    setState(() => setDate(date));
                  }
                },
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: S.of(context).transactionBottomSheetLabelTextDate,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                focusNode: _amountNode,
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                onChanged: (v) => setState(() => amount = double.parse(v)),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    isExpense ? Icons.remove : Icons.add,
                    color: Theme.of(context).accentColor,
                  ),
                  labelText: S.of(context).transactionBottomTextAmount,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                focusNode: _descriptionNode,
                controller: _descriptionController,
                textCapitalization: TextCapitalization.words,
                onChanged: (v) => setState(() => description = v),
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(_amountNode),
                decoration: InputDecoration(
                  labelText:
                      S.of(context).transactionBottomSheetLabelTextDescription,
                ),
              ),
              SizedBox(height: 20),
              new expenseManagerButton(
                title: (widget.transaction == null)
                    ? S.of(context).transactionBottomSheetButtonTextAdd
                    : S.of(context).transactionBottomSheetButtonTextUpdate,
                onPressed: (this.selectedCategory != null &&
                        this.selectedWallet != null &&
                        this.description != null &&
                        this.amount != null)
                    ? this.addTransaction
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  addTransaction() async {
    // var categoryProvider = Provider.of<CategoryProvider>(context);

    FocusScope.of(context).unfocus();
    var user = Provider.of<User>(context, listen: false);
    var amout;
    if (selectedCategory.type == 'expense') {
      amout = amount * -1;
      Transaction transaction = Transaction(
        id: id,
        id2: '0',
        walletId: selectedWallet,
        walletId2: '0',
        amount: amout,
        amount2: 0,
        description: description,
        timestamp: timestamp,
        category: selectedCategory,
      );

      if (widget.transaction != null) {
        TransactionDatabaseService(user).updateTransaction(transaction);
      } else {
        TransactionDatabaseService(user).addTransaction(transaction);
      }
      UserDatabaseService(user).updateUserDefaultWallet(selectedWallet);
    }
    if (selectedCategory.type == 'income') {
      amout = amount * 1;
      Transaction transaction = Transaction(
        id: id,
        id2: '0',
        walletId: selectedWallet,
        walletId2: '0',
        amount: amout,
        amount2: 0,
        description: description,
        timestamp: timestamp,
        category: selectedCategory,
      );

      if (widget.transaction != null) {
        TransactionDatabaseService(user).updateTransaction(transaction);
      } else {
        TransactionDatabaseService(user).addTransaction(transaction);
      }
      UserDatabaseService(user).updateUserDefaultWallet(selectedWallet);
    }
    if (selectedCategory.type == 'transfer') {
      amout = amount * -1;

      Transaction transaction = Transaction(
        id: id,
        id2: id,
        walletId: selectedWallet,
        walletId2: selectedWallet2,
        amount: amout,
        amount2: amount * 1,
        description: description,
        timestamp: timestamp,
        category: selectedCategory,
      );

      if (widget.transaction != null) {
        if (selectedCategory.type == 'transfer') {
          TransactionDatabaseService(user).updateTransfer(transaction);
        }
      } else {
        TransactionDatabaseService(user).addTransfer(transaction);
      }
      UserDatabaseService(user).updateUserDefaultWallet(selectedWallet);
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
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
          var zailshgui = categoryProvider.categories
              .where((x) =>
                  x.priority ==
                  S.of(context).categoriesLabelTextCategoryTypeNecessary)
              .toList();
          var heregleenii = categoryProvider.categories
              .where((x) =>
                  x.priority ==
                  S.of(context).categoriesLabelTextCategoryTypeNeeds)
              .toList();
          var uzemjiin = categoryProvider.categories
              .where((x) =>
                  x.priority ==
                  S.of(context).categoriesLabelTextCategoryTypeAppearance)
              .toList();
          return Container(
            height: MediaQuery.of(context).size.height / 3.6,
            child: Container(
              width: double.infinity,
              height: 80,
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 20, bottom: 5),
                    child: Text(
                      S.of(context).categoriesLabelTextCategoryTypeNecessary,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14.0, // insert your font size here
                      ),
                    ),
                  ),
                  GridView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemCount: zailshgui.length,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var x = zailshgui[index];
                      return CategorySelector(
                        category: x,
                        isSelected: x.name == selectedCategory?.name,
                        onPressed: () => setState(() => selectedCategory = x),
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 20, bottom: 5),
                    child: Text(
                      S.of(context).categoriesLabelTextCategoryTypeNeeds,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14.0, // insert your font size here
                      ),
                    ),
                  ),
                  GridView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemCount: heregleenii.length,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var x = heregleenii[index];
                      return CategorySelector(
                        category: x,
                        isSelected: x.name == selectedCategory?.name,
                        onPressed: () => setState(() => selectedCategory = x),
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 20, bottom: 5),
                    child: Text(
                      S.of(context).categoriesLabelTextCategoryTypeAppearance,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14.0, // insert your font size here
                      ),
                    ),
                  ),
                  GridView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemCount: uzemjiin.length,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var x = uzemjiin[index];
                      return CategorySelector(
                        category: x,
                        isSelected: x.name == selectedCategory?.name,
                        onPressed: () => setState(() => selectedCategory = x),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return Container(
          height: MediaQuery.of(context).size.height / 3.6,
          child: Container(
            width: double.infinity,
            height: 80,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 5),
              // itemExtent: 90,
              shrinkWrap: true,
              itemCount: categories.length,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var x = categories[index];
                return CategorySelector(
                  category: x,
                  isSelected: x.name == selectedCategory?.name,
                  onPressed: () => setState(() => selectedCategory = x),
                );
              },
            ),
          ),
        );
      } else {
        this.selectedCategory = Category(
            icon: "transfer/transfer.png",
            name: "transfer",
            type: "transfer",
            id: "transfer");

        return Container();
      }
    });
  }
  //   else {
  //     return Container(
  //       height: MediaQuery.of(context).size.height / 3.6,
  //     );
  //   }
  // }

  Widget dropDown() {
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

            if (isExpense || isIncome == true) {
              return new Container(
                padding: EdgeInsets.only(bottom: 16.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                        flex: 2,
                        child: new Container(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                          child: new Text(S
                              .of(context)
                              .transactionBottomSheetButtonChooseWallet),
                        )),
                    new Expanded(
                      flex: 4,
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
                          value: selectedWallet,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              selectedWallet = newValue;
                              print(selectedWallet);
                            });
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
                  ],
                ),
              );
            } else {
              // setIsWtoW(true);
              // () => setState(() => isWtoW == true);
              return new Container(
                padding: EdgeInsets.only(bottom: 16.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                        flex: 2,
                        child: new Container(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                          child: new Text(S
                              .of(context)
                              .transactionBottomSheetButtonTextAccountExpense),
                        )),
                    new Expanded(
                      flex: 4,
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
                          value: selectedWallet,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              selectedWallet = newValue;
                              print(selectedWallet);
                            });
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
                    SizedBox(height: 20),
                    new Expanded(
                        flex: 2,
                        child: new Container(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                          child: new Text(S
                              .of(context)
                              .transactionBottomSheetButtonTextAccountIncome),
                        )),
                    new Expanded(
                      flex: 4,
                      child: new InputDecorator(
                        decoration: const InputDecoration(
                          hintText: 'Хүлээн авах Дансаа сонгоно уу',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        child: new DropdownButton(
                          underline: SizedBox(),
                          value: selectedWallet2,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              selectedWallet2 = newValue;
                              print(selectedWallet2);
                            });
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
                  ],
                ),
              );
            }
          }
        });
  }

  Container buildTypeSelector() {
    return Container(
      width: double.infinity,
      height: 45,
      child: Row(
        children: <Widget>[
          TransactionTypeSelector(
              title: S.of(context).transactionBottomSheetButtonTextExpense,
              isSelected: isExpense && !isIncome && !isWtoW,
              onPressed: () =>
                  {setIsExpense(true), setIsWtoW(false), setIsIncome(false)}),
          TransactionTypeSelector(
              title: S.of(context).transactionBottomSheetButtonTextIncome,
              isSelected: !isExpense && isIncome && !isWtoW,
              onPressed: () =>
                  {setIsExpense(false), setIsIncome(true), setIsWtoW(false)}),
          TransactionTypeSelector(
              title: "TRANSFER",
              isSelected: isWtoW || !isExpense && !isIncome,
              onPressed: () => {
                    setIsWtoW(true),
                    setIsExpense(false),
                    setIsIncome(false),
                  }),
        ],
      ),
    );
  }
}
