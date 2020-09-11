import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = '/filter';
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Text('Нарийвчлан харах'),
    ));
  }
}
