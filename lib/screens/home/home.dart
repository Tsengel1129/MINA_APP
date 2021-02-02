import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:expensemanager/config/utils.dart';
import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/screens/categories/categories.dart';
import 'package:expensemanager/screens/filter/filter.dart';
import 'package:expensemanager/screens/reminder/newScreen.dart';
import 'package:expensemanager/screens/screens.dart';
import 'package:expensemanager/services/services.dart';
import 'package:expensemanager/shared/shared.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

import '../screens.dart';

// import 'package:transparent_image/transparent_image.dart';

// import '../../shared/expensemanager/expensemanager_appbar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  final GlobalKey<ScaffoldState> scaffoldKey;

  HomeScreen({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Transaction transaction;

  int selectedPos = 0;
  double bottomNavBarHeight = 60;

  CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  Widget build(BuildContext context) {
    //var provider = Provider.of<BottomNavigationBarProvider>(context);
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    var user = Provider.of<User>(context);
    updateStatusBarColor(context);

    if (user != null) {
      _firebaseMessaging.getToken().then((token) {
        UserDatabaseService(user).updateUserPushToken(token);
      });

      return MultiProvider(
        providers: [
          StreamProvider<User>.value(
            value: UserDatabaseService(user).userDocument,
          ),
          StreamProvider<double>.value(
            value: TransactionDatabaseService(user).balance,
          ),
          StreamProvider<List<Transaction>>.value(
            value: TransactionDatabaseService(user)
                .expensesByMonth(DateTime.now()),
          ),
        ],
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            //side menu inside
            child: expenseManagerDrawer(),
          ),
          body: Stack(
            children: <Widget>[
              Padding(
                child: bodyContainer(),
                padding: EdgeInsets.only(bottom: bottomNavBarHeight),
              ),
              Align(
                  alignment: Alignment.bottomCenter, child: bottomNav(context))
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  Widget bodyContainer() {
    switch (selectedPos) {
      case 0:
        return myHomeScreenWidget();
        break;
      case 1:
        return filterSc();
        break;
      case 2:
        return transactionScreen();
        break;
      case 3:
        return WalletScreen();
        break;
      case 4:
        return SettingsScreen();
    }
    return Container();
  }

  Widget filterSc() {
    return Scaffold(body: FilterScreen());
  }

  Widget transactionScreen() {
    return Scaffold(body: TransactionBottomSheet());
  }

  Widget myHomeScreenWidget() {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: AddTransactionFloatingButton(),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            //ExpenseAppBar(),
            Expanded(child: DailyTransactionList()),
          ],
        ),
      ),
    );
  }

  Widget bottomNav(context) {
    return CircularBottomNavigation(
      List.of([
        new TabItem(Icons.home, S.of(context).textNavHome,
            Theme.of(context).accentColor,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor,
            )),
        new TabItem(Icons.search, S.of(context).textNavFilter,
            Theme.of(context).accentColor,
            labelStyle: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold)),
        new TabItem(Icons.add, S.of(context).textNavTransaction,
            Theme.of(context).accentColor,
            labelStyle: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold)),
        new TabItem(Icons.account_balance_wallet, S.of(context).textNavWallet,
            Theme.of(context).accentColor,
            labelStyle: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold)),
        //new TabItem(Icons.category, "Categories", Color(0xFF1B54A9),
        //  labelStyle:
        //    TextStyle(color: Color(0xFF1B54A9), fontWeight: FontWeight.bold)),
        new TabItem(Icons.settings, S.of(context).textNavSettings,
            Theme.of(context).accentColor,
            labelStyle: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold)),
      ]),
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        if (mounted) {
          setState(() {
            this.selectedPos = selectedPos;
            print(_navigationController.value);
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _navigationController?.dispose();
    super.dispose();
  }
}
