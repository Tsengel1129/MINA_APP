/*import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  DropDown() : super();
  final String title = "Dropdown";

  @override
  _DropDownState createState() => _DropDownState();
}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getBankaccount() {
    return <Company>[
      Company(1, 'Apple'),
      Company(2, 'Samsung'),
      Company(3, 'Google'),
      Company(3, 'Sony'),
      Company(3, 'LG'),
    ];
  }
}

class _DropDownState extends State<DropDown> {
  //

  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;

  @override
  void initState() {
    _dropdownMenuItems = buildDropDownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropDownMenuItems(List _companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
          child: Center(
        child: Column(
          children: <Widget>[
            Text('Select a company'),
            SizedBox(
              height: 15,
            ),
            DropdownButton(
              value: _selectedCompany,
              items: _dropdownMenuItems,
              onChanged: onChangeDropdownItem,
            ),
            SizedBox(
              height: 15,
            ),
            Text('Selected: ${_selectedCompany.name}'),
          ],
        ),
      )),
    );
  }
}
*/
