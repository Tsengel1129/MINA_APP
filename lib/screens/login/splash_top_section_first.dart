import 'package:expensemanager/shared/shared.dart';
import 'package:flutter/material.dart';

class SplashTopSectionFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        color: Theme.of(context).accentColor,
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    // margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height / 5.5,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                              margin: EdgeInsets.only(top: 30),
                              child: ExpenseManagerLogo(size: 170)),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, top: 10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height / 5,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Сахүү хөтлөлтийн',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Open Sans',
                                    fontSize: 20),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 27),
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'ЦАХИМ ДЭВТЭР',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Open Sans',
                                    fontSize: 20),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Center(
                              child: Text('MINA manager',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffDFB710),
                                    fontFamily: 'PT Serif',
                                  ))),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
