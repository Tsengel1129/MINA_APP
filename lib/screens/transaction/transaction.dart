import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:expensemanager/config/utils.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/screens/categories/categories.dart';
import 'package:expensemanager/screens/filter/filter.dart';
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

class TransactionScreen extends StatefulWidget {
  static const String routeName = '/transaction';

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
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
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop()),
            elevation: 2,
            // title: Text(
            //   S.of(context).filteredTitle,
            //   style: TextStyle(color: Colors.white),
            // ),
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Theme.of(context).accentColor,
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          drawer: Drawer(
            //side menu inside
            child: expenseManagerDrawer(),
          ),
          body: Stack(
            children: <Widget>[
              Padding(
                child: myHomeScreenWidget(),
                padding: EdgeInsets.only(bottom: bottomNavBarHeight),
              ),
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
            Expanded(
              child: Column(
                children: <Widget>[
                  // expenseManagerOverview(),
                  MainDailyTransactionList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _navigationController?.dispose();

    super.dispose();
  }
}
