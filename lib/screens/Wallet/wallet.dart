import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:expensemanager/config/utils.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/services/services.dart';
import 'package:expensemanager/shared/shared.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:transparent_image/transparent_image.dart';

// import '../../shared/expensemanager/expensemanager_appbar.dart';

class WalletScreen extends StatefulWidget {
  static const String routeName = '/wallet';

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int selectedPos = 1;

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
          StreamProvider<List<Wallet>>.value(
            value: WalletDatabaseService(user).walletsByMonth(DateTime.now()),
          ),
        ],
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            //side menu inside
            child: expenseManagerDrawer(),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: AddWalletFloatingButton(),
          body: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),

                //ExpenseAppBar(),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      DailyWalletList(),
                    ],
                  ),
                ),
              ],
            ),
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
}
