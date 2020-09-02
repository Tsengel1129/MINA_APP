import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/services/services.dart';
import 'package:expensemanager/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WalletBottomSheet extends StatefulWidget {
  final Wallet wallet;

  const WalletBottomSheet({
    Key key,
    this.wallet,
  }) : super(key: key);

  @override
  _WalletBottomSheetState createState() => _WalletBottomSheetState();
}

class _WalletBottomSheetState extends State<WalletBottomSheet> {
  String id;
  double amount;
  String name;
  DateTime timestamp;

  var _nameNode = FocusNode();
  var _amountNode = FocusNode();

  bool isExpense = true;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  setIsExpense(bool value) => setState(() => isExpense = value);
  bool get isKeyboardOpen => MediaQuery.of(context).viewInsets.bottom > 0;
  bool isNumeric(String s) => (s == null) ? false : double.tryParse(s) != null;

  @override
  void initState() {
    super.initState();
    var date = DateTime.now();
    setDate(date);

    if (widget.wallet != null) {
      id = widget.wallet.id;
      amount = widget.wallet.amount;
      _amountController.text = amount.abs().toStringAsFixed(0);
      timestamp = widget.wallet.timestamp;
      setDate(timestamp);
      name = widget.wallet.name;
      _nameController.text = name;
    }
  }

  setDate(DateTime date) {
    timestamp = date;
    _dateController.text = DateFormat().add_yMMMMd().format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: ListView(
        children: <Widget>[
          Text(
            (widget.wallet == null)
                ? S.of(context).transactionBottomSheetTextHeadingAdd
                : S.of(context).transactionBottomSheetTextHeadingUpdate,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          // buildTypeSelector(),
          SizedBox(height: 20),
          Column(
            children: <Widget>[
              // buildCategorySelector(),
              SizedBox(height: 20),
              TextField(
                focusNode: _nameNode,
                controller: _nameController,
                textCapitalization: TextCapitalization.words,
                onChanged: (v) => setState(() => name = v),
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(_amountNode),
                decoration: InputDecoration(
                  labelText:
                      S.of(context).transactionBottomSheetLabelTextDescription,
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
                onChanged: (v) => setState(() => amount = double.parse(v)),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    isExpense ? Icons.remove : Icons.add,
                    color: Theme.of(context).accentColor,
                  ),
                  labelText:
                      S.of(context).transactionBottomSheetLabelTextAmount,
                ),
              ),
              SizedBox(height: 20),
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
              expenseManagerButton(
                  title: (widget.wallet == null)
                      ? S.of(context).transactionBottomSheetButtonTextAdd
                      : S.of(context).transactionBottomSheetButtonTextUpdate,
                  onPressed: this.addWallet),
            ],
          ),
        ],
      ),
    );
  }

  addWallet() async {
    FocusScope.of(context).unfocus();
    var user = Provider.of<User>(context, listen: false);

    Wallet wallet = Wallet(
      id: id,
      amount: amount,
      name: name,
      timestamp: timestamp,
    );

    if (widget.wallet != null) {
      WalletDatabaseService(user).updateWallet(wallet);
    } else {
      WalletDatabaseService(user).addWallet(wallet);
    }

    Navigator.pop(context);
  }

  // Widget buildCategorySelector() {
  //   return Consumer<CategoryProvider>(
  //     builder: (context, categoryProvider, _) {
  //       var categories = categoryProvider.categories
  //           .where((x) => x.type == (isExpense ? 'expense' : 'income'))
  //           .toList();

  //       return Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //                Row(
  //                   children: <Widget>[
  //                     Container(
  //                       width: 80,
  //                       height: 80,

  //                       decoration: BoxDecoration(
  //                         border: Border(
  //                           right: BorderSide(
  //                             width: 1,
  //                             color: Colors.grey.withOpacity(0.5),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(width: 10),
  //                   ],
  //                 ),
  //           Expanded(
  //             child: Container(
  //               width: double.infinity,
  //               height: 80,
  //               // child: ListView.builder(
  //               //   itemExtent: 90,
  //               //   shrinkWrap: true,
  //               //   itemCount: categories.length,
  //               //   scrollDirection: Axis.horizontal,
  //               //   physics: BouncingScrollPhysics(),
  //               //   itemBuilder: (context, index) {
  //               //     var x = categories[index];
  //               //     return CategorySelector(
  //               //       category: x,
  //               //       isSelected: x.name == selectedCategory?.name,
  //               //       onPressed: () => setState(() => selectedCategory = x),
  //               //     );
  //               //   },
  //               // ),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // Container buildTypeSelector() {
  //   return Container(
  //     width: double.infinity,
  //     height: 45,
  //     child: Row(
  //       children: <Widget>[
  //         WalletTypeSelector(
  //           title: S.of(context).walletBottomSheetButtonTextExpense,
  //           isSelected: isExpense,
  //           onPressed: () => setIsExpense(true),
  //         ),
  //         WalletTypeSelector(
  //           title: S.of(context).walletBottomSheetButtonTextIncome,
  //           isSelected: !isExpense,
  //           onPressed: () => setIsExpense(false),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
