import 'dart:io';

// import 'package:expensemanager/config/config.dart';
import 'package:expensemanager/screens/login/splash_top_section1.dart';

import 'package:expensemanager/screens/login/splash_top_section_first.dart';
import 'package:expensemanager/screens/screens.dart';
import 'package:expensemanager/shared/shared.dart';
// import 'package:expensemanager/shared/wave_clipper_splash.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_onboarding_screen/OnbordingData.dart';
// import 'package:flutter_onboarding_screen/flutteronboardingscreens.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:introduction_screen/introduction_screen.dart';

class OnBordingScreen extends StatefulWidget {
  static const String routeName = '/onboarding';

  @override
  _OnBordingScreenState createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    Container(
        child: new Padding(
            padding: EdgeInsets.all(0.0),
            child: Center(
                child: Column(children: <Widget>[
              Expanded(
                child: new Container(
                  child: ClipPath(
                    child: SplashTopSectionFirst(),
                    clipper: WaveClipper(),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 20),
                  child: Center(
                      child: Text(
                    'Өдөр тутмын орлого,зарлагаа хянан зохицуулахад тань энэхүү апп туслах болно.',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Ubuntu',
                        fontSize: 20),
                  )),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ])))),
    Container(
        child: new Padding(
            padding: EdgeInsets.all(0.0),
            child: Center(
                child: Column(children: <Widget>[
              Expanded(
                child: new Container(
                  child: ClipPath(
                    child: SplashTopSection(),
                    clipper: WaveClipper(),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                child: Column(
                  children: [
                    Text(
                      "Өөрийн зарцуулалтыг хянаж, төлөвлөх боломж",
                      style: TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        letterSpacing: 0.7,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SvgPicture.asset(
                      "assets/images/sp2.svg",
                      width: 300,
                    ),
                  ],
                ),
              )),
              SizedBox(
                height: 60,
              ),
            ])))),
    Container(
        child: new Padding(
            padding: EdgeInsets.all(0.0),
            child: Center(
                child: Column(children: <Widget>[
              Expanded(
                child: new Container(
                  child: ClipPath(
                    child: SplashTopSection(),
                    clipper: WaveClipper(),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      child: Column(
                children: [
                  Text(
                    "Орлого зарлагын тэнцвэртэй байдалд суралцана",
                    style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      letterSpacing: 0.7,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SvgPicture.asset(
                    "assets/images/sp3.svg",
                    width: 300,
                  ),
                ],
              ))),
              SizedBox(
                height: 60,
              ),
            ])))),
    Container(
        child: new Padding(
            padding: EdgeInsets.all(0.0),
            child: Center(
                child: Column(children: <Widget>[
              Expanded(
                child: new Container(
                  child: ClipPath(
                    child: SplashTopSection(),
                    clipper: WaveClipper(),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      child: Column(
                children: [
                  Text(
                    "Санхүүгийн сахилга баттай болж, ухаалаг зарцуулалт хийх чадвартай болно",
                    style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      letterSpacing: 0.7,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SvgPicture.asset(
                    "assets/images/sp4.svg",
                    width: 250,
                  ),
                ],
              ))),
              SizedBox(
                height: 60,
              ),
            ])))),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 30 : 10,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage)
                                ? Colors.blue
                                : Colors.blue.withOpacity(0.5)));
                  })),
              (_currentPage == (_pages.length - 1))
                  ? Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(35)),
                      height: 50,
                      width: 100,
                      child: Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text(
                            "Эхлэх",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ))
                  : Container(),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ],
      ),
    );
  }
}
