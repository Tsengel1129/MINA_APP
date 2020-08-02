import 'package:expensemanager/screens/Wallet/wallet.dart';
import 'package:expensemanager/screens/categories/categories.dart';
import 'package:expensemanager/screens/filter/filter.dart';
import 'package:expensemanager/screens/home/home.dart';
import 'package:expensemanager/screens/settings/settings.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  Color _iconColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: EdgeInsets.only(top: 5, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.home,
                  size: 30, color: Theme.of(context).accentColor),
              onPressed: () {
                //home icon -> main.dart
                Route route =
                    MaterialPageRoute(builder: (context) => HomeScreen());
                Navigator.push(context, route);
                /*setState(() {
                  _iconColor = Theme.of(context).accentColor;
                });*/
              }),
          //route screens names to main (main)
          IconButton(
              icon: Icon(Icons.category, size: 30, color: _iconColor),
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (context) => CategoriesScreen());
                Navigator.push(context, route);
                setState(() {
                  _iconColor = Theme.of(context).accentColor;
                });
              }),

          /*IconButton(
              icon: Icon(Icons.account_balance_wallet,
                  size: 30, color: _iconColor),
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (context) => WalletScreen());
                Navigator.push(context, route);
              }),*/
          IconButton(
              icon: Icon(Icons.settings, size: 30, color: _iconColor),
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (context) => SettingsScreen());
                Navigator.push(context, route);
              }),
        ],
      ),
    );
  }
}
