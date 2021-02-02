import 'package:expensemanager/screens/categories/categories.dart';
// import 'package:expensemanager/screens/currencies/currencies.dart';
import 'package:expensemanager/screens/filter/filter.dart';
import 'package:expensemanager/screens/login/onboarding.dart';
import 'package:expensemanager/screens/screens.dart';
import 'package:expensemanager/screens/reminder/newScreen.dart';
import 'package:expensemanager/screens/splash.dart';
import 'package:expensemanager/screens/budget/budget.dart';

import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),

  TransactionScreen.routeName: (context) => TransactionScreen(),
  FilteredTransactionScreen.routeName: (context) => FilteredTransactionScreen(),
  OnBordingScreen.routeName: (context) => OnBordingScreen(),

  // Баталгаажуулалт
  // LoginScreen.routeName: (context) => LoginScreen(),

  // Profile ийн өгөгдөл харуулах
  ProfileSetupScreen.routeName: (context) => ProfileSetupScreen(),
  // CurrencySetupScreen.routeName: (context) => CurrencySetupScreen(),

  // Апп ын үндсэн
  HomeScreen.routeName: (context) => HomeScreen(),
  FilterScreen.routeName: (context) => FilterScreen(),
  MyHomePage.routeName: (context) => MyHomePage(),
  WalletScreen.routeName: (context) => WalletScreen(),

  BudgetScreen.routeName: (context) => BudgetScreen(),

  CategoriesScreen.routeName: (context) => CategoriesScreen(),
  // CurrenciesScreen.routeName: (context) => CurrenciesScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
};
