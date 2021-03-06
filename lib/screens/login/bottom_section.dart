import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/screens/screens.dart';
import 'package:expensemanager/services/services.dart';
import 'package:flutter/material.dart';

class BottomSection extends StatefulWidget {
  const BottomSection({Key key}) : super(key: key);

  @override
  _BottomSectionState createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(flex: 2),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            S.of(context).loginTextTagline,
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.6,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Spacer(flex: 2),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: FlatButton.icon(
            onPressed: () => signIn(false),
            textColor: Theme.of(context).accentColor,
            padding: const EdgeInsets.symmetric(vertical: 15),
            icon: Image.asset(
              'assets/images/google_icon.png',
              width: 28,
              height: 28,
            ),
            label: Text(
              S.of(context).loginButtonTextGoogle,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: FlatButton(
            onPressed: () => signIn(true),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              S.of(context).loginButtonTextGuest,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        Spacer(flex: 2),
      ],
    );
  }

  Future<void> signIn(bool isAnonymous) async {
    try {
      var user = isAnonymous
          ? await _authService.signInAnonymously()
          : await _authService.signInWithGoogle();

      if (await UserDatabaseService(user).checkIfUserExists) {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, ProfileSetupScreen.routeName);
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
