import 'package:expensemanager/config/config.dart';
import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/services/category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateCategoryDialog extends StatefulWidget {
  final String type;
  // final String budget;
  final Category selectedCategory;
  UpdateCategoryDialog(this.type, this.selectedCategory);
  @override
  _UpdateCategoryDialogState createState() => _UpdateCategoryDialogState();
}

class _UpdateCategoryDialogState extends State<UpdateCategoryDialog> {
  String _selectedIcon;
  String name;
  String priority;
  String id;
  // String budget;
  // int dropDownIndex;
  var _nameNode = FocusNode();
  var _priorityNode = FocusNode();
  String type;
  TextEditingController _nameController = TextEditingController();
  final List<String> incomeIcons = [
    'income/salary.png',
    'income/bonus.png',
    'income/gift.png',
    'income/other.png',
    'income/incomeloan_interest.png',
    'income/refund_loan_interest.png',
    'custom/custom_blue.png',
    'custom/custom_brown.png',
    'custom/custom_green.png',
    'custom/custom_indigo.png',
    'custom/custom_orange.png',
    'custom/custom_purple.png',
    'custom/custom_red.png',
    'custom/custom_teal.png',
    'custom/custom_yellow.png',
  ];
  final List<String> expenseZailshguiIcons = [
    'expense/the_loan.png',
    'expense/offering.png',
    'expense/apartment.png',
    'expense/support.png',
    'expense/school_fee.png',
    'custom/custom_blue.png',
    'custom/custom_brown.png',
    'custom/custom_green.png',
    'custom/custom_indigo.png',
    'custom/custom_orange.png',
    'custom/custom_purple.png',
    'custom/custom_red.png',
    'custom/custom_teal.png',
    'custom/custom_yellow.png',
  ];
  final List<String> expenseHeregleeniiIcons = [
    'expense/food.png',
    'expense/laundry.png',
    'expense/children.png',
    'expense/transportation.png',
    'expense/dishes.png',
    'expense/health.png',
    'expense/beauty.png',
    'expense/mobile.png',
    'expense/education.png',
    'expense/furniture.png',
    'expense/clothing.png',
    'expense/loan_interest.png',
    'custom/custom_blue.png',
    'custom/custom_brown.png',
    'custom/custom_green.png',
    'custom/custom_indigo.png',
    'custom/custom_orange.png',
    'custom/custom_purple.png',
    'custom/custom_red.png',
    'custom/custom_teal.png',
    'custom/custom_yellow.png',
  ];
  final List<String> expenseUzemjiiniiIcons = [
    'expense/travel.png',
    'expense/gifts.png',
    'expense/pets.png',
    'custom/custom_blue.png',
    'custom/custom_brown.png',
    'custom/custom_green.png',
    'custom/custom_indigo.png',
    'custom/custom_orange.png',
    'custom/custom_purple.png',
    'custom/custom_red.png',
    'custom/custom_teal.png',
    'custom/custom_yellow.png',
  ];
  void initState() {
    super.initState();

    name = widget.selectedCategory.name;
    _nameController.text = name;
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

    if (type == "income") {
      return Container(
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
                            "Төрөл",
                            style: TextStyle(
                                fontSize: 20.0,
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
                            "Нэр",
                            style: TextStyle(
                                fontSize: 20.0,
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
                      focusNode: _nameNode,
                      controller: _nameController,
                      onChanged: (v) => setState(() => name = v),
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(_nameNode),
                      decoration: InputDecoration(),
                    ),
                  ),
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
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "Дүрс",
                            style: TextStyle(
                                fontSize: 20.0,
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
                      left: 10,
                      top: 5,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          (_selectedIcon != null)
                              ? Row(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.blue.withOpacity(0.5),
                                        ),
                                      ),
                                      child: CategoryIcon(
                                        icon: _selectedIcon,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                )
                              : Container(),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 15),
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        crossAxisCount: 5),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: incomeIcons.length,
                                itemBuilder: (context, index) {
                                  return CategoryIcon(
                                    onTap: () {
                                      setState(() =>
                                          _selectedIcon = incomeIcons[index]);
                                    },
                                    isSelected:
                                        _selectedIcon == incomeIcons[index],
                                    icon: incomeIcons[index],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                    if (name.isEmpty || _selectedIcon == null) return;
                    print(_selectedIcon);

                    categoryProvider.update(Category(
                        id: id,
                        icon: _selectedIcon,
                        name: name,
                        type: widget.type,
                        priority: priority,
                        budget: widget.selectedCategory.budget,
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
    if (widget.selectedCategory.priority ==
        S.of(context).categoriesLabelTextCategoryTypeNecessary) {
      return Container(
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
                            "Төрөл",
                            style: TextStyle(
                                fontSize: 20.0,
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
                            "Нэр",
                            style: TextStyle(
                                fontSize: 20.0,
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
                      focusNode: _nameNode,
                      controller: _nameController,
                      onChanged: (v) => setState(() => name = v),
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(_nameNode),
                      decoration: InputDecoration(),
                    ),
                  ),
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
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "Дүрс",
                            style: TextStyle(
                                fontSize: 20.0,
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
                      left: 10,
                      top: 5,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          (_selectedIcon != null)
                              ? Row(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.blue.withOpacity(0.5),
                                        ),
                                      ),
                                      child: CategoryIcon(
                                        icon: _selectedIcon,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                )
                              : Container(),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 15),
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        crossAxisCount: 5),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: expenseZailshguiIcons.length,
                                itemBuilder: (context, index) {
                                  return CategoryIcon(
                                    onTap: () {
                                      setState(() => _selectedIcon =
                                          expenseZailshguiIcons[index]);
                                    },
                                    isSelected: _selectedIcon ==
                                        expenseZailshguiIcons[index],
                                    icon: expenseZailshguiIcons[index],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                    if (name.isEmpty || _selectedIcon == null) return;
                    categoryProvider.update(Category(
                        id: id,
                        icon: _selectedIcon,
                        name: name,
                        type: widget.type,
                        priority: priority,
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
    if (widget.selectedCategory.priority ==
        S.of(context).categoriesLabelTextCategoryTypeNeeds) {
      return Container(
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
                            "Төрөл",
                            style: TextStyle(
                                fontSize: 20.0,
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
                            "Нэр",
                            style: TextStyle(
                                fontSize: 20.0,
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
                      focusNode: _nameNode,
                      controller: _nameController,
                      onChanged: (v) => setState(() => name = v),
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(_nameNode),
                      decoration: InputDecoration(),
                    ),
                  ),
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
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "Дүрс",
                            style: TextStyle(
                                fontSize: 20.0,
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
                      left: 10,
                      top: 5,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          (_selectedIcon != null)
                              ? Row(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.blue.withOpacity(0.5),
                                        ),
                                      ),
                                      child: CategoryIcon(
                                        icon: _selectedIcon,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                )
                              : Container(),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 15),
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        crossAxisCount: 5),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: expenseHeregleeniiIcons.length,
                                itemBuilder: (context, index) {
                                  return CategoryIcon(
                                    onTap: () {
                                      setState(() => _selectedIcon =
                                          expenseHeregleeniiIcons[index]);
                                    },
                                    isSelected: _selectedIcon ==
                                        expenseHeregleeniiIcons[index],
                                    icon: expenseHeregleeniiIcons[index],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                    if (name.isEmpty || _selectedIcon == null) return;
                    categoryProvider.update(Category(
                        id: id,
                        icon: _selectedIcon,
                        name: name,
                        type: widget.type,
                        priority: priority,
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
    if (widget.selectedCategory.priority ==
        S.of(context).categoriesLabelTextCategoryTypeAppearance) {
      return Container(
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
                            "Төрөл",
                            style: TextStyle(
                                fontSize: 20.0,
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
                            "Нэр",
                            style: TextStyle(
                                fontSize: 20.0,
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
                      focusNode: _nameNode,
                      controller: _nameController,
                      onChanged: (v) => setState(() => name = v),
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(_nameNode),
                      decoration: InputDecoration(),
                    ),
                  ),
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
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "Дүрс",
                            style: TextStyle(
                                fontSize: 20.0,
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
                      left: 10,
                      top: 5,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          (_selectedIcon != null)
                              ? Row(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.blue.withOpacity(0.5),
                                        ),
                                      ),
                                      child: CategoryIcon(
                                        icon: _selectedIcon,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                )
                              : Container(),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 15),
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        crossAxisCount: 5),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: expenseUzemjiiniiIcons.length,
                                itemBuilder: (context, index) {
                                  return CategoryIcon(
                                    onTap: () {
                                      setState(() => _selectedIcon =
                                          expenseUzemjiiniiIcons[index]);
                                    },
                                    isSelected: _selectedIcon ==
                                        expenseUzemjiiniiIcons[index],
                                    icon: expenseUzemjiiniiIcons[index],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                    if (name.isEmpty || _selectedIcon == null) return;
                    categoryProvider.update(Category(
                        id: id,
                        icon: _selectedIcon,
                        name: name,
                        type: widget.type,
                        priority: priority,
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
}

class CategoryIcon extends StatelessWidget {
  final Function onTap;
  final bool isSelected;
  final String icon;

  const CategoryIcon({
    Key key,
    this.onTap,
    this.isSelected = false,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        width: 80,
        height: 80,
        child: Stack(
          children: <Widget>[
            isSelected
                ? Center(
                    child: Container(
                      width: 80,
                      color: expenseManagerBlue.withOpacity(0.2),
                    ),
                  )
                : Container(),
            Center(
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(8),
                child: Image.asset('assets/categories/$icon'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
