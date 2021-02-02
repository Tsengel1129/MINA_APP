import 'package:expensemanager/shared/shared.dart';
import 'package:flutter/material.dart';

class SplashHeader extends StatelessWidget {
  const SplashHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        width: double.infinity,
        height: 400,
        color: Theme.of(context).accentColor,
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: ExpenseManagerLogo(
                size: 80,
              ),
            ),
          ],
        ),
      ),
      clipper: WaveClipper(),
    );
  }
}
