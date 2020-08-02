import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ExpenseAppBar extends StatefulWidget {
  final bool canGoBack;
  final bool hideAccount;

  const ExpenseAppBar({
    Key key,
    this.canGoBack = false,
    this.hideAccount = false,
  }) : super(key: key);

  @override
  _ExpenseAppBarState createState() => _ExpenseAppBarState();
}

class _ExpenseAppBarState extends State<ExpenseAppBar> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return SizedBox(
      height: 120,
      child: Row(
        children: <Widget>[
          SizedBox(width: 10),
          widget.canGoBack
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Theme.of(context).accentColor,
                  icon: Icon(Icons.arrow_back_ios),
                )
              : IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  color: Theme.of(context).accentColor,
                  icon: Icon(Icons.menu),
                ),
          SizedBox(width: 10),
          ExpenseManagerLogo(
            size: 80,
            color: Theme.of(context).accentColor,
          ),
          Spacer(),
          widget.hideAccount ? Container() : buildCircleAvatar(user),
          SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget buildCircleAvatar(User user) {
    if (user != null && user.photoURL.isNotEmpty) {
      return Container(
        width: 50,
        child: ClipOval(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: user.photoURL,
            fit: BoxFit.contain,
          ),
        ),
      );
    }

    return Container();
  }
}
