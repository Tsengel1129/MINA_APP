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

  /// `{type} ангилал шинээр нэмэх`
  String addCategoryBottomSheetHeadingText(Object type) {
    return Intl.message(
      '$type ангилал шинээр нэмэх',
      name: 'addCategoryBottomSheetHeadingText',
      desc: '',
      args: [type],
    );
  }

  /// `Ангиллын нэр`
  String get addCategoryBottomSheetLabelTextCategoryName {
    return Intl.message(
      'Ангиллын нэр',
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

  /// `Шинийг нэмэх`
  String get categoriesScreenButtonTextAddNew {
    return Intl.message(
      'Шинийг нэмэх',
      name: 'categoriesScreenButtonTextAddNew',
      desc: '',
      args: [],
    );
  }

  /// `Ангилал амжилттай устгагдлаа`
  String get categoriesScreenSnackbarTextDeleteMessage {
    return Intl.message(
      'Ангилал амжилттай устгагдлаа',
      name: 'categoriesScreenSnackbarTextDeleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Тийм`
  String get categoriesScreenSnackbarTextResetCategoriesAction {
    return Intl.message(
      'Тийм',
      name: 'categoriesScreenSnackbarTextResetCategoriesAction',
      desc: '',
      args: [],
    );
  }

  /// `Бүх ангиллыг хуучин хэвэнд нь буцаах уу?`
  String get categoriesScreenSnackbarTextResetCategoriesConfirmation {
    return Intl.message(
      'Бүх ангиллыг хуучин хэвэнд нь буцаах уу?',
      name: 'categoriesScreenSnackbarTextResetCategoriesConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Бүх ангилал амжилттай анхны төлөв рүү буцаагдлаа`
  String get categoriesScreenSnackbarTextResetCategoriesSuccess {
    return Intl.message(
      'Бүх ангилал амжилттай анхны төлөв рүү буцаагдлаа',
      name: 'categoriesScreenSnackbarTextResetCategoriesSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Зарлага`
  String get categoriesScreenTabBarTextExpense {
    return Intl.message(
      'Зарлага',
      name: 'categoriesScreenTabBarTextExpense',
      desc: '',
      args: [],
    );
  }

  /// `Орлого`
  String get categoriesScreenTabBarTextIncome {
    return Intl.message(
      'Орлого',
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

  /// `Тийм`
  String get currenciesScreenSnackbarTextResetCurrenciesAction {
    return Intl.message(
      'Тийм',
      name: 'currenciesScreenSnackbarTextResetCurrenciesAction',
      desc: '',
      args: [],
    );
  }

  /// `Бүх мөнгөн тэмдэгтүүдийг хуучин хэвэнд нь буцаахдаа итгэлтэй байна уу?`
  String get currenciesScreenSnackbarTextResetCurrenciesConfirmation {
    return Intl.message(
      'Бүх мөнгөн тэмдэгтүүдийг хуучин хэвэнд нь буцаахдаа итгэлтэй байна уу?',
      name: 'currenciesScreenSnackbarTextResetCurrenciesConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Бүх мөнгөн тэмдэгтүүд амжилттай анхны төлөв рүү буцаагдлаа`
  String get currenciesScreenSnackbarTextResetCurrenciesSuccess {
    return Intl.message(
      'Бүх мөнгөн тэмдэгтүүд амжилттай анхны төлөв рүү буцаагдлаа',
      name: 'currenciesScreenSnackbarTextResetCurrenciesSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Таны ашиглах мөнгөн тэмдэгт юу вэ?`
  String get currencySetupTextHeadline {
    return Intl.message(
      'Таны ашиглах мөнгөн тэмдэгт юу вэ?',
      name: 'currencySetupTextHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Үгүй, Би бүртгэлээ устгахыг хүсэхгүй байна!`
  String get deleteAccountDialogButtonTextCancel {
    return Intl.message(
      'Үгүй, Би бүртгэлээ устгахыг хүсэхгүй байна!',
      name: 'deleteAccountDialogButtonTextCancel',
      desc: '',
      args: [],
    );
  }

  /// `Тийм, миний бүртгэлийг устгана уу!`
  String get deleteAccountDialogButtonTextDelete {
    return Intl.message(
      'Тийм, миний бүртгэлийг устгана уу!',
      name: 'deleteAccountDialogButtonTextDelete',
      desc: '',
      args: [],
    );
  }

  /// `Та өөрийн бүх датаг устгах гэж байна (Профайлын өгөгдөл болон, гүйлгээний мэдээлэл устгагдана) буцаах боломжгүй тул та итгэлтэй байна уу?`
  String get deleteAccountDialogContent {
    return Intl.message(
      'Та өөрийн бүх датаг устгах гэж байна (Профайлын өгөгдөл болон, гүйлгээний мэдээлэл устгагдана) буцаах боломжгүй тул та итгэлтэй байна уу?',
      name: 'deleteAccountDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Та өөрийн хаягийг устгахдаа итгэлтэй байна уу?`
  String get deleteAccountDialogTitle {
    return Intl.message(
      'Та өөрийн хаягийг устгахдаа итгэлтэй байна уу?',
      name: 'deleteAccountDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `ТАТАХ`
  String get exportBottomSheetButtonTextDownload {
    return Intl.message(
      'ТАТАХ',
      name: 'exportBottomSheetButtonTextDownload',
      desc: '',
      args: [],
    );
  }

  /// `ЭКСПОРТЛОХ`
  String get exportBottomSheetButtonTextExport {
    return Intl.message(
      'ЭКСПОРТЛОХ',
      name: 'exportBottomSheetButtonTextExport',
      desc: '',
      args: [],
    );
  }

  /// `CSV/JSON оор экспортлох`
  String get exportBottomSheetHeadingText {
    return Intl.message(
      'CSV/JSON оор экспортлох',
      name: 'exportBottomSheetHeadingText',
      desc: '',
      args: [],
    );
  }

  /// `Дуусах хугацаа`
  String get exportBottomSheetLabelTextEndDate {
    return Intl.message(
      'Дуусах хугацаа',
      name: 'exportBottomSheetLabelTextEndDate',
      desc: '',
      args: [],
    );
  }

  /// `Эхлэх хугацаа`
  String get exportBottomSheetLabelTextStartDate {
    return Intl.message(
      'Эхлэх хугацаа',
      name: 'exportBottomSheetLabelTextStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Эхлэх хугацаа дуусах хугацаанаас өмнө байх ёстой`
  String get exportBottomSheetTextDateValidationError {
    return Intl.message(
      'Эхлэх хугацаа дуусах хугацаанаас өмнө байх ёстой',
      name: 'exportBottomSheetTextDateValidationError',
      desc: '',
      args: [],
    );
  }

  /// ` + тэмдэг дээр дарж орлого/зарлага нэмэх боломжтой`
  String get homeDailyNoTransactionsTextSubtitle {
    return Intl.message(
      ' + тэмдэг дээр дарж орлого/зарлага нэмэх боломжтой',
      name: 'homeDailyNoTransactionsTextSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Энэхүү жягсаалт хоосон байна...`
  String get homeDailyNoTransactionsTextTitle {
    return Intl.message(
      'Энэхүү жягсаалт хоосон байна...',
      name: 'homeDailyNoTransactionsTextTitle',
      desc: '',
      args: [],
    );
  }

  /// `Google ээр нэвтрэх`
  String get loginButtonTextGoogle {
    return Intl.message(
      'Google ээр нэвтрэх',
      name: 'loginButtonTextGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Дараа болъё`
  String get loginButtonTextGuest {
    return Intl.message(
      'Дараа болъё',
      name: 'loginButtonTextGuest',
      desc: '',
      args: [],
    );
  }

  /// `Энэхүү Апп нь таньд өдөр тутамдаа санхүүгийнхээ орлого зарлагыг хөтлөн явуулахад туслах зорилготой юм.`
  String get loginTextTagline {
    return Intl.message(
      'Энэхүү Апп нь таньд өдөр тутамдаа санхүүгийнхээ орлого зарлагыг хөтлөн явуулахад туслах зорилготой юм.',
      name: 'loginTextTagline',
      desc: '',
      args: [],
    );
  }

  /// `ДАРААГИЙН`
  String get profileSetupButtonTextNext {
    return Intl.message(
      'ДАРААГИЙН',
      name: 'profileSetupButtonTextNext',
      desc: '',
      args: [],
    );
  }

  /// `И-Мейл хаяг`
  String get profileSetupLabelTextEmailAddress {
    return Intl.message(
      'И-Мейл хаяг',
      name: 'profileSetupLabelTextEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Овог нэр`
  String get profileSetupLabelTextFullName {
    return Intl.message(
      'Овог нэр',
      name: 'profileSetupLabelTextFullName',
      desc: '',
      args: [],
    );
  }

  /// `Та хэн бэ?`
  String get profileSetupTextHeadline {
    return Intl.message(
      'Та хэн бэ?',
      name: 'profileSetupTextHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Бүртгэл`
  String get settingsScreenHeaderTitleAccount {
    return Intl.message(
      'Бүртгэл',
      name: 'settingsScreenHeaderTitleAccount',
      desc: '',
      args: [],
    );
  }

  /// `Аюултай бүс`
  String get settingsScreenHeaderTitleDangerZone {
    return Intl.message(
      'Аюултай бүс',
      name: 'settingsScreenHeaderTitleDangerZone',
      desc: '',
      args: [],
    );
  }

  /// `Тохиргоо`
  String get settingsScreenHeaderTitlePreferences {
    return Intl.message(
      'Тохиргоо',
      name: 'settingsScreenHeaderTitlePreferences',
      desc: '',
      args: [],
    );
  }

  /// `Аппын өнгө`
  String get settingsScreenSettingTitleAccentColor {
    return Intl.message(
      'Аппын өнгө',
      name: 'settingsScreenSettingTitleAccentColor',
      desc: '',
      args: [],
    );
  }

  /// `Хурууны хээ/царайгаар нэвтрэх`
  String get settingsScreenSettingTitleBiometric {
    return Intl.message(
      'Хурууны хээ/царайгаар нэвтрэх',
      name: 'settingsScreenSettingTitleBiometric',
      desc: '',
      args: [],
    );
  }

  /// `Та аппыг нээх болгонд хурууны хээ/болон царайгаар нэвтрэх болно.`
  String get settingsScreenSettingTitleBiometricDescription {
    return Intl.message(
      'Та аппыг нээх болгонд хурууны хээ/болон царайгаар нэвтрэх болно.',
      name: 'settingsScreenSettingTitleBiometricDescription',
      desc: '',
      args: [],
    );
  }

  /// `Мөнгөн тэмдэгт`
  String get settingsScreenSettingTitleCurrency {
    return Intl.message(
      'Мөнгөн тэмдэгт',
      name: 'settingsScreenSettingTitleCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Бүртгэл устгах`
  String get settingsScreenSettingTitleDeleteAccount {
    return Intl.message(
      'Бүртгэл устгах',
      name: 'settingsScreenSettingTitleDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `И-мейл хаяг`
  String get settingsScreenSettingTitleEmailAddress {
    return Intl.message(
      'И-мейл хаяг',
      name: 'settingsScreenSettingTitleEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Хэл`
  String get settingsScreenSettingTitleLanguage {
    return Intl.message(
      'Хэл',
      name: 'settingsScreenSettingTitleLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Бүтэн Нэр`
  String get settingsScreenSettingTitleName {
    return Intl.message(
      'Бүтэн Нэр',
      name: 'settingsScreenSettingTitleName',
      desc: '',
      args: [],
    );
  }

  /// `Дизайн`
  String get settingsScreenSettingTitleTheme {
    return Intl.message(
      'Дизайн',
      name: 'settingsScreenSettingTitleTheme',
      desc: '',
      args: [],
    );
  }

  /// `AMOLED`
  String get settingsScreenSettingTitleThemeAMOLED {
    return Intl.message(
      'AMOLED',
      name: 'settingsScreenSettingTitleThemeAMOLED',
      desc: '',
      args: [],
    );
  }

  /// `Харанхуй`
  String get settingsScreenSettingTitleThemeDark {
    return Intl.message(
      'Харанхуй',
      name: 'settingsScreenSettingTitleThemeDark',
      desc: '',
      args: [],
    );
  }

  /// `Гэрэлтэй`
  String get settingsScreenSettingTitleThemeLight {
    return Intl.message(
      'Гэрэлтэй',
      name: 'settingsScreenSettingTitleThemeLight',
      desc: '',
      args: [],
    );
  }

  /// `Энэхүү Апп нь таньд өдөр тутамдаа санхүүгийнхээ орлого зарлагыг хөтлөн явуулахад туслах зорилготой юм: https://example app share link`
  String get expenseManagerDrawerMessageShare {
    return Intl.message(
      'Энэхүү Апп нь таньд өдөр тутамдаа санхүүгийнхээ орлого зарлагыг хөтлөн явуулахад туслах зорилготой юм: https://example app share link',
      name: 'expenseManagerDrawerMessageShare',
      desc: '',
      args: [],
    );
  }

  /// `Аппын талаар дэлгэрэнгүй`
  String get expenseManagerDrawerTextAbout {
    return Intl.message(
      'Аппын талаар дэлгэрэнгүй',
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

  /// `Ангиллууд`
  String get expenseManagerDrawerTextCategories {
    return Intl.message(
      'Ангиллууд',
      name: 'expenseManagerDrawerTextCategories',
      desc: '',
      args: [],
    );
  }

  /// `Мөнгөн тэмдэгтүүд`
  String get expenseManagerDrawerTextCurrencies {
    return Intl.message(
      'Мөнгөн тэмдэгтүүд',
      name: 'expenseManagerDrawerTextCurrencies',
      desc: '',
      args: [],
    );
  }

  /// `JSON/CSV ээр экспортлох`
  String get expenseManagerDrawerTextExport {
    return Intl.message(
      'JSON/CSV ээр экспортлох',
      name: 'expenseManagerDrawerTextExport',
      desc: '',
      args: [],
    );
  }

  /// `Гарах`
  String get expenseManagerDrawerTextLogout {
    return Intl.message(
      'Гарах',
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

  /// `Хуваалцах`
  String get expenseManagerDrawerTextShare {
    return Intl.message(
      'Хуваалцах',
      name: 'expenseManagerDrawerTextShare',
      desc: '',
      args: [],
    );
  }

  /// `ТАНЫ ТӨСӨВ`
  String get expenseManagerOverviewTextBalanceHeading {
    return Intl.message(
      'ТАНЫ ТӨСӨВ',
      name: 'expenseManagerOverviewTextBalanceHeading',
      desc: '',
      args: [],
    );
  }

  /// `Та Нийт үлдэгдэл болох  {budgetAmount} {symbol}-өөс {monthYear} сарын байдлаар {spendAmount} {symbol} зарцуулсан байна.`
  String expenseManagerOverviewTextBudgetSet(Object budgetAmount, Object symbol, Object monthYear, Object spendAmount) {
    return Intl.message(
      'Та Нийт үлдэгдэл болох  $budgetAmount $symbol-өөс $monthYear сарын байдлаар $spendAmount $symbol зарцуулсан байна.',
      name: 'expenseManagerOverviewTextBudgetSet',
      desc: '',
      args: [budgetAmount, symbol, monthYear, spendAmount],
    );
  }

  /// `Энд дарж сар бүрийн орлогын хэмжээгээ оруулснаар илүү үр дүнтэй хөтлөлтийг хийгээрэй.`
  String get expenseManagerOverviewTextBudgetUnset {
    return Intl.message(
      'Энд дарж сар бүрийн орлогын хэмжээгээ оруулснаар илүү үр дүнтэй хөтлөлтийг хийгээрэй.',
      name: 'expenseManagerOverviewTextBudgetUnset',
      desc: '',
      args: [],
    );
  }

  /// `НЭМЭХ`
  String get transactionBottomSheetButtonTextAdd {
    return Intl.message(
      'НЭМЭХ',
      name: 'transactionBottomSheetButtonTextAdd',
      desc: '',
      args: [],
    );
  }

  /// `Зарлага`
  String get transactionBottomSheetButtonTextExpense {
    return Intl.message(
      'Зарлага',
      name: 'transactionBottomSheetButtonTextExpense',
      desc: '',
      args: [],
    );
  }

  /// `Орлого`
  String get transactionBottomSheetButtonTextIncome {
    return Intl.message(
      'Орлого',
      name: 'transactionBottomSheetButtonTextIncome',
      desc: '',
      args: [],
    );
  }

  /// `ШИНЭЧЛЭХ`
  String get transactionBottomSheetButtonTextUpdate {
    return Intl.message(
      'ШИНЭЧЛЭХ',
      name: 'transactionBottomSheetButtonTextUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Дүн`
  String get transactionBottomSheetLabelTextAmount {
    return Intl.message(
      'Дүн',
      name: 'transactionBottomSheetLabelTextAmount',
      desc: '',
      args: [],
    );
  }

  /// `Огноо`
  String get transactionBottomSheetLabelTextDate {
    return Intl.message(
      'Огноо',
      name: 'transactionBottomSheetLabelTextDate',
      desc: '',
      args: [],
    );
  }

  /// `Тайлбар (заавал биш)`
  String get transactionBottomSheetLabelTextDescription {
    return Intl.message(
      'Тайлбар (заавал биш)',
      name: 'transactionBottomSheetLabelTextDescription',
      desc: '',
      args: [],
    );
  }

  /// `Шинэ гүйлгээ хийх`
  String get transactionBottomSheetTextHeadingAdd {
    return Intl.message(
      'Шинэ гүйлгээ хийх',
      name: 'transactionBottomSheetTextHeadingAdd',
      desc: '',
      args: [],
    );
  }

  /// `Гүйлгээ шинэчлэх`
  String get transactionBottomSheetTextHeadingUpdate {
    return Intl.message(
      'Гүйлгээ шинэчлэх',
      name: 'transactionBottomSheetTextHeadingUpdate',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'transactionListHiddenTransactionText' key

  /// `ЦЭВЭРЛЭХ`
  String get updateBudgetBottomSheetButtonTextClear {
    return Intl.message(
      'ЦЭВЭРЛЭХ',
      name: 'updateBudgetBottomSheetButtonTextClear',
      desc: '',
      args: [],
    );
  }

  /// `ТӨСӨВ ОРУУЛАХ`
  String get updateBudgetBottomSheetButtonTextSetBudget {
    return Intl.message(
      'ТӨСӨВ ОРУУЛАХ',
      name: 'updateBudgetBottomSheetButtonTextSetBudget',
      desc: '',
      args: [],
    );
  }

  /// `Энд дарж сар бүрийн орлогын хэмжээгээ оруулснаар илүү үр дүнтэй хөтлөлтийг хийгээрэй.`
  String get updateBudgetBottomSheetHeadingText {
    return Intl.message(
      'Энд дарж сар бүрийн орлогын хэмжээгээ оруулснаар илүү үр дүнтэй хөтлөлтийг хийгээрэй.',
      name: 'updateBudgetBottomSheetHeadingText',
      desc: '',
      args: [],
    );
  }

  /// `ТӨСӨВ`
  String get updateBudgetBottomSheetLabelTextBudget {
    return Intl.message(
      'ТӨСӨВ',
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