import 'package:expensemanager/screens/categories/categories.dart';
import 'package:expensemanager/screens/currencies/currencies.dart';
import 'package:expensemanager/screens/screens.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),

  // Баталгаажуулалт
  LoginScreen.routeName: (context) => LoginScreen(),

  // Profile ийн өгөгдөл харуулах
  ProfileSetupScreen.routeName: (context) => ProfileSetupScreen(),
  CurrencySetupScreen.routeName: (context) => CurrencySetupScreen(),

  // Апп ын үндсэн
  HomeScreen.routeName: (context) => HomeScreen(),
  WalletScreen.routeName: (context) => WalletScreen(),

  CategoriesScreen.routeName: (context) => CategoriesScreen(),
  CurrenciesScreen.routeName: (context) => CurrenciesScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
};
