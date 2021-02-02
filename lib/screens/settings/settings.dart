import 'package:expensemanager/config/utils.dart';
import 'package:expensemanager/data/languages.dart';
import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/screens/categories/categories.dart';
import 'package:expensemanager/screens/screens.dart';
import 'package:expensemanager/services/services.dart';
import 'package:expensemanager/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

import '../../shared/expensemanager/expensemanager_appbar.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final LocalAuthentication _localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    var settings = Provider.of<SettingsProvider>(context);

    updateStatusBarColor(context);

    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: UserDatabaseService(user).userDocument,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: new Text(
            S.of(context).settingsAppBar,
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Theme.of(context).accentColor,
          centerTitle: true,
        ),
        body: Consumer<User>(
          builder: (context, user, _) => SafeArea(
            child: ListView(
              children: <Widget>[
                //ExpenseAppBar(canGoBack: true),
                SizedBox(height: 20),
                buildHeader(S.of(context).settingsProfilePreferences),
                Divider(),
                buildNameSetting(user),
                buildEmailSetting(user),
                //buildCurrencySetting(user),
                Divider(),
                buildHeader(S.of(context).settingsGeneralPreferences),
                Divider(),
                buildCategoriesSelector(settings),
                buildBudgetSelector(settings),
                buildReminderSelector(settings),
                Divider(),
                buildHeader(
                    S.of(context).settingsScreenGeneral_TitlePreferences),
                Divider(),
                buildAccentColorSelector(settings),
                buildThemeSelector(settings),
                buildAppLanguageSelector(settings),
                buildBiometricsSwitch(settings),
                //Divider(),
                //buildHeader(S.of(context).settingsScreenHeaderTitlePreferences),
                //Divider(),
                //buildHeader(S.of(context).settingsScreenHeaderTitleAccount),
                //Divider(),
                //buildHeader(S.of(context).settingsScreenHeaderTitleDangerZone),
                //Divider(),
                //buildDeleteAccount(),
                logOut()
              ],
            ),
          ),
        ),
      ),
    );
  }

  logout(BuildContext context) {
    AuthService authService = AuthService();
    Navigator.pop(context);
    authService.signOut();
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }

  ListTile buildNameSetting(User user) {
    return ListTile(
      leading: Icon(
        Icons.person,
        color: Theme.of(context).accentColor,
      ),
      title: Text(
        S.of(context).settingsScreenSettingTitleName,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        user?.name ?? '',
        textAlign: TextAlign.end,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => UpdateNameDialog(
            name: user.name,
          ),
        );
      },
    );
  }

  ListTile buildEmailSetting(User user) {
    return ListTile(
      enabled: false,
      leading: Icon(
        Icons.mail,
        color: Theme.of(context).accentColor,
      ),
      title: Text(
        S.of(context).settingsScreenSettingTitleEmailAddress,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        user?.email ?? '',
        textAlign: TextAlign.end,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  /*ListTile buildCurrencySetting(User user) {
    return ListTile(
      leading: Icon(
        Icons.monetization_on,
        color: Theme.of(context).accentColor,
      ),
      title: Text(
        S.of(context).settingsScreenSettingTitleCurrency,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        '${user?.currency?.symbol} (${user?.currency?.name})' ?? '',
        textAlign: TextAlign.end,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => CurrencySelectionDialog(),
        );
      },
    );
  }*/

  Padding buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: 4,
      ),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  /*ListTile buildDeleteAccount() {
    return ListTile(
      leading: Icon(
        Icons.delete_sweep,
        color: Colors.red[800],
      ),
      title: Text(
        S.of(context).settingsScreenSettingTitleDeleteAccount,
        style: TextStyle(
          color: Colors.red[800],
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(S.of(context).deleteAccountDialogTitle),
            content: Text(S.of(context).deleteAccountDialogContent),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(S.of(context).deleteAccountDialogButtonTextCancel),
              ),
              FlatButton(
                onPressed: () async {
                  Navigator.pop(context);
                  try {
                    AuthService().deleteUser();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginScreen.routeName,
                      (route) => false,
                    );
                  } catch (error) {
                    print(
                        'Уучлаарай ямар нэг зүйл буруу байна дахин оролдоно уу!');
                  }
                },
                child: Text(
                  S.of(context).deleteAccountDialogButtonTextDelete,
                  style: TextStyle(
                    color: Colors.red[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }*/

  ListTile logOut() {
    return ListTile(
      onTap: () => logout(context),
      leading: Icon(
        Icons.exit_to_app,
        color: Colors.red[800],
      ),
      title: Text(
        S.of(context).expenseManagerDrawerTextLogout,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.red[800],
        ),
      ),
    );
  }

  FutureBuilder<bool> buildBiometricsSwitch(SettingsProvider settings) {
    return FutureBuilder<bool>(
      initialData: false,
      future: _localAuth.canCheckBiometrics,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var enabled = snapshot.data;

          return ListTile(
            enabled: enabled,
            leading: Icon(
              Icons.fingerprint,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              S.of(context).settingsScreenSettingTitleBiometric,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              S.of(context).settingsScreenSettingTitleBiometricDescription,
            ),
            trailing: Switch(
              value: settings.biometricsEnabled,
              activeColor: Theme.of(context).accentColor,
              onChanged: enabled
                  ? (value) {
                      settings.setBiometricsEnabled(value);
                    }
                  : null,
            ),
            onTap: () {
              settings.setBiometricsEnabled(!settings.biometricsEnabled);
            },
          );
        }

        return Container();
      },
    );
  }

  ListTile buildBudgetSelector(SettingsProvider settings) {
    return ListTile(
      leading: Icon(
        Icons.graphic_eq,
        color: Theme.of(context).accentColor,
      ),
      title: Text(
        S.of(context).settingsBudgetPreferences,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        // Navigator.pop(context);
        Navigator.pushNamed(context, BudgetScreen.routeName);
      },
    );
  }

  ListTile buildThemeSelector(SettingsProvider settings) {
    return ListTile(
      leading: Icon(
        Icons.brightness_medium,
        color: Theme.of(context).accentColor,
      ),
      title: Text(
        S.of(context).settingsScreenSettingTitleTheme,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: DropdownButton<ThemeOptions>(
        onChanged: settings.setTheme,
        value: settings.theme,
        items: [
          DropdownMenuItem(
            // лайт моод
            value: ThemeOptions.light,
            child: Text(S.of(context).settingsScreenSettingTitleThemeLight),
          ),
          DropdownMenuItem(
            // дарк моод
            value: ThemeOptions.dark,
            child: Text(S.of(context).settingsScreenSettingTitleThemeDark),
          ),
          DropdownMenuItem(
            // амолэд моод
            value: ThemeOptions.amoled,
            child: Text(S.of(context).settingsScreenSettingTitleThemeAMOLED),
          ),
        ],
      ),
    );
  }

  ListTile buildReminderSelector(SettingsProvider settings) {
    return ListTile(
      leading: Icon(
        Icons.notifications,
        color: Theme.of(context).accentColor,
      ),
      title: Text(
        S.of(context).settingsReminderPreferences,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      },
    );
  }

  ListTile buildCategoriesSelector(SettingsProvider settings) {
    return ListTile(
      leading: Icon(
        Icons.category,
        color: Theme.of(context).accentColor,
      ),
      title: Text(
        S.of(context).categoriesScreenAppBarTitle,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        // Navigator.pop(context);
        Navigator.pushNamed(context, CategoriesScreen.routeName);
      },
    );
  }

  ListTile buildAppLanguageSelector(SettingsProvider settings) {
    return ListTile(
      leading: Icon(
        Icons.language,
        color: Theme.of(context).accentColor,
      ),
      title: Text(
        S.of(context).settingsScreenSettingTitleLanguage,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: DropdownButton<Locale>(
        onChanged: settings.setAppLanguage,
        value: settings.appLang,
        items: languages
            .map((x) => DropdownMenuItem(
                  value: Locale(x.code),
                  child: Text(x.title),
                ))
            .toList(),
      ),
    );
  }

  ListTile buildAccentColorSelector(SettingsProvider settings) {
    List<Color> colorOptions = [
      Color(0xFF1B54A9),
      Colors.black,
      Colors.red[800],
      Colors.pink[600],
      Colors.teal[600],
      Colors.green[800],
      Colors.deepOrange[800],
      Colors.deepPurple[700],
    ];

    return ListTile(
      leading: Icon(
        Icons.color_lens,
        color: Theme.of(context).accentColor,
      ),
      title: Text(
        S.of(context).settingsScreenSettingTitleAccentColor,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: DropdownButton<Color>(
        underline: Container(),
        onChanged: settings.setAccentColor,
        value: settings.accentColor,
        items: colorOptions
            .map(
              (x) => DropdownMenuItem(
                value: x,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: x,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
