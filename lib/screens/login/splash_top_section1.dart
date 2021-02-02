import 'package:expensemanager/shared/shared.dart';
import 'package:flutter/material.dart';

class SplashTopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Container(
        color: Theme.of(context).accentColor,
        child: Column(
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 14),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 35),
                    child: ExpenseManagerLogo(size: 100),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Center(
                        child: Text('MINA manager',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffDFB710),
                              fontFamily: 'PT Serif',
                            ))),
                  )
                ],
              ),
            ),
            Expanded(
                // width: MediaQuery.of(context).size.width * 0.9,
                child: Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Container(
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Өдөр тутмын орлого зарлагаа хөтлөөд та',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Open Sans',
                                  fontSize: 20),
                            ))),
                  )
                ],
              ),
            )),
            // SizedBox(height: 100),
          ],
        ),
      ),
    ));
  }
}
