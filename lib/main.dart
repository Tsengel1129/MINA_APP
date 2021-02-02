import 'package:expensemanager/config/config.dart';
import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/screens/screens.dart';
import 'package:expensemanager/services/category.dart';
import 'package:expensemanager/services/currency.dart';
import 'package:expensemanager/services/notification_manager.dart';
import 'package:expensemanager/services/services.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:expensemanager/screens/reminder/newScreen.dart';
// import 'package:hello_world/views/add_task.dart';
// import 'package:expensemanager/reminder/util/notification_manager.dart';
import 'dart:async';
import 'dart:convert';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// Color appBarColor = Colors.blue;
// const MethodChannel platform = MethodChannel('expense/example');
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
NotificationAppLaunchDetails notificationAppLaunchDetails;
Future<void> _configureLocalTimeZone() async {
  tz.initializeTimeZones();
  // final String timeZoneName = await platform.invokeMethod('getTimeZoneName');
  tz.setLocalLocation(tz.getLocation("Asia/Ulaanbaatar"));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _configureLocalTimeZone();
  notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  await initNotifications(flutterLocalNotificationsPlugin);
  requestIOSPermissions(flutterLocalNotificationsPlugin);
  tz.initializeTimeZones();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // static Future<void> _configureLocalTimeZone() async {
  //   tz.initializeTimeZones();
  //   // final String timeZoneName = await platform.invokeMethod('getTimeZoneName');
  //   tz.setLocalLocation(tz.getLocation("Asia/Ulaanbaatar"));
  // }

  @override
  Widget build(BuildContext context) {
    // Firebase.initializeApp();

    FirebaseAnalytics analytics = FirebaseAnalytics();
    updateStatusBarColor(context);
    setupCloudMessaging();

    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: AuthService().user,
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<CurrencyProvider>(
          create: (context) => CurrencyProvider(),
        ),
        ChangeNotifierProvider<SettingsProvider>(
          create: (context) => SettingsProvider(),
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Consumer<SettingsProvider>(
          builder: (context, settings, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            // language section
            locale: settings.appLang,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            navigatorObservers: [
              FirebaseAnalyticsObserver(analytics: analytics),
            ],
            title: 'Expense Manager',
            theme: themeSelector(settings.theme).copyWith(
              accentColor: settings.accentColor,
            ),
            initialRoute: SplashScreen.routeName,
            routes: routes,
          ),
        ),
      ),
    );
  }

  ThemeData themeSelector(ThemeOptions option) {
    switch (option) {
      case ThemeOptions.light:
        return theme;
      case ThemeOptions.dark:
        return darkTheme;
      case ThemeOptions.amoled:
        return amoledTheme;
      default:
        return theme;
    }
  }

  setupCloudMessaging() async {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }
}
