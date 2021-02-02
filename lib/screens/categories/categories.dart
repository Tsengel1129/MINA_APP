import 'package:expensemanager/config/utils.dart';
import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/services/category.dart';
import 'package:expensemanager/shared/dialogs/add_category.dart';
import 'package:expensemanager/shared/dialogs/update_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = '/categories';

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Category selectedCategory;
  setDeleteCategory(Category value) => setState(() => selectedCategory = value);
  setUpdateCategory(Category value) => setState(() => selectedCategory = value);

  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back, color: Colors.black),
          //   onPressed: () => Navigator.of(context).pop(),
          // ),
          elevation: 0,
          title: Text(S.of(context).categoriesScreenAppBarTitle),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () => resetCategories(categoryProvider),
            )
          ],
          bottom: TabBar(
            indicatorColor: Theme.of(context).accentColor,
            tabs: <Widget>[
              Tab(
                child: Text(S.of(context).categoriesScreenTabBarTextIncome),
              ),
              Tab(
                child: Text(S.of(context).categoriesScreenTabBarTextExpense),
              ),
            ],
          ),
        ),
        body: Builder(
          builder: (context) => TabBarView(
            children: <Widget>[
              GridView.count(
                crossAxisCount: 4,
                children: <Widget>[
                  ...buildCategories(
                    categoryProvider,
                    categoryProvider.categories
                        .where((x) => x.type == 'income'),
                  ),
                  buildAddButton(() {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => AddCategoryDialog(
                        'income',
                        S.of(context).categoriesLabelTextCategoryTypeNecessary,
                      ),
                    );
                  })
                ],
              ),
              ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                    child: Text(
                      S.of(context).categoriesLabelTextCategoryTypeNecessary,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14.0, // insert your font size here
                      ),
                    ),
                  ),
                  new Container(
                    child: GridView.count(
                      crossAxisCount: 5,
                      physics:
                          NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                      shrinkWrap: true, // You won't see infinite size error
                      children: <Widget>[
                        ...buildZailshgui(
                          categoryProvider,
                          categoryProvider.categories
                              .where((x) => x.type == 'expense'),
                        ),
                        buildAddButton(() {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => AddCategoryDialog(
                              'expense',
                              S
                                  .of(context)
                                  .categoriesLabelTextCategoryTypeNecessary,
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                    child: Text(
                      S.of(context).categoriesLabelTextCategoryTypeNeeds,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14.0, // insert your font size here
                      ),
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 5,
                    physics:
                        NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                    shrinkWrap: true, // You won't see infinite size error
                    children: <Widget>[
                      ...buildHeregleenii(
                        categoryProvider,
                        categoryProvider.categories
                            .where((x) => x.type == 'expense'),
                      ),
                      buildAddButton(() {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => AddCategoryDialog(
                            'expense',
                            S.of(context).categoriesLabelTextCategoryTypeNeeds,
                          ),
                        );
                      })
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                    child: Text(
                      S.of(context).categoriesLabelTextCategoryTypeAppearance,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14.0, // insert your font size here
                      ),
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 5,
                    physics:
                        NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                    shrinkWrap: true, // You won't see infinite size error
                    children: <Widget>[
                      ...buildUzemjiin(
                        categoryProvider,
                        categoryProvider.categories
                            .where((x) => x.type == 'expense'),
                      ),
                      buildAddButton(() {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => AddCategoryDialog(
                            'expense',
                            S
                                .of(context)
                                .categoriesLabelTextCategoryTypeAppearance,
                          ),
                        );
                      })
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  resetCategories(CategoryProvider categoryProvider) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        S.of(context).categoriesScreenSnackbarTextResetCategoriesConfirmation,
      ),
      action: SnackBarAction(
          label:
              S.of(context).categoriesScreenSnackbarTextResetCategoriesAction,
          onPressed: () async {
            await categoryProvider.reset();

            _scaffoldKey.currentState.showSnackBar(SnackBar(
              duration: Duration(seconds: 2),
              content: Text(
                S
                    .of(context)
                    .categoriesScreenSnackbarTextResetCategoriesSuccess,
              ),
            ));
          }),
    ));
  }

  Widget buildAddButton(Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add,
              size: 20,
            ),
            SizedBox(height: 10),
            Text(
              S.of(context).categoriesScreenButtonTextAddNew,
              style: TextStyle(
                fontSize: 12.0, // insert your font size here
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialog(
      BuildContext context, CategoryProvider categoryProvider, Category x) {
    // Iterable<Category> categories;
    Widget cancelButton = FlatButton(
      child: Text(
        S.of(context).addCategoryBottomSheetButtonTextCancel,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget okButton = FlatButton(
      child: Text(
        S.of(context).addCategoryBottomSheetButtonTextAdd,
      ),
      onPressed: () async {
        {
          await categoryProvider.delete(x);
          Navigator.of(context).pop();

          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
              S.of(context).categoriesScreenSnackbarTextDeleteMessage,
              textAlign: TextAlign.center,
            ),
          ));
        }
      },
    );

    // set up the AlertDialog
    AlertDialog delete = AlertDialog(
      title: Text(
        S.of(context).categoriesScreenSnackbarTextDelete,
      ),
      content: Text(
        S.of(context).categoriesDeleteAreYouSure,
      ),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return delete;
      },
    );
  }

  // void deleteCategory(x) async {
  //   CategoryProvider categoryProvider;

  //   {
  //     await categoryProvider.delete(x);

  //     _scaffoldKey.currentState.showSnackBar(SnackBar(
  //       content: Text(
  //         S.of(context).categoriesScreenSnackbarTextDeleteMessage,
  //         textAlign: TextAlign.center,
  //       ),
  //     ));
  //   }
  // }

  List<Widget> buildCategories(
    CategoryProvider categoryProvider,
    Iterable<Category> categories,
  ) {
    return categories
        // .where((x) => x.priority == "Necessary")
        .map((x) => InkWell(
              onDoubleTap: () => setState(() {
                // print(x.toJson());
                setUpdateCategory(x);
                // print(selectedCategory.toJson());
                // print(selectedCategory.toJson());
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) =>
                      UpdateCategoryDialog('income', selectedCategory),
                );
              }),
              onLongPress: () => setState(() {
                print("incooome");
                setDeleteCategory(x);
                print("-----");
                // print(selectedCategory.toJson());
                showAlertDialog(context, categoryProvider, x);
              }),
              child: Container(
                key: Key(x.id),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: Colors.grey.withOpacity(0.15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 32,
                      child: Image.asset(
                        'assets/categories/${x.icon}',
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      S.of(context).categoryName(transformCategoryToKey(x)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ))
        .toList();
  }

  List<Widget> buildZailshgui(
    CategoryProvider categoryProvider,
    Iterable<Category> categories,
  ) {
    return categories
        .where(
          (x) =>
              x.priority ==
              S.of(context).categoriesLabelTextCategoryTypeNecessary,
        )
        .map((x) => InkWell(
              onDoubleTap: () => setState(() {
                // print(x.toJson());
                setUpdateCategory(x);
                // print(selectedCategory.toJson());
                // print(selectedCategory.toJson());
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) =>
                      UpdateCategoryDialog('expense', selectedCategory),
                );
              }),
              onLongPress: () => setState(() {
                print("-----");
                setDeleteCategory(x);
                print("-----");
                // print(selectedCategory.toJson());
                showAlertDialog(context, categoryProvider, x);
              }),
              child: Container(
                key: Key(x.id),
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: Colors.grey.withOpacity(0.15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 32,
                      child: Image.asset(
                        'assets/categories/${x.icon}',
                      ),
                    ),
                    // SizedBox(height: 12),
                    Text(
                      S.of(context).categoryName(transformCategoryToKey(x)),
                      style: TextStyle(
                        fontSize: 12.0, // insert your font size here
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ))
        .toList();
  }

  List<Widget> buildHeregleenii(
    CategoryProvider categoryProvider,
    Iterable<Category> categories,
  ) {
    return categories
        .where(
          (x) =>
              x.priority == S.of(context).categoriesLabelTextCategoryTypeNeeds,
        )
        .map((x) => InkWell(
              onDoubleTap: () => setState(() {
                // print(x.toJson());
                setUpdateCategory(x);
                // print(selectedCategory.toJson());
                // print(selectedCategory.toJson());
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) =>
                      UpdateCategoryDialog('expense', selectedCategory),
                );
              }),
              onLongPress: () => setState(() {
                print("-----");
                print("-----");
                // print(selectedCategory.toJson());
                showAlertDialog(context, categoryProvider, x);
              }),
              child: Container(
                key: Key(x.id),
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: Colors.grey.withOpacity(0.15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 32,
                      child: Image.asset(
                        'assets/categories/${x.icon}',
                      ),
                    ),
                    // SizedBox(height: 12),
                    Text(
                      S.of(context).categoryName(transformCategoryToKey(x)),
                      style: TextStyle(
                        fontSize: 12.0, // insert your font size here
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ))
        .toList();
  }

  List<Widget> buildUzemjiin(
    CategoryProvider categoryProvider,
    Iterable<Category> categories,
  ) {
    return categories
        .where(
          (x) =>
              x.priority ==
              S.of(context).categoriesLabelTextCategoryTypeAppearance,
        )
        .map((x) => InkWell(
              onDoubleTap: () => setState(() {
                // print(x.toJson());
                setUpdateCategory(x);
                // print(selectedCategory.toJson());
                // print(selectedCategory.toJson());
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) =>
                      UpdateCategoryDialog('expense', selectedCategory),
                );
              }),
              onLongPress: () => setState(() {
                print("-----");
                setDeleteCategory(x);
                print("-----");
                // print(selectedCategory.toJson());
                showAlertDialog(context, categoryProvider, x);
              }),
              child: Container(
                key: Key(x.id),
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: Colors.grey.withOpacity(0.15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 32,
                      child: Image.asset(
                        'assets/categories/${x.icon}',
                      ),
                    ),
                    // SizedBox(height: 12),
                    Text(
                      S.of(context).categoryName(transformCategoryToKey(x)),
                      style: TextStyle(
                        fontSize: 12.0, // insert your font size here
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ))
        .toList();
  }
}
