// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(type) => "${type} add new categories";

  static m1(category) => "${Intl.select(category, {
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
        'other': '${category}',
      })}";

  static m2(budgetAmount, symbol, monthYear, spendAmount) =>
      "Your total balance ${budgetAmount} ${symbol} ${monthYear} month ${spendAmount} ${symbol}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
        "addCategoryBottomSheetButtonTextAdd":
            MessageLookupByLibrary.simpleMessage("ADD"),
        "addCategoryBottomSheetButtonTextCancel":
            MessageLookupByLibrary.simpleMessage("CANCEL"),
        "addCategoryBottomSheetHeadingText": m0,
        "addCategoryBottomSheetLabelTextCategoryName":
            MessageLookupByLibrary.simpleMessage("Categories name"),
        "appName": MessageLookupByLibrary.simpleMessage("Mina app"),
        "categoriesScreenAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Categories"),
        "categoriesScreenButtonTextAddNew":
            MessageLookupByLibrary.simpleMessage("ADD"),
        "categoriesScreenSnackbarTextDeleteMessage":
            MessageLookupByLibrary.simpleMessage("Categories deleted"),
        "categoriesScreenSnackbarTextResetCategoriesAction":
            MessageLookupByLibrary.simpleMessage("Yes"),
        "categoriesScreenSnackbarTextResetCategoriesConfirmation":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to reset categories?"),
        "categoriesScreenSnackbarTextResetCategoriesSuccess":
            MessageLookupByLibrary.simpleMessage("Reset successful"),
        "categoriesScreenTabBarTextExpense":
            MessageLookupByLibrary.simpleMessage("Expense"),
        "categoriesScreenTabBarTextIncome":
            MessageLookupByLibrary.simpleMessage("Income"),
        "categoryName": m1,
        "currenciesScreenAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Мөнгөн тэмдэгтүүд"),
        "currenciesScreenSnackbarTextResetCurrenciesAction":
            MessageLookupByLibrary.simpleMessage("Yes"),
        "currenciesScreenSnackbarTextResetCurrenciesConfirmation":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to reset currency?"),
        "currenciesScreenSnackbarTextResetCurrenciesSuccess":
            MessageLookupByLibrary.simpleMessage("Reset successful"),
        "currencySetupTextHeadline":
            MessageLookupByLibrary.simpleMessage("Please choose your currency"),
        "deleteAccountDialogButtonTextCancel":
            MessageLookupByLibrary.simpleMessage(
                "No, I dont want to delete my account"),
        "deleteAccountDialogButtonTextDelete":
            MessageLookupByLibrary.simpleMessage(
                "Yes, I want to delete my account"),
        "deleteAccountDialogContent": MessageLookupByLibrary.simpleMessage(
            "You will deleting all data (profile settings, income, expenses...) Are you sure continue this step?"),
        "deleteAccountDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete your account?"),
        "expenseManagerDrawerMessageShare": MessageLookupByLibrary.simpleMessage(
            "This app is designed to help you keep track of your daily financial income and expenses."),
        "expenseManagerDrawerTextAbout":
            MessageLookupByLibrary.simpleMessage("About app"),
        "expenseManagerDrawerTextAboutAppLegalese":
            MessageLookupByLibrary.simpleMessage("Нэмэлт мэдээлэл бббббббб"),
        "expenseManagerDrawerTextAboutFooter":
            MessageLookupByLibrary.simpleMessage("бас нэмэлт мэдээлэл йййййй!"),
        "expenseManagerDrawerTextCategories":
            MessageLookupByLibrary.simpleMessage("Categories"),
        "expenseManagerDrawerTextCurrencies":
            MessageLookupByLibrary.simpleMessage("Currencies"),
        "expenseManagerDrawerTextExport":
            MessageLookupByLibrary.simpleMessage("Export to JSON/CSV"),
        "expenseManagerDrawerTextLogout":
            MessageLookupByLibrary.simpleMessage("Logout"),
        "expenseManagerDrawerTextSettings":
            MessageLookupByLibrary.simpleMessage("Settings"),
        "expenseManagerDrawerTextShare":
            MessageLookupByLibrary.simpleMessage("Share"),
        "expenseManagerOverviewTextBalanceHeading":
            MessageLookupByLibrary.simpleMessage("YOUR BUDGET"),
        "expenseManagerOverviewTextBudgetSet": m2,
        "expenseManagerOverviewTextBudgetUnset":
            MessageLookupByLibrary.simpleMessage(
                "Click here to enter your general monthly budget"),
        "exportBottomSheetButtonTextDownload":
            MessageLookupByLibrary.simpleMessage("DOWNLOAD"),
        "exportBottomSheetButtonTextExport":
            MessageLookupByLibrary.simpleMessage("EXPORT"),
        "exportBottomSheetHeadingText":
            MessageLookupByLibrary.simpleMessage("Export to CSV/JSON"),
        "exportBottomSheetLabelTextEndDate":
            MessageLookupByLibrary.simpleMessage("End date"),
        "exportBottomSheetLabelTextStartDate":
            MessageLookupByLibrary.simpleMessage("Start date"),
        "exportBottomSheetTextDateValidationError":
            MessageLookupByLibrary.simpleMessage(
                "The start time must be before the end time"),
        "homeDailyNoTransactionsTextSubtitle":
            MessageLookupByLibrary.simpleMessage(
                "Click on the + icon to add income / expenses"),
        "homeDailyNoTransactionsTextTitle":
            MessageLookupByLibrary.simpleMessage("This list is empty..."),
        "loginButtonTextGoogle":
            MessageLookupByLibrary.simpleMessage("Sign-in with Google"),
        "loginButtonTextGuest":
            MessageLookupByLibrary.simpleMessage("Guest login"),
        "loginTextTagline": MessageLookupByLibrary.simpleMessage(
            "This app is designed to help you keep track of your daily financial income and expenses."),
        "profileSetupButtonTextNext":
            MessageLookupByLibrary.simpleMessage("NEXT"),
        "profileSetupLabelTextEmailAddress":
            MessageLookupByLibrary.simpleMessage("Email address"),
        "profileSetupLabelTextFullName":
            MessageLookupByLibrary.simpleMessage("Full name"),
        "profileSetupTextHeadline": MessageLookupByLibrary.simpleMessage(
            "Please fill in your name and email address"),
        "settingsScreenHeaderTitleAccount":
            MessageLookupByLibrary.simpleMessage("Register"),
        "settingsScreenHeaderTitleDangerZone":
            MessageLookupByLibrary.simpleMessage("Danger zone"),
        "settingsScreenHeaderTitlePreferences":
            MessageLookupByLibrary.simpleMessage("Settings"),
        "settingsScreenSettingTitleAccentColor":
            MessageLookupByLibrary.simpleMessage("Theme color"),
        "settingsScreenSettingTitleBiometric":
            MessageLookupByLibrary.simpleMessage("Fingerprint / face login"),
        "settingsScreenSettingTitleBiometricDescription":
            MessageLookupByLibrary.simpleMessage(
                "You will be logged in with your fingerprint and / or face each time you open the app."),
        "settingsScreenSettingTitleCurrency":
            MessageLookupByLibrary.simpleMessage("Currency"),
        "settingsScreenSettingTitleDeleteAccount":
            MessageLookupByLibrary.simpleMessage("Delete your account"),
        "settingsScreenSettingTitleEmailAddress":
            MessageLookupByLibrary.simpleMessage("Email address"),
        "settingsScreenSettingTitleLanguage":
            MessageLookupByLibrary.simpleMessage("Language"),
        "settingsScreenSettingTitleName":
            MessageLookupByLibrary.simpleMessage("Full name"),
        "settingsScreenSettingTitleTheme":
            MessageLookupByLibrary.simpleMessage("Theme mode"),
        "settingsScreenSettingTitleThemeAMOLED":
            MessageLookupByLibrary.simpleMessage("AMOLED mode"),
        "settingsScreenSettingTitleThemeDark":
            MessageLookupByLibrary.simpleMessage("Dark mode"),
        "settingsScreenSettingTitleThemeLight":
            MessageLookupByLibrary.simpleMessage("Light mode"),
        "transactionBottomSheetButtonTextAdd":
            MessageLookupByLibrary.simpleMessage("ADD"),
        "transactionBottomSheetButtonTextExpense":
            MessageLookupByLibrary.simpleMessage("Expense"),
        "transactionBottomSheetButtonTextIncome":
            MessageLookupByLibrary.simpleMessage("Income"),
        "transactionBottomSheetButtonTextUpdate":
            MessageLookupByLibrary.simpleMessage("UPDATE"),
        "transactionBottomSheetLabelTextAmount":
            MessageLookupByLibrary.simpleMessage("Amount"),
        "transactionBottomSheetLabelTextDate":
            MessageLookupByLibrary.simpleMessage("Date"),
        "transactionBottomSheetLabelTextDescription":
            MessageLookupByLibrary.simpleMessage("Decsription (optional)"),
        "transactionBottomSheetTextHeadingAdd":
            MessageLookupByLibrary.simpleMessage("New Transaction"),
        "transactionBottomSheetTextHeadingUpdate":
            MessageLookupByLibrary.simpleMessage("Transaction renewal"),
        "updateBudgetBottomSheetButtonTextClear":
            MessageLookupByLibrary.simpleMessage("CLEAR"),
        "updateBudgetBottomSheetButtonTextSetBudget":
            MessageLookupByLibrary.simpleMessage("YOUR BUDGET"),
        "updateBudgetBottomSheetHeadingText":
            MessageLookupByLibrary.simpleMessage(
                "Click here to enter your general monthly budget"),
        "updateBudgetBottomSheetLabelTextBudget":
            MessageLookupByLibrary.simpleMessage("YOUR BUDGET"),
        "walletBottomSheetLabelTextDescription":
            MessageLookupByLibrary.simpleMessage("yuin be"),
        "walletBottomSheetLabelTextAmount":
            MessageLookupByLibrary.simpleMessage("Дансны дугаар"),
        "walletBottomSheetTextHeadingAdd":
            MessageLookupByLibrary.simpleMessage("New Wallet"),
        "walletBottomSheetTextHeadingUpdate":
            MessageLookupByLibrary.simpleMessage("Update Wallet"),
        "walletSectionEmptyText": MessageLookupByLibrary.simpleMessage(
            "Add your new card click the \n + \n button in the bottom right")
      };
}
