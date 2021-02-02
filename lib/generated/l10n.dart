// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
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

  /// `Icon`
  String get addCategoryBottomSheetLabelTextCategoryIcon {
    return Intl.message(
      'Icon',
      name: 'addCategoryBottomSheetLabelTextCategoryIcon',
      desc: '',
      args: [],
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

  /// `Name`
  String get addcategoryName {
    return Intl.message(
      'Name',
      name: 'addcategoryName',
      desc: '',
      args: [],
    );
  }

  /// `Add reminder`
  String get addReminder {
    return Intl.message(
      'Add reminder',
      name: 'addReminder',
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

  /// `Are you sure you want to delete this category?`
  String get categoriesDeleteAreYouSure {
    return Intl.message(
      'Are you sure you want to delete this category?',
      name: 'categoriesDeleteAreYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get categoriesLabelTextCategoryTypeAppearance {
    return Intl.message(
      'Appearance',
      name: 'categoriesLabelTextCategoryTypeAppearance',
      desc: '',
      args: [],
    );
  }

  /// `Necessary`
  String get categoriesLabelTextCategoryTypeNecessary {
    return Intl.message(
      'Necessary',
      name: 'categoriesLabelTextCategoryTypeNecessary',
      desc: '',
      args: [],
    );
  }

  /// `Needs`
  String get categoriesLabelTextCategoryTypeNeeds {
    return Intl.message(
      'Needs',
      name: 'categoriesLabelTextCategoryTypeNeeds',
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

  /// `Delete`
  String get categoriesScreenSnackbarTextDelete {
    return Intl.message(
      'Delete',
      name: 'categoriesScreenSnackbarTextDelete',
      desc: '',
      args: [],
    );
  }

  /// `Category deleted successfully`
  String get categoriesScreenSnackbarTextDeleteMessage {
    return Intl.message(
      'Category deleted successfully',
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

  /// `Filtered Transactions`
  String get filteredTitle {
    return Intl.message(
      'Filtered Transactions',
      name: 'filteredTitle',
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

  /// `{category, select, Salary {salary}  Bonus {bonus} Gift {gift} Others {others}  Refund {refund} Refund_to {refund_to} Loan {loan} Offering {offering}                   Apartment {apartment} Support {support} School_fee {school_fee} Food {food} Laundry {laundry} Children {children} Transportation {transportation}         Dishes {dishes} Health {health} Beauty {beauty} Mobile {mobile}   Education {education} Furniture {furniture}   Clothes {clothes}  Loan_intereset {loan_intereset} Travel {travel} Pets {pets} other {{category}}}`
  String categoryName(Object category) {
    return Intl.select(
      category,
      {
        'Salary': 'salary',
        'Bonus': 'bonus',
        'Gift': 'gift',
        'Others': 'others',
        'Refund': 'refund',
        'Refund_to': 'refund_to',
        'Loan': 'loan',
        'Offering': 'offering',
        'Apartment': 'apartment',
        'Support': 'support',
        'School_fee': 'school_fee',
        'Food': 'food',
        'Laundry': 'laundry',
        'Children': 'children',
        'Transportation': 'transportation',
        'Dishes': 'dishes',
        'Health': 'health',
        'Beauty': 'beauty',
        'Mobile': 'mobile',
        'Education': 'education',
        'Furniture': 'furniture',
        'Clothes': 'clothes',
        'Loan_intereset': 'loan_intereset',
        'Travel': 'travel',
        'Pets': 'pets',
        'other': '$category',
      },
      name: 'categoryName',
      desc: '',
      args: [category],
    );
  }

  /// `Home`
  String get textNavHome {
    return Intl.message(
      'Home',
      name: 'textNavHome',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get textNavFilter {
    return Intl.message(
      'Filter',
      name: 'textNavFilter',
      desc: '',
      args: [],
    );
  }

  /// `Transaction`
  String get textNavTransaction {
    return Intl.message(
      'Transaction',
      name: 'textNavTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get textNavWallet {
    return Intl.message(
      'Wallet',
      name: 'textNavWallet',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get textNavSettings {
    return Intl.message(
      'Settings',
      name: 'textNavSettings',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currenciesScreenAppBarTitle {
    return Intl.message(
      'Currency',
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

  /// `Additional info`
  String get expenseManagerDrawerTextAboutAppLegalese {
    return Intl.message(
      'Additional info',
      name: 'expenseManagerDrawerTextAboutAppLegalese',
      desc: '',
      args: [],
    );
  }

  /// `Additional Info`
  String get expenseManagerDrawerTextAboutFooter {
    return Intl.message(
      'Additional Info',
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
  String expenseManagerOverviewTextBudgetSet(Object budgetAmount, Object symbol, Object monthYear, Object spendAmount) {
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

  /// `Filter`
  String get filterTitle {
    return Intl.message(
      'Filter',
      name: 'filterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Transfer`
  String get filterTransfer {
    return Intl.message(
      'Transfer',
      name: 'filterTransfer',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get filterTransferAccount {
    return Intl.message(
      'Account',
      name: 'filterTransferAccount',
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

  /// `If you have created an account`
  String get homeDailyNoTransactionsTextTitle {
    return Intl.message(
      'If you have created an account',
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

  /// `Choose date`
  String get reminderBottomSheetchooseDate {
    return Intl.message(
      'Choose date',
      name: 'reminderBottomSheetchooseDate',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get reminderBottomSheetTextDate {
    return Intl.message(
      'Date',
      name: 'reminderBottomSheetTextDate',
      desc: '',
      args: [],
    );
  }

  /// `Repeat`
  String get reminderBottomSheetTextRepeat {
    return Intl.message(
      'Repeat',
      name: 'reminderBottomSheetTextRepeat',
      desc: '',
      args: [],
    );
  }

  /// `Day repeat`
  String get reminderBottomSheetTextRepeatDay {
    return Intl.message(
      'Day repeat',
      name: 'reminderBottomSheetTextRepeatDay',
      desc: '',
      args: [],
    );
  }

  /// `Frequency of days`
  String get reminderBottomSheetTextRepeatDay2 {
    return Intl.message(
      'Frequency of days',
      name: 'reminderBottomSheetTextRepeatDay2',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get reminderBottomSheetTextTittle {
    return Intl.message(
      'Title',
      name: 'reminderBottomSheetTextTittle',
      desc: '',
      args: [],
    );
  }

  /// `Reminder deleted`
  String get reminderDeleted {
    return Intl.message(
      'Reminder deleted',
      name: 'reminderDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Undo`
  String get reminderDeletedUndo {
    return Intl.message(
      'Undo',
      name: 'reminderDeletedUndo',
      desc: '',
      args: [],
    );
  }

  /// `minute`
  String get reminderMinute {
    return Intl.message(
      'minute',
      name: 'reminderMinute',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get reminderSave {
    return Intl.message(
      'Save',
      name: 'reminderSave',
      desc: '',
      args: [],
    );
  }

  /// `Selected date: `
  String get reminderSelectedDate {
    return Intl.message(
      'Selected date: ',
      name: 'reminderSelectedDate',
      desc: '',
      args: [],
    );
  }

  /// `Selected time: `
  String get reminderSelectedTime {
    return Intl.message(
      'Selected time: ',
      name: 'reminderSelectedTime',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get reminderSelectTime {
    return Intl.message(
      'Time',
      name: 'reminderSelectTime',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsAppBar {
    return Intl.message(
      'Settings',
      name: 'settingsAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Budget`
  String get settingsBudgetPreferences {
    return Intl.message(
      'Budget',
      name: 'settingsBudgetPreferences',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get settingsGeneralPreferences {
    return Intl.message(
      'General',
      name: 'settingsGeneralPreferences',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get settingsProfilePreferences {
    return Intl.message(
      'Edit profile',
      name: 'settingsProfilePreferences',
      desc: '',
      args: [],
    );
  }

  /// `Reminder`
  String get settingsReminderPreferences {
    return Intl.message(
      'Reminder',
      name: 'settingsReminderPreferences',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get settingsScreenGeneral_TitlePreferences {
    return Intl.message(
      'General',
      name: 'settingsScreenGeneral_TitlePreferences',
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

  /// `Change language`
  String get settingsScreenSettingTitleLanguage {
    return Intl.message(
      'Change language',
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

  /// `Choose account`
  String get transactionBottomSheetButtonChooseWallet {
    return Intl.message(
      'Choose account',
      name: 'transactionBottomSheetButtonChooseWallet',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get transactionBottomSheetButtonTextAccountExpense {
    return Intl.message(
      'From',
      name: 'transactionBottomSheetButtonTextAccountExpense',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get transactionBottomSheetButtonTextAccountIncome {
    return Intl.message(
      'To',
      name: 'transactionBottomSheetButtonTextAccountIncome',
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

  /// `Possible balance`
  String get transactionBottomSheetLabelTextAmount {
    return Intl.message(
      'Possible balance',
      name: 'transactionBottomSheetLabelTextAmount',
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

  /// `Description (optional)`
  String get transactionBottomSheetLabelTextDescription {
    return Intl.message(
      'Description (optional)',
      name: 'transactionBottomSheetLabelTextDescription',
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

  /// `Transaction renewal`
  String get transactionBottomSheetTextHeadingUpdate {
    return Intl.message(
      'Transaction renewal',
      name: 'transactionBottomSheetTextHeadingUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get transactionBottomTextAmount {
    return Intl.message(
      'Amount',
      name: 'transactionBottomTextAmount',
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

  /// `Description`
  String get walletBottomSheetLabelDescription {
    return Intl.message(
      'Description',
      name: 'walletBottomSheetLabelDescription',
      desc: '',
      args: [],
    );
  }

  /// `Account number`
  String get walletBottomSheetLabelTextAmount {
    return Intl.message(
      'Account number',
      name: 'walletBottomSheetLabelTextAmount',
      desc: '',
      args: [],
    );
  }

  /// `Bank account`
  String get walletBottomSheetLabelTextBankAccount {
    return Intl.message(
      'Bank account',
      name: 'walletBottomSheetLabelTextBankAccount',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get walletBottomSheetLabelTextCash {
    return Intl.message(
      'Cash',
      name: 'walletBottomSheetLabelTextCash',
      desc: '',
      args: [],
    );
  }

  /// `Bank name\n`
  String get walletBottomSheetLabelTextDescription {
    return Intl.message(
      'Bank name\n',
      name: 'walletBottomSheetLabelTextDescription',
      desc: '',
      args: [],
    );
  }

  /// `Loan`
  String get walletBottomSheetLabelTextLoanAccount {
    return Intl.message(
      'Loan',
      name: 'walletBottomSheetLabelTextLoanAccount',
      desc: '',
      args: [],
    );
  }

  /// `Saving`
  String get walletBottomSheetLabelTextSaving {
    return Intl.message(
      'Saving',
      name: 'walletBottomSheetLabelTextSaving',
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

  /// `Type`
  String get walletBottomSheetType {
    return Intl.message(
      'Type',
      name: 'walletBottomSheetType',
      desc: '',
      args: [],
    );
  }

  /// `Click + to create your account`
  String get walletEmptySubText {
    return Intl.message(
      'Click + to create your account',
      name: 'walletEmptySubText',
      desc: '',
      args: [],
    );
  }

  /// `You do not have an account`
  String get walletEmptyText {
    return Intl.message(
      'You do not have an account',
      name: 'walletEmptyText',
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

  /// `Accounts`
  String get walletTitle {
    return Intl.message(
      'Accounts',
      name: 'walletTitle',
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