import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:expensemanager/config/utils.dart';
import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/screens/categories/categories.dart';
import 'package:expensemanager/screens/filter/filter.dart';
import 'package:expensemanager/screens/screens.dart';
import 'package:expensemanager/services/database/filter_db.dart';
import 'package:expensemanager/services/services.dart';
import 'package:expensemanager/shared/shared.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

// import '../screens.dart';

// import 'package:transparent_image/transparent_image.dart';

// import '../../shared/expensemanager/expensemanager_appbar.dart';

class FilteredTransactionScreen extends StatefulWidget {
  static const String routeName = '/filtered-transaction';
  final DateTime selectedPrimaryDay;
  final DateTime selectedSecondaryDay;
  final List<String> mySelectedCategories;
  final String filterTransferType;
  final String filterWalletId;
  const FilteredTransactionScreen(
      {Key key,
      this.selectedPrimaryDay,
      this.selectedSecondaryDay,
      this.mySelectedCategories,
      this.filterTransferType,
      this.filterWalletId})
      : super(key: key);
  @override
  _FilteredTransactionScreenState createState() =>
      _FilteredTransactionScreenState();
}

class _FilteredTransactionScreenState extends State<FilteredTransactionScreen> {
  DateTime selectedPrimaryDay;
  DateTime selectedSecondaryDay;
  String filterTransferType;
  String filterWalletId;

  List<String> mySelectedCategories;
  double bottomNavBarHeight = 60;

  CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    selectedPrimaryDay:
    widget.selectedPrimaryDay;
    selectedSecondaryDay:
    widget.selectedSecondaryDay;
    mySelectedCategories:
    widget.mySelectedCategories;
    filterTransferType:
    widget.filterTransferType;
    filterWalletId:
    widget.filterWalletId;
    super.initState();
    print({
      "widgetDate": widget.selectedPrimaryDay,
      "widgetDate2": widget.selectedSecondaryDay,
      "myselectedCate": widget.mySelectedCategories,
      "filter": widget.filterTransferType,
      "isFilteNull": widget.filterWalletId
    });
    // _navigationController = CircularBottomNavigationController(selectedPos);
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
          StreamProvider.value(
            value: FilterDatabaseService(user).filterTransaction(
                widget.selectedPrimaryDay,
                widget.selectedSecondaryDay,
                widget.mySelectedCategories,
                widget.filterTransferType,
                widget.filterWalletId),
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
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop()),
            elevation: 2,
            title: Text(
              S.of(context).filteredTitle,
              style: TextStyle(color: Colors.white),
            ),
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Theme.of(context).accentColor,
            centerTitle: true,
            automaticallyImplyLeading: false,
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
    // print(
    //   DailyFilteredList(widget.selectedPrimaryDay, widget.selectedSecondaryDay,
    //       widget.mySelectedCategories, widget.filterTransferType),
    // );
    if (widget.mySelectedCategories == null) {
      return Scaffold(
        // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        // floatingActionButton: AddTransactionFloatingButton(),
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
                    DailyFilteredList(
                        selectedPrimaryDay: widget.selectedPrimaryDay,
                        selectedSecondaryDay: widget.selectedSecondaryDay,
                        filterTransferType: widget.filterTransferType),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: AddTransactionFloatingButton(),
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
                  DailyFilteredList(
                      selectedPrimaryDay: widget.selectedPrimaryDay,
                      selectedSecondaryDay: widget.selectedSecondaryDay,
                      mySelectedCategories: widget.mySelectedCategories,
                      filterTransferType: widget.filterTransferType,
                      filterWalletId: widget.filterWalletId),
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
