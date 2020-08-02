import 'package:flutter/material.dart';

// ignore: camel_case_types
class expenseManagerButton extends StatefulWidget {
  final String title;
  final Function onPressed;

  const expenseManagerButton({
    Key key,
    @required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  _expenseManagerButtonState createState() => _expenseManagerButtonState();
}

// ignore: camel_case_types
class _expenseManagerButtonState extends State<expenseManagerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: FlatButton(
        onPressed: this.widget.onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        color: Theme.of(context).accentColor,
        disabledColor: Theme.of(context).accentColor.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              this.widget.title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            Container(
              width: 28,
              height: 28,
              child: Image.asset('assets/images/double_arrow.png'),
            ),
          ],
        ),
      ),
    );
  }
}
