import 'package:flutter/material.dart';
import 'package:for_learning/core/colors.dart';
import 'package:for_learning/widgets/input_with_icon.dart';
import 'package:for_learning/widgets/outline_button.dart';
import 'package:for_learning/widgets/primary_button.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pageState = 0;
  var _backgroundColor = clrWhite;
  var _headingColor = clrPrimary;

  double windowWidth = 0;
  double windowHeight = 0;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;
  double _registerHeight = 0;

  double _loginWidth = 0;
  double _loginHeight = 0;
  double _loginOpacity = 1;
  double _headingTop = 80;
  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (visible) {
        setState(() {
          _keyboardVisible = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;

    switch (_pageState) {
      case 0:
        _backgroundColor = clrWhite;
        _headingColor = clrPrimary;
        _loginYOffset = windowHeight;
        _registerYOffset = windowHeight;
        _loginXOffset = 0;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _headingTop = 80;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 220;
        break;
      case 1:
        _backgroundColor = clrAccent;
        _headingColor = clrWhite;
        _loginYOffset = _keyboardVisible ? 40 : 220;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 220;
        _registerYOffset = windowHeight;
        _loginXOffset = 0;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _headingTop = 70;
        break;
      case 2:
        _backgroundColor = clrAccent;
        _headingColor = clrWhite;
        _loginYOffset = _keyboardVisible ? 30 : 200;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 240;
        _registerYOffset = _keyboardVisible ? 55 : 220;
        _registerHeight = _keyboardVisible ? windowHeight : windowHeight - 220;
        _loginXOffset = 20;
        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;
        _headingTop = 60;
        break;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Stack(
          children: [
            AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(
                milliseconds: 1000,
              ),
              color: _backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 0;
                      });
                    },
                    child: Container(
                      child: Column(
                        children: [
                          AnimatedContainer(
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: Duration(milliseconds: 1000),
                            margin: EdgeInsets.only(top: _headingTop),
                            child: Text(
                              'Learn free',
                              style: TextStyle(
                                color: _headingColor,
                                fontSize: 28,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: Text(
                              'We make learning easy. Read our github source codes.\n@Donaboyev',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: _headingColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 42,
                    ),
                    child: Center(
                      child: Image.asset('assets/images/splash_bg.png'),
                    ),
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_pageState != 0) {
                            _pageState = 0;
                          } else {
                            _pageState = 1;
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(32),
                        padding: EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: clrPrimary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            'Get started',
                            style: TextStyle(
                              color: clrWhite,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              padding: EdgeInsets.all(32),
              width: _loginWidth,
              height: _loginHeight,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1000),
              transform:
                  Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
              decoration: BoxDecoration(
                color: clrWhite.withOpacity(_loginOpacity),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Login to continue',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      InputWithIcon(
                        icon: Icons.email,
                        hint: 'Enter email',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InputWithIcon(
                        icon: Icons.vpn_key,
                        hint: 'Enter password',
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      PrimaryButton(
                        btnText: 'Login',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _pageState = 2;
                          });
                        },
                        child: OutlineBtn(
                          btnText: 'Create new account',
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            AnimatedContainer(
              height: _registerHeight,
              padding: EdgeInsets.all(32),
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1000),
              transform: Matrix4.translationValues(0, _registerYOffset, 1),
              decoration: BoxDecoration(
                color: clrWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Create a new account',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      InputWithIcon(
                        icon: Icons.email,
                        hint: 'Enter email',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InputWithIcon(
                        icon: Icons.vpn_key,
                        hint: 'Enter password',
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      PrimaryButton(
                        btnText: 'Create account',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _pageState = 1;
                          });
                        },
                        child: OutlineBtn(
                          btnText: 'Back to login',
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
