import 'package:expensemanager/config/config.dart';
import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/screens/categories/categories.dart';
import 'package:expensemanager/screens/currencies/currencies.dart';
import 'package:expensemanager/screens/screens.dart';
import 'package:expensemanager/services/services.dart';
import 'package:expensemanager/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
// import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types
class expenseManagerDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                DrawerHeader(user),
                SizedBox(height: 10),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, CategoriesScreen.routeName);
                  },
                  leading: Icon(Icons.category),
                  title: Text(S.of(context).expenseManagerDrawerTextCategories),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, CurrenciesScreen.routeName);
                  },
                  leading: Icon(Icons.attach_money),
                  title: Text(S.of(context).expenseManagerDrawerTextCurrencies),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => ExportDialog(),
                    );
                  },
                  leading: Icon(Icons.import_export),
                  title: Text(S.of(context).expenseManagerDrawerTextExport),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, SettingsScreen.routeName);
                  },
                  leading: Icon(Icons.settings),
                  title: Text(S.of(context).expenseManagerDrawerTextSettings),
                ),
                Divider(),
                ListTile(
                  onTap: () async {
                    Navigator.pop(context);
                    showAboutDialog(
                      context: context,
                      applicationIcon: ExpenseManagerLogo(
                        size: 80,
                        color: Theme.of(context).accentColor,
                      ),
                      applicationName: S.of(context).appName,
                      applicationLegalese: S
                          .of(context)
                          .expenseManagerDrawerTextAboutAppLegalese,
                      applicationVersion: await getVersionCode(),
                      children: [
                        SizedBox(height: 30),
                        Text(S.of(context).expenseManagerDrawerTextAboutFooter),
                      ],
                    );
                  },
                  leading: Icon(Icons.local_library),
                  title: Text(S.of(context).expenseManagerDrawerTextAbout),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Share.share(
                      S.of(context).expenseManagerDrawerMessageShare,
                      subject: S.of(context).appName,
                    );
                  },
                  leading: Icon(Icons.favorite),
                  title: Text(S.of(context).expenseManagerDrawerTextShare),
                ),
                Divider(),
                ListTile(
                  onTap: () => logout(context),
                  leading: Icon(Icons.exit_to_app),
                  title: Text(S.of(context).expenseManagerDrawerTextLogout),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: FutureBuilder(
              initialData: '',
              future: getVersionCode(),
              builder: (context, snapshot) {
                return Text(
                  snapshot.data,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  logout(BuildContext context) {
    AuthService authService = AuthService();
    Navigator.pop(context);
    authService.signOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginScreen.routeName,
      (route) => false,
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader(this.user);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        width: double.infinity,
        height: 180,
        color: Theme.of(context).accentColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 45),
            Text(
              user?.name ?? '',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            Text(
              user?.email ?? '',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      clipper: WaveClipper(),
    );
  }
}
