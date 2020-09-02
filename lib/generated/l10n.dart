// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();

  static S current;

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();

      return S.current;
    });
  }

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ADD`
  String get addCategoryBottomSheetButtonTextAdd {
    return Intl.message(
      'ADD',
      name: 'addCategoryBottomSheetButtonTextAdd',
      desc: '',
      args: [],
    );
  }

  /// `Add your new card click the \n + \n button in the bottom right`
  String get walletSectionEmptyText {
    return Intl.message(
      'Add your new card click the \n + \n button in the bottom right',
      name: 'walletSectionEmptyText',
      desc: '',
      args: [],
    );
  }

  /// `CANCEL`
  String get addCategoryBottomSheetButtonTextCancel {
    return Intl.message(
      'CANCEL',
      name: 'addCategoryBottomSheetButtonTextCancel',
      desc: '',
      args: [],
    );
  }

  /// `{type} add new categories`
  String addCategoryBottomSheetHeadingText(Object type) {
    return Intl.message(
      '$type add new categories',
      name: 'addCategoryBottomSheetHeadingText',
      desc: '',
      args: [type],
    );
  }

  /// `Categories name`
  String get addCategoryBottomSheetLabelTextCategoryName {
    return Intl.message(
      'Categories name',
      name: 'addCategoryBottomSheetLabelTextCategoryName',
      desc: '',
      args: [],
    );
  }

  /// `Mina app`
  String get appName {
    return Intl.message(
      'Mina app',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categoriesScreenAppBarTitle {
    return Intl.message(
      'Categories',
      name: 'categoriesScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `ADD`
  String get categoriesScreenButtonTextAddNew {
    return Intl.message(
      'ADD',
      name: 'categoriesScreenButtonTextAddNew',
      desc: '',
      args: [],
    );
  }

  /// `Categories deleted`
  String get categoriesScreenSnackbarTextDeleteMessage {
    return Intl.message(
      'Categories deleted',
      name: 'categoriesScreenSnackbarTextDeleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get categoriesScreenSnackbarTextResetCategoriesAction {
    return Intl.message(
      'Yes',
      name: 'categoriesScreenSnackbarTextResetCategoriesAction',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to reset categories?`
  String get categoriesScreenSnackbarTextResetCategoriesConfirmation {
    return Intl.message(
      'Are you sure you want to reset categories?',
      name: 'categoriesScreenSnackbarTextResetCategoriesConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Reset successful`
  String get categoriesScreenSnackbarTextResetCategoriesSuccess {
    return Intl.message(
      'Reset successful',
      name: 'categoriesScreenSnackbarTextResetCategoriesSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Expense`
  String get categoriesScreenTabBarTextExpense {
    return Intl.message(
      'Expense',
      name: 'categoriesScreenTabBarTextExpense',
      desc: '',
      args: [],
    );
  }

  /// `Income`
  String get categoriesScreenTabBarTextIncome {
    return Intl.message(
      'Income',
      name: 'categoriesScreenTabBarTextIncome',
      desc: '',
      args: [],
    );
  }

  /// `{category, select, Automobile {Automobile} Awards {Awards} BabyCare {Baby Care} Bonus {Bonus} Books {Books} Charity {Charity} Clothing {Clothing} Drinks {Drinks} Education {Education} Electronics {Electronics} Entertainment {Entertainment} Food {Food} Freelance {Freelance} FriendsFamily {Friends & Family} Gifts {Gifts} Grants {Grants} Groceries {Groceries} Health {Health} Hobbies {Hobbies} Insurance {Insurance} Interest {Interest} Investments {Investments} Laundry {Laundry} Lottery {Lottery} Mobile {Mobile} Office {Office} Others {Others} Pets {Pets} Refunds {Refunds} Rent {Rent} Salary {Salary} Sale {Sale} SalonSpa {Salon & Spa} Shopping {Shopping} Tax {Tax} Transportation {Transportation} Travel {Travel} Utilities {Utilities} other {{category}}}`
  String categoryName(Object category) {
    return Intl.select(
      category,
      {
        'Automobile': 'Automobile',
        'Awards': 'Awards',
        'BabyCare': 'Baby Care',
        'Bonus': 'Bonus',
        'Books': 'Books',
        'Charity': 'Charity',
        'Clothing': 'Clothing',
        'Drinks': 'Drinks',
        'Education': 'Education',
        'Electronics': 'Electronics',
        'Entertainment': 'Entertainment',
        'Food': 'Food',
        'Freelance': 'Freelance',
        'FriendsFamily': 'Friends & Family',
        'Gifts': 'Gifts',
        'Grants': 'Grants',
        'Groceries': 'Groceries',
        'Health': 'Health',
        'Hobbies': 'Hobbies',
        'Insurance': 'Insurance',
        'Interest': 'Interest',
        'Investments': 'Investments',
        'Laundry': 'Laundry',
        'Lottery': 'Lottery',
        'Mobile': 'Mobile',
        'Office': 'Office',
        'Others': 'Others',
        'Pets': 'Pets',
        'Refunds': 'Refunds',
        'Rent': 'Rent',
        'Salary': 'Salary',
        'Sale': 'Sale',
        'SalonSpa': 'Salon & Spa',
        'Shopping': 'Shopping',
        'Tax': 'Tax',
        'Transportation': 'Transportation',
        'Travel': 'Travel',
        'Utilities': 'Utilities',
        'other': '$category',
      },
      name: 'categoryName',
      desc: '',
      args: [category],
    );
  }

  /// `Мөнгөн тэмдэгтүүд`
  String get currenciesScreenAppBarTitle {
    return Intl.message(
      'Мөнгөн тэмдэгтүүд',
      name: 'currenciesScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get currenciesScreenSnackbarTextResetCurrenciesAction {
    return Intl.message(
      'Yes',
      name: 'currenciesScreenSnackbarTextResetCurrenciesAction',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to reset currency?`
  String get currenciesScreenSnackbarTextResetCurrenciesConfirmation {
    return Intl.message(
      'Are you sure you want to reset currency?',
      name: 'currenciesScreenSnackbarTextResetCurrenciesConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Reset successful`
  String get currenciesScreenSnackbarTextResetCurrenciesSuccess {
    return Intl.message(
      'Reset successful',
      name: 'currenciesScreenSnackbarTextResetCurrenciesSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Please choose your currency`
  String get currencySetupTextHeadline {
    return Intl.message(
      'Please choose your currency',
      name: 'currencySetupTextHeadline',
      desc: '',
      args: [],
    );
  }

  /// `No, I dont want to delete my account`
  String get deleteAccountDialogButtonTextCancel {
    return Intl.message(
      'No, I dont want to delete my account',
      name: 'deleteAccountDialogButtonTextCancel',
      desc: '',
      args: [],
    );
  }

  /// `Yes, I want to delete my account`
  String get deleteAccountDialogButtonTextDelete {
    return Intl.message(
      'Yes, I want to delete my account',
      name: 'deleteAccountDialogButtonTextDelete',
      desc: '',
      args: [],
    );
  }

  /// `You will deleting all data (profile settings, income, expenses...) Are you sure continue this step?`
  String get deleteAccountDialogContent {
    return Intl.message(
      'You will deleting all data (profile settings, income, expenses...) Are you sure continue this step?',
      name: 'deleteAccountDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account?`
  String get deleteAccountDialogTitle {
    return Intl.message(
      'Are you sure you want to delete your account?',
      name: 'deleteAccountDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `DOWNLOAD`
  String get exportBottomSheetButtonTextDownload {
    return Intl.message(
      'DOWNLOAD',
      name: 'exportBottomSheetButtonTextDownload',
      desc: '',
      args: [],
    );
  }

  /// `EXPORT`
  String get exportBottomSheetButtonTextExport {
    return Intl.message(
      'EXPORT',
      name: 'exportBottomSheetButtonTextExport',
      desc: '',
      args: [],
    );
  }

  /// `Export to CSV/JSON`
  String get exportBottomSheetHeadingText {
    return Intl.message(
      'Export to CSV/JSON',
      name: 'exportBottomSheetHeadingText',
      desc: '',
      args: [],
    );
  }

  /// `End date`
  String get exportBottomSheetLabelTextEndDate {
    return Intl.message(
      'End date',
      name: 'exportBottomSheetLabelTextEndDate',
      desc: '',
      args: [],
    );
  }

  /// `Start date`
  String get exportBottomSheetLabelTextStartDate {
    return Intl.message(
      'Start date',
      name: 'exportBottomSheetLabelTextStartDate',
      desc: '',
      args: [],
    );
  }

  /// `The start time must be before the end time`
  String get exportBottomSheetTextDateValidationError {
    return Intl.message(
      'The start time must be before the end time',
      name: 'exportBottomSheetTextDateValidationError',
      desc: '',
      args: [],
    );
  }

  /// `Click on the + icon to add income / expenses`
  String get homeDailyNoTransactionsTextSubtitle {
    return Intl.message(
      'Click on the + icon to add income / expenses',
      name: 'homeDailyNoTransactionsTextSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `This list is empty...`
  String get homeDailyNoTransactionsTextTitle {
    return Intl.message(
      'This list is empty...',
      name: 'homeDailyNoTransactionsTextTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign-in with Google`
  String get loginButtonTextGoogle {
    return Intl.message(
      'Sign-in with Google',
      name: 'loginButtonTextGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Guest login`
  String get loginButtonTextGuest {
    return Intl.message(
      'Guest login',
      name: 'loginButtonTextGuest',
      desc: '',
      args: [],
    );
  }

  /// `This app is designed to help you keep track of your daily financial income and expenses.`
  String get loginTextTagline {
    return Intl.message(
      'This app is designed to help you keep track of your daily financial income and expenses.',
      name: 'loginTextTagline',
      desc: '',
      args: [],
    );
  }

  /// `NEXT`
  String get profileSetupButtonTextNext {
    return Intl.message(
      'NEXT',
      name: 'profileSetupButtonTextNext',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get profileSetupLabelTextEmailAddress {
    return Intl.message(
      'Email address',
      name: 'profileSetupLabelTextEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get profileSetupLabelTextFullName {
    return Intl.message(
      'Full name',
      name: 'profileSetupLabelTextFullName',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in your name and email address`
  String get profileSetupTextHeadline {
    return Intl.message(
      'Please fill in your name and email address',
      name: 'profileSetupTextHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get settingsScreenHeaderTitleAccount {
    return Intl.message(
      'Register',
      name: 'settingsScreenHeaderTitleAccount',
      desc: '',
      args: [],
    );
  }

  /// `Danger zone`
  String get settingsScreenHeaderTitleDangerZone {
    return Intl.message(
      'Danger zone',
      name: 'settingsScreenHeaderTitleDangerZone',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsScreenHeaderTitlePreferences {
    return Intl.message(
      'Settings',
      name: 'settingsScreenHeaderTitlePreferences',
      desc: '',
      args: [],
    );
  }

  /// `Theme color`
  String get settingsScreenSettingTitleAccentColor {
    return Intl.message(
      'Theme color',
      name: 'settingsScreenSettingTitleAccentColor',
      desc: '',
      args: [],
    );
  }

  /// `Fingerprint / face login`
  String get settingsScreenSettingTitleBiometric {
    return Intl.message(
      'Fingerprint / face login',
      name: 'settingsScreenSettingTitleBiometric',
      desc: '',
      args: [],
    );
  }

  /// `You will be logged in with your fingerprint and / or face each time you open the app.`
  String get settingsScreenSettingTitleBiometricDescription {
    return Intl.message(
      'You will be logged in with your fingerprint and / or face each time you open the app.',
      name: 'settingsScreenSettingTitleBiometricDescription',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get settingsScreenSettingTitleCurrency {
    return Intl.message(
      'Currency',
      name: 'settingsScreenSettingTitleCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Delete your account`
  String get settingsScreenSettingTitleDeleteAccount {
    return Intl.message(
      'Delete your account',
      name: 'settingsScreenSettingTitleDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get settingsScreenSettingTitleEmailAddress {
    return Intl.message(
      'Email address',
      name: 'settingsScreenSettingTitleEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settingsScreenSettingTitleLanguage {
    return Intl.message(
      'Language',
      name: 'settingsScreenSettingTitleLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get settingsScreenSettingTitleName {
    return Intl.message(
      'Full name',
      name: 'settingsScreenSettingTitleName',
      desc: '',
      args: [],
    );
  }

  /// `Theme mode`
  String get settingsScreenSettingTitleTheme {
    return Intl.message(
      'Theme mode',
      name: 'settingsScreenSettingTitleTheme',
      desc: '',
      args: [],
    );
  }

  /// `AMOLED mode`
  String get settingsScreenSettingTitleThemeAMOLED {
    return Intl.message(
      'AMOLED mode',
      name: 'settingsScreenSettingTitleThemeAMOLED',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get settingsScreenSettingTitleThemeDark {
    return Intl.message(
      'Dark mode',
      name: 'settingsScreenSettingTitleThemeDark',
      desc: '',
      args: [],
    );
  }

  /// `Light mode`
  String get settingsScreenSettingTitleThemeLight {
    return Intl.message(
      'Light mode',
      name: 'settingsScreenSettingTitleThemeLight',
      desc: '',
      args: [],
    );
  }

  /// `This app is designed to help you keep track of your daily financial income and expenses.`
  String get expenseManagerDrawerMessageShare {
    return Intl.message(
      'This app is designed to help you keep track of your daily financial income and expenses.',
      name: 'expenseManagerDrawerMessageShare',
      desc: '',
      args: [],
    );
  }

  /// `About app`
  String get expenseManagerDrawerTextAbout {
    return Intl.message(
      'About app',
      name: 'expenseManagerDrawerTextAbout',
      desc: '',
      args: [],
    );
  }

  /// `Нэмэлт мэдээлэл бббббббб`
  String get expenseManagerDrawerTextAboutAppLegalese {
    return Intl.message(
      'Нэмэлт мэдээлэл бббббббб',
      name: 'expenseManagerDrawerTextAboutAppLegalese',
      desc: '',
      args: [],
    );
  }

  /// `бас нэмэлт мэдээлэл йййййй!`
  String get expenseManagerDrawerTextAboutFooter {
    return Intl.message(
      'бас нэмэлт мэдээлэл йййййй!',
      name: 'expenseManagerDrawerTextAboutFooter',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get expenseManagerDrawerTextCategories {
    return Intl.message(
      'Categories',
      name: 'expenseManagerDrawerTextCategories',
      desc: '',
      args: [],
    );
  }

  /// `Currencies`
  String get expenseManagerDrawerTextCurrencies {
    return Intl.message(
      'Currencies',
      name: 'expenseManagerDrawerTextCurrencies',
      desc: '',
      args: [],
    );
  }

  /// `Export to JSON/CSV`
  String get expenseManagerDrawerTextExport {
    return Intl.message(
      'Export to JSON/CSV',
      name: 'expenseManagerDrawerTextExport',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get expenseManagerDrawerTextLogout {
    return Intl.message(
      'Logout',
      name: 'expenseManagerDrawerTextLogout',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get expenseManagerDrawerTextSettings {
    return Intl.message(
      'Settings',
      name: 'expenseManagerDrawerTextSettings',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get expenseManagerDrawerTextShare {
    return Intl.message(
      'Share',
      name: 'expenseManagerDrawerTextShare',
      desc: '',
      args: [],
    );
  }

  /// `YOUR BUDGET`
  String get expenseManagerOverviewTextBalanceHeading {
    return Intl.message(
      'YOUR BUDGET',
      name: 'expenseManagerOverviewTextBalanceHeading',
      desc: '',
      args: [],
    );
  }

  /// `Your total balance {budgetAmount} {symbol} {monthYear} month {spendAmount} {symbol}`
  String expenseManagerOverviewTextBudgetSet(Object budgetAmount, Object symbol,
      Object monthYear, Object spendAmount) {
    return Intl.message(
      'Your total balance $budgetAmount $symbol $monthYear month $spendAmount $symbol',
      name: 'expenseManagerOverviewTextBudgetSet',
      desc: '',
      args: [budgetAmount, symbol, monthYear, spendAmount],
    );
  }

  /// `Click here to enter your general monthly budget`
  String get expenseManagerOverviewTextBudgetUnset {
    return Intl.message(
      'Click here to enter your general monthly budget',
      name: 'expenseManagerOverviewTextBudgetUnset',
      desc: '',
      args: [],
    );
  }

  /// `ADD`
  String get transactionBottomSheetButtonTextAdd {
    return Intl.message(
      'ADD',
      name: 'transactionBottomSheetButtonTextAdd',
      desc: '',
      args: [],
    );
  }

  /// `Expense`
  String get transactionBottomSheetButtonTextExpense {
    return Intl.message(
      'Expense',
      name: 'transactionBottomSheetButtonTextExpense',
      desc: '',
      args: [],
    );
  }

  /// `Income`
  String get transactionBottomSheetButtonTextIncome {
    return Intl.message(
      'Income',
      name: 'transactionBottomSheetButtonTextIncome',
      desc: '',
      args: [],
    );
  }

  /// `UPDATE`
  String get transactionBottomSheetButtonTextUpdate {
    return Intl.message(
      'UPDATE',
      name: 'transactionBottomSheetButtonTextUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get transactionBottomSheetLabelTextAmount {
    return Intl.message(
      'Amount',
      name: 'transactionBottomSheetLabelTextAmount',
      desc: '',
      args: [],
    );
  }

  /// `Дансны дугаар`
  String get walletBottomSheetLabelTextAmount {
    return Intl.message(
      'Дансны дугаар',
      name: 'walletBottomSheetLabelTextAmount',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get transactionBottomSheetLabelTextDate {
    return Intl.message(
      'Date',
      name: 'transactionBottomSheetLabelTextDate',
      desc: '',
      args: [],
    );
  }

  /// `Decsription (optional)`
  String get transactionBottomSheetLabelTextDescription {
    return Intl.message(
      'Decsription (optional)',
      name: 'transactionBottomSheetLabelTextDescription',
      desc: '',
      args: [],
    );
  }

  /// `Decsription (optional)`
  String get walletBottomSheetLabelTextDescription {
    return Intl.message(
      'Дансны нэр',
      name: 'walletBottomSheetLabelTextDescription',
      desc: '',
      args: [],
    );
  }

  /// `New Transaction`
  String get transactionBottomSheetTextHeadingAdd {
    return Intl.message(
      'New Transaction',
      name: 'transactionBottomSheetTextHeadingAdd',
      desc: '',
      args: [],
    );
  }

  /// `New Wallet`
  String get walletBottomSheetTextHeadingAdd {
    return Intl.message(
      'New Wallet',
      name: 'walletBottomSheetTextHeadingAdd',
      desc: '',
      args: [],
    );
  }

  /// `Update Wallet`
  String get walletBottomSheetTextHeadingUpdate {
    return Intl.message(
      'Update Wallet',
      name: 'walletBottomSheetTextHeadingUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Transaction renewal`
  String get transactionBottomSheetTextHeadingUpdate {
    return Intl.message(
      'Transaction renewal',
      name: 'transactionBottomSheetTextHeadingUpdate',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'transactionListHiddenTransactionText' key

  /// `CLEAR`
  String get updateBudgetBottomSheetButtonTextClear {
    return Intl.message(
      'CLEAR',
      name: 'updateBudgetBottomSheetButtonTextClear',
      desc: '',
      args: [],
    );
  }

  /// `YOUR BUDGET`
  String get updateBudgetBottomSheetButtonTextSetBudget {
    return Intl.message(
      'YOUR BUDGET',
      name: 'updateBudgetBottomSheetButtonTextSetBudget',
      desc: '',
      args: [],
    );
  }

  /// `Click here to enter your general monthly budget`
  String get updateBudgetBottomSheetHeadingText {
    return Intl.message(
      'Click here to enter your general monthly budget',
      name: 'updateBudgetBottomSheetHeadingText',
      desc: '',
      args: [],
    );
  }

  /// `YOUR BUDGET`
  String get updateBudgetBottomSheetLabelTextBudget {
    return Intl.message(
      'YOUR BUDGET',
      name: 'updateBudgetBottomSheetLabelTextBudget',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'mn'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
