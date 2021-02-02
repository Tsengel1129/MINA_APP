import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/services/currency.dart';
import 'package:expensemanager/services/services.dart';
import 'package:expensemanager/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  double bankId;
  String walletId;
  String accountType;
  //String currency;

  var _nameNode = FocusNode();
  var _bankNameNode = FocusNode();
  var _amountNode = FocusNode();
  var _bankIdNode = FocusNode();
  var _accountTypeNode = FocusNode();
  bool isExpense = true;
  bool isWtoW = false;

  TextEditingController _nameController = TextEditingController();

  TextEditingController _amountController = TextEditingController();
  TextEditingController _bankIdController = TextEditingController();

  TextEditingController _dateController = TextEditingController();

  setIsExpense(bool value) => setState(() => isExpense = value);
  setIsWtoW(bool value) => setState(() => isWtoW = value);

  bool get isKeyboardOpen => MediaQuery.of(context).viewInsets.bottom > 0;
  bool isNumeric(String s) => (s == null) ? false : double.tryParse(s) != null;
  // var isButtonEnabled = false;
  @override
  void initState() {
    super.initState();

    var date = DateTime.now();
    setDate(date);

    if (widget.wallet != null) {
      id = widget.wallet.id;
      bankId = widget.wallet.bankId;
      amount = widget.wallet.amount;
      _amountController.text = amount.abs().toStringAsFixed(0);
      _bankIdController.text = bankId.abs().toStringAsFixed(0);
      accountType = widget.wallet.accountType.toString();

      timestamp = widget.wallet.timestamp;
      setDate(timestamp);
      name = widget.wallet.name;
      _nameController.text = name;
    }
    // checkNull();
  }

  setDate(DateTime date) {
    timestamp = date;
    _dateController.text = DateFormat().add_yMMMMd().format(date);
  }

  // void checkNull() {
  //   if ((_nameController.text.trim() != '') &&
  //       (_amountController.text.trim() != '') &&
  //       (_bankIdController.text.trim() != '')) {
  //     setState(() {
  //       isButtonEnabled = true;
  //     });
  //   } else {
  //     setState(() {
  //       isButtonEnabled = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.85,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              (widget.wallet == null)
                  ? S.of(context).walletBottomSheetTextHeadingAdd
                  : S.of(context).walletBottomSheetTextHeadingUpdate,
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
                SizedBox(height: 20),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      // input bank name
                      prefixIcon: Icon(
                        isExpense ? Icons.remove : Icons.add,
                        color: Theme.of(context).accentColor,
                      ),
                      labelText: S.of(context).walletBottomSheetType,
                    ),
                    focusNode: _accountTypeNode,
                    focusColor: Colors.red,
                    value: accountType,
                    onChanged: (dynamic val) {
                      setState(() {
                        accountType = val;
                        // checkNull();
                      });
                    },
                    items: [
                      S.of(context).walletBottomSheetLabelTextSaving,
                      S.of(context).walletBottomSheetLabelTextCash,
                      S.of(context).walletBottomSheetLabelTextBankAccount,
                      S.of(context).walletBottomSheetLabelTextLoanAccount,
                    ].map(
                      (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onTap: () {
                      setState(() {
                        _accountTypeNode.requestFocus();
                        // checkNull();
                      });
                    }),
                // DropdownButton(
                //         hint: accountType == null
                //             ? Text('Дансны төрөл')
                //             : Text(
                //                 accountType,
                //                 style: TextStyle(color: Colors.black),
                //               ),
                //         isExpanded: true,
                //         iconSize: 30.0,
                //         style: TextStyle(color: Colors.black),
                //         items: [
                //           'Цалингийн данс',
                //           'Хугацаатай хадгаламж',
                //           'Хугацаагүй хадгаламж',
                //           'Түрийвч'
                //         ].map(
                //           (val) {
                //             return DropdownMenuItem<String>(
                //               value: val,
                //               child: Text(val),
                //             );
                //           },
                //         ).toList(),
                //         onChanged: (val) {
                //           setState(() => accountType = val);
                //         },
                //       ),

                SizedBox(height: 20),
                TextField(
                  focusNode: _bankIdNode,
                  controller: _bankIdController,
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false,
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  onChanged: (v) => setState(() => bankId = double.parse(v)),
                  decoration: InputDecoration(
                    // input account number
                    prefixIcon: Icon(
                      isExpense ? Icons.remove : Icons.add,
                      color: Theme.of(context).accentColor,
                    ),
                    labelText: S.of(context).walletBottomSheetLabelTextAmount,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  focusNode: _nameNode,
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                  onChanged: (v) => setState(() => name = v),
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(_amountNode),
                  decoration: InputDecoration(
                    // input bank name
                    prefixIcon: Icon(
                      isExpense ? Icons.remove : Icons.add,
                      color: Theme.of(context).accentColor,
                    ),
                    labelText: S.of(context).walletBottomSheetLabelDescription,
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
                    // input account balance
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
                      // checkNull();
                    }
                  },
                  controller: _dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText:
                        S.of(context).transactionBottomSheetLabelTextDate,
                  ),
                ),
                //we don't choose currency when we add wallet
                /*RaisedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => CurrencyWidget(context),
                  );
                },
                textColor: Colors.white,
                color: Colors.red,
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "Мөнгөн тэмдэгт сонгох",
                ),
              ),*/
                SizedBox(height: 20),
                expenseManagerButton(
                  title: (widget.wallet != null)
                      ? S.of(context).transactionBottomSheetButtonTextUpdate
                      : S.of(context).transactionBottomSheetButtonTextAdd,
                  onPressed: (this.bankId != null &&
                          this.amount != null &&
                          this.accountType != null &&
                          this.name != null)
                      ? this.addWallet
                      : null,
                  // isButtonEnabled
                  //     ? () {
                  //         this.addWallet;
                  //       }
                  //     : null
                )
              ],
            ),
          ],
        )));
  }

  @override
  Widget CurrencyWidget(BuildContext context) {
    var currencyProvider = Provider.of<CurrencyProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: currencyProvider.currencies.length,
        itemBuilder: (context, index) => ListTile(
          leading: Text(
            currencyProvider.currencies[index].symbol,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).accentColor,
            ),
          ),
          title: Text(
            currencyProvider.currencies[index].name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          /*onTap: () {
            if (currency != null) {
              setState(
                  () => currency = currencyProvider.currencies[index].symbol);

              Navigator.pop(context);
            }
          },*/
        ),
      ),
    );
  }

  addWallet() async {
    FocusScope.of(context).unfocus();
    var user = Provider.of<User>(context, listen: false);

    Wallet wallet = Wallet(
      id: id,
      // walletId: id,
      amount: amount,
      name: name,
      timestamp: timestamp,
      bankId: bankId,
      accountType: accountType,
      //currency: currency
    );

    if (widget.wallet != null) {
      await WalletDatabaseService(user).updateWallet(wallet);
    } else {
      WalletDatabaseService(user).addWallet(wallet);
    }
    Navigator.pop(context);
  }
}
