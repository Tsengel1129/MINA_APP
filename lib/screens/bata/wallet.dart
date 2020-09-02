import 'package:expensemanager/screens/Wallet/AddCardPage.dart';
import 'package:expensemanager/screens/Wallet/CardModel.dart';
import 'package:expensemanager/screens/Wallet/CardView.dart';
import 'package:expensemanager/screens/home/BottomNavbar.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      theme: ThemeData(),
      home: WalletScreen(),
      debugShowCheckedModeBanner: false,
    ));

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Миний данснууд',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 40, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // wallet shape
              Container(
                height: 210,
                child: CardView(CardModel(
                    available: 500000,
                    currency: '₮',
                    bankname: 'Хаан банк',
                    cardnumber: '1234 1234 4321 4321')),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => AddCardPage());
          Navigator.push(context, route);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
