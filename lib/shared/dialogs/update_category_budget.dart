import 'package:expensemanager/config/config.dart';
import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/services/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class UpdateCategoryBudgetDialog extends StatefulWidget {
  final String type;
  // final String budget;
  final Category selectedCategory;
  UpdateCategoryBudgetDialog(this.type, this.selectedCategory);
  @override
  _UpdateCategoryBudgetDialogState createState() =>
      _UpdateCategoryBudgetDialogState();
}

class _UpdateCategoryBudgetDialogState
    extends State<UpdateCategoryBudgetDialog> {
  String _selectedIcon;
  String name;
  String priority;
  String id;
  String budget;
  // String budget;
  // int dropDownIndex;
  var _budgetNode = FocusNode();
  var _priorityNode = FocusNode();
  String type;
  TextEditingController _budgetNodeController = TextEditingController();

  void initState() {
    super.initState();

    name = widget.selectedCategory.name;
    budget = widget.selectedCategory.budget;
    _budgetNodeController.text = budget;

    _selectedIcon = widget.selectedCategory.icon;
    priority = widget.selectedCategory.priority;
    id = widget.selectedCategory.id;
    type = widget.type;

    print(widget.selectedCategory.toJson());
  }

  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);
    // var type = widget.type == 'income'
    //     ? S.of(context).categoriesScreenTabBarTextIncome
    //     : S.of(context).categoriesScreenTabBarTextExpense;
    return (type == "income")
        ? Container(
            height: MediaQuery.of(context).size.height * 0.9,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            padding: const EdgeInsets.all(20),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Text(
                  S.of(context).addCategoryBottomSheetHeadingText(type),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 1,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(8.5),
                              child: Text(
                                "Ангиллын нэр",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight
                                        .w700 // insert your font size here
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                        SizedBox(width: 10),
                      ],
                    ),
                    Expanded(
                      child: Container(
                          height: 70,
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 16,
                              top: 10,
                            ),
                            child: DropdownButtonFormField(
                                // underline: Container(),
                                hint: new Text("Энд дарж сонгоно уу"),
                                isExpanded: true,
                                focusNode: _priorityNode,
                                focusColor: Colors.red,
                                value: priority,
                                onChanged: (dynamic val) {
                                  setState(() {
                                    // if (val != null) {
                                    priority = val;
                                    // }
                                    // priority = widget.selectedCategory.priority;
                                    // checkNull();
                                  });
                                },
                                items: [
                                  S
                                      .of(context)
                                      .categoriesLabelTextCategoryTypeAppearance,
                                  S
                                      .of(context)
                                      .categoriesLabelTextCategoryTypeNecessary,
                                  S
                                      .of(context)
                                      .categoriesLabelTextCategoryTypeNeeds,
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
                                    _priorityNode.requestFocus();
                                    // checkNull();
                                  });
                                }),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 1,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                "Төсөвлөгдсөн дүн",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight
                                        .w700 // insert your font size here
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                        SizedBox(width: 10),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 16,
                          top: 5,
                        ),
                        height: 70,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^[1-9][0-9]*$')),
                          ],
                          focusNode: _budgetNode,
                          controller: _budgetNodeController,
                          onChanged: (v) => setState(() => budget = v),
                          onEditingComplete: () =>
                              FocusScope.of(context).requestFocus(_budgetNode),
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  top: 10,
                                  bottom: 10), // add padding to adjust icon
                              child: Image.asset(
                                  'assets/categories/$_selectedIcon'),
                            ),
                            suffixText: "₮",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    FlatButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      textColor: Colors.red[600],
                      icon: Icon(Icons.clear),
                      label: Text(
                        S.of(context).addCategoryBottomSheetButtonTextCancel,
                      ),
                    ),
                    FlatButton.icon(
                      onPressed: () {
                        if (name.isEmpty) return;

                        categoryProvider.update(Category(
                            id: id,
                            icon: _selectedIcon,
                            name: name,
                            type: widget.type,
                            priority: priority,
                            budget: budget,
                            usedBudget: widget.selectedCategory.usedBudget));
                        Navigator.pop(context);
                      },
                      textColor: Theme.of(context).accentColor,
                      icon: Icon(Icons.check),
                      label: Text(
                        S.of(context).addCategoryBottomSheetButtonTextAdd,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container(
            height: MediaQuery.of(context).size.height * 0.9,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            padding: const EdgeInsets.all(20),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Text(
                  S.of(context).addCategoryBottomSheetHeadingText(type),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 1,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(8.5),
                              child: Text(
                                "Ангиллын нэр",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight
                                        .w700 // insert your font size here
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                        SizedBox(width: 10),
                      ],
                    ),
                    Expanded(
                      child: Container(
                          height: 70,
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 16,
                              top: 10,
                            ),
                            child: DropdownButtonFormField(
                                // underline: Container(),
                                hint: new Text("Энд дарж сонгоно уу"),
                                isExpanded: true,
                                focusNode: _priorityNode,
                                focusColor: Colors.red,
                                value: priority,
                                onChanged: (dynamic val) {
                                  setState(() {
                                    // if (val != null) {
                                    priority = val;
                                    // }
                                    // priority = widget.selectedCategory.priority;
                                    // checkNull();
                                  });
                                },
                                items: [
                                  S
                                      .of(context)
                                      .categoriesLabelTextCategoryTypeAppearance,
                                  S
                                      .of(context)
                                      .categoriesLabelTextCategoryTypeNecessary,
                                  S
                                      .of(context)
                                      .categoriesLabelTextCategoryTypeNeeds,
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
                                    _priorityNode.requestFocus();
                                    // checkNull();
                                  });
                                }),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 1,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                "Төсөвлөгдсөн дүн",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight
                                        .w700 // insert your font size here
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                        SizedBox(width: 10),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 16,
                          top: 5,
                        ),
                        height: 70,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^[1-9][0-9]*$')),
                          ],
                          focusNode: _budgetNode,
                          controller: _budgetNodeController,
                          onChanged: (v) => setState(() => budget = v),
                          onEditingComplete: () =>
                              FocusScope.of(context).requestFocus(_budgetNode),
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  top: 10,
                                  bottom: 10), // add padding to adjust icon
                              child: Image.asset(
                                  'assets/categories/$_selectedIcon'),
                            ),
                            suffixText: "₮",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(height: 15),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    FlatButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      textColor: Colors.red[600],
                      icon: Icon(Icons.clear),
                      label: Text(
                        S.of(context).addCategoryBottomSheetButtonTextCancel,
                      ),
                    ),
                    FlatButton.icon(
                      onPressed: () {
                        if (name.isEmpty) return;
                        categoryProvider.update(Category(
                            id: id,
                            icon: _selectedIcon,
                            name: name,
                            type: widget.type,
                            priority: priority,
                            budget: budget.toString(),
                            usedBudget: widget.selectedCategory.usedBudget));
                        Navigator.pop(context);
                      },
                      textColor: Theme.of(context).accentColor,
                      icon: Icon(Icons.check),
                      label: Text(
                        S.of(context).addCategoryBottomSheetButtonTextAdd,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
