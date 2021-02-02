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

  static m1(category) => "${Intl.select(category, {'Salary': 'salary', 'Bonus': 'bonus', 'Gift': 'gift', 'Others': 'others', 'Refund': 'refund', 'Refund_to': 'refund_to', 'Loan': 'loan', 'Offering': 'offering', 'Apartment': 'apartment', 'Support': 'support', 'School_fee': 'school_fee', 'Food': 'food', 'Laundry': 'laundry', 'Children': 'children', 'Transportation': 'transportation', 'Dishes': 'dishes', 'Health': 'health', 'Beauty': 'beauty', 'Mobile': 'mobile', 'Education': 'education', 'Furniture': 'furniture', 'Clothes': 'clothes', 'Loan_intereset': 'loan_intereset', 'Travel': 'travel', 'Pets': 'pets', 'other': '${category}', })}";

  static m2(budgetAmount, symbol, monthYear, spendAmount) => "Your total balance ${budgetAmount} ${symbol} ${monthYear} month ${spendAmount} ${symbol}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "addCategoryBottomSheetButtonTextAdd" : MessageLookupByLibrary.simpleMessage("ADD"),
    "addCategoryBottomSheetButtonTextCancel" : MessageLookupByLibrary.simpleMessage("CANCEL"),
    "addCategoryBottomSheetHeadingText" : m0,
    "addCategoryBottomSheetLabelTextCategoryIcon" : MessageLookupByLibrary.simpleMessage("Icon"),
    "addCategoryBottomSheetLabelTextCategoryName" : MessageLookupByLibrary.simpleMessage("Categories name"),
    "addReminder" : MessageLookupByLibrary.simpleMessage("Add reminder"),
    "addcategoryName" : MessageLookupByLibrary.simpleMessage("Name"),
    "appName" : MessageLookupByLibrary.simpleMessage("Mina app"),
    "categoriesDeleteAreYouSure" : MessageLookupByLibrary.simpleMessage("Are you sure you want to delete this category?"),
    "categoriesLabelTextCategoryTypeAppearance" : MessageLookupByLibrary.simpleMessage("Appearance"),
    "categoriesLabelTextCategoryTypeNecessary" : MessageLookupByLibrary.simpleMessage("Necessary"),
    "categoriesLabelTextCategoryTypeNeeds" : MessageLookupByLibrary.simpleMessage("Needs"),
    "categoriesScreenAppBarTitle" : MessageLookupByLibrary.simpleMessage("Categories"),
    "categoriesScreenButtonTextAddNew" : MessageLookupByLibrary.simpleMessage("ADD"),
    "categoriesScreenSnackbarTextDelete" : MessageLookupByLibrary.simpleMessage("Delete"),
    "categoriesScreenSnackbarTextDeleteMessage" : MessageLookupByLibrary.simpleMessage("Category deleted successfully"),
    "categoriesScreenSnackbarTextResetCategoriesAction" : MessageLookupByLibrary.simpleMessage("Yes"),
    "categoriesScreenSnackbarTextResetCategoriesConfirmation" : MessageLookupByLibrary.simpleMessage("Are you sure you want to reset categories?"),
    "categoriesScreenSnackbarTextResetCategoriesSuccess" : MessageLookupByLibrary.simpleMessage("Reset successful"),
    "categoriesScreenTabBarTextExpense" : MessageLookupByLibrary.simpleMessage("Expense"),
    "categoriesScreenTabBarTextIncome" : MessageLookupByLibrary.simpleMessage("Income"),
    "categoryName" : m1,
    "currenciesScreenAppBarTitle" : MessageLookupByLibrary.simpleMessage("Currency"),
    "currenciesScreenSnackbarTextResetCurrenciesAction" : MessageLookupByLibrary.simpleMessage("Yes"),
    "currenciesScreenSnackbarTextResetCurrenciesConfirmation" : MessageLookupByLibrary.simpleMessage("Are you sure you want to reset currency?"),
    "currenciesScreenSnackbarTextResetCurrenciesSuccess" : MessageLookupByLibrary.simpleMessage("Reset successful"),
    "currencySetupTextHeadline" : MessageLookupByLibrary.simpleMessage("Please choose your currency"),
    "deleteAccountDialogButtonTextCancel" : MessageLookupByLibrary.simpleMessage("No, I dont want to delete my account"),
    "deleteAccountDialogButtonTextDelete" : MessageLookupByLibrary.simpleMessage("Yes, I want to delete my account"),
    "deleteAccountDialogContent" : MessageLookupByLibrary.simpleMessage("You will deleting all data (profile settings, income, expenses...) Are you sure continue this step?"),
    "deleteAccountDialogTitle" : MessageLookupByLibrary.simpleMessage("Are you sure you want to delete your account?"),
    "expenseManagerDrawerMessageShare" : MessageLookupByLibrary.simpleMessage("This app is designed to help you keep track of your daily financial income and expenses."),
    "expenseManagerDrawerTextAbout" : MessageLookupByLibrary.simpleMessage("About app"),
    "expenseManagerDrawerTextAboutAppLegalese" : MessageLookupByLibrary.simpleMessage("Additional info"),
    "expenseManagerDrawerTextAboutFooter" : MessageLookupByLibrary.simpleMessage("Additional Info"),
    "expenseManagerDrawerTextCategories" : MessageLookupByLibrary.simpleMessage("Categories"),
    "expenseManagerDrawerTextCurrencies" : MessageLookupByLibrary.simpleMessage("Currencies"),
    "expenseManagerDrawerTextExport" : MessageLookupByLibrary.simpleMessage("Export to JSON/CSV"),
    "expenseManagerDrawerTextLogout" : MessageLookupByLibrary.simpleMessage("Logout"),
    "expenseManagerDrawerTextSettings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "expenseManagerDrawerTextShare" : MessageLookupByLibrary.simpleMessage("Share"),
    "expenseManagerOverviewTextBalanceHeading" : MessageLookupByLibrary.simpleMessage("YOUR BUDGET"),
    "expenseManagerOverviewTextBudgetSet" : m2,
    "expenseManagerOverviewTextBudgetUnset" : MessageLookupByLibrary.simpleMessage("Click here to enter your general monthly budget"),
    "exportBottomSheetButtonTextDownload" : MessageLookupByLibrary.simpleMessage("DOWNLOAD"),
    "exportBottomSheetButtonTextExport" : MessageLookupByLibrary.simpleMessage("EXPORT"),
    "exportBottomSheetHeadingText" : MessageLookupByLibrary.simpleMessage("Export to CSV/JSON"),
    "exportBottomSheetLabelTextEndDate" : MessageLookupByLibrary.simpleMessage("End date"),
    "exportBottomSheetLabelTextStartDate" : MessageLookupByLibrary.simpleMessage("Start date"),
    "exportBottomSheetTextDateValidationError" : MessageLookupByLibrary.simpleMessage("The start time must be before the end time"),
    "filterTitle" : MessageLookupByLibrary.simpleMessage("Filter"),
    "filterTransfer" : MessageLookupByLibrary.simpleMessage("Transfer"),
    "filterTransferAccount" : MessageLookupByLibrary.simpleMessage("Account"),
    "filteredTitle" : MessageLookupByLibrary.simpleMessage("Filtered Transactions"),
    "homeDailyNoTransactionsTextSubtitle" : MessageLookupByLibrary.simpleMessage("Click on the + icon to add income / expenses"),
    "homeDailyNoTransactionsTextTitle" : MessageLookupByLibrary.simpleMessage("If you have created an account"),
    "loginButtonTextGoogle" : MessageLookupByLibrary.simpleMessage("Sign-in with Google"),
    "loginButtonTextGuest" : MessageLookupByLibrary.simpleMessage("Guest login"),
    "loginTextTagline" : MessageLookupByLibrary.simpleMessage("This app is designed to help you keep track of your daily financial income and expenses."),
    "profileSetupButtonTextNext" : MessageLookupByLibrary.simpleMessage("NEXT"),
    "profileSetupLabelTextEmailAddress" : MessageLookupByLibrary.simpleMessage("Email address"),
    "profileSetupLabelTextFullName" : MessageLookupByLibrary.simpleMessage("Full name"),
    "profileSetupTextHeadline" : MessageLookupByLibrary.simpleMessage("Please fill in your name and email address"),
    "reminderBottomSheetTextDate" : MessageLookupByLibrary.simpleMessage("Date"),
    "reminderBottomSheetTextRepeat" : MessageLookupByLibrary.simpleMessage("Repeat"),
    "reminderBottomSheetTextRepeatDay" : MessageLookupByLibrary.simpleMessage("Day repeat"),
    "reminderBottomSheetTextRepeatDay2" : MessageLookupByLibrary.simpleMessage("Frequency of days"),
    "reminderBottomSheetTextTittle" : MessageLookupByLibrary.simpleMessage("Title"),
    "reminderBottomSheetchooseDate" : MessageLookupByLibrary.simpleMessage("Choose date"),
    "reminderDeleted" : MessageLookupByLibrary.simpleMessage("Reminder deleted"),
    "reminderDeletedUndo" : MessageLookupByLibrary.simpleMessage("Undo"),
    "reminderMinute" : MessageLookupByLibrary.simpleMessage("minute"),
    "reminderSave" : MessageLookupByLibrary.simpleMessage("Save"),
    "reminderSelectTime" : MessageLookupByLibrary.simpleMessage("Time"),
    "reminderSelectedDate" : MessageLookupByLibrary.simpleMessage("Selected date: "),
    "reminderSelectedTime" : MessageLookupByLibrary.simpleMessage("Selected time: "),
    "settingsAppBar" : MessageLookupByLibrary.simpleMessage("Settings"),
    "settingsBudgetPreferences" : MessageLookupByLibrary.simpleMessage("Budget"),
    "settingsGeneralPreferences" : MessageLookupByLibrary.simpleMessage("General"),
    "settingsProfilePreferences" : MessageLookupByLibrary.simpleMessage("Edit profile"),
    "settingsReminderPreferences" : MessageLookupByLibrary.simpleMessage("Reminder"),
    "settingsScreenGeneral_TitlePreferences" : MessageLookupByLibrary.simpleMessage("General"),
    "settingsScreenHeaderTitleAccount" : MessageLookupByLibrary.simpleMessage("Register"),
    "settingsScreenHeaderTitleDangerZone" : MessageLookupByLibrary.simpleMessage("Danger zone"),
    "settingsScreenHeaderTitlePreferences" : MessageLookupByLibrary.simpleMessage("Settings"),
    "settingsScreenSettingTitleAccentColor" : MessageLookupByLibrary.simpleMessage("Theme color"),
    "settingsScreenSettingTitleBiometric" : MessageLookupByLibrary.simpleMessage("Fingerprint / face login"),
    "settingsScreenSettingTitleBiometricDescription" : MessageLookupByLibrary.simpleMessage("You will be logged in with your fingerprint and / or face each time you open the app."),
    "settingsScreenSettingTitleCurrency" : MessageLookupByLibrary.simpleMessage("Currency"),
    "settingsScreenSettingTitleDeleteAccount" : MessageLookupByLibrary.simpleMessage("Delete your account"),
    "settingsScreenSettingTitleEmailAddress" : MessageLookupByLibrary.simpleMessage("Email address"),
    "settingsScreenSettingTitleLanguage" : MessageLookupByLibrary.simpleMessage("Change language"),
    "settingsScreenSettingTitleName" : MessageLookupByLibrary.simpleMessage("Full name"),
    "settingsScreenSettingTitleTheme" : MessageLookupByLibrary.simpleMessage("Theme mode"),
    "settingsScreenSettingTitleThemeAMOLED" : MessageLookupByLibrary.simpleMessage("AMOLED mode"),
    "settingsScreenSettingTitleThemeDark" : MessageLookupByLibrary.simpleMessage("Dark mode"),
    "settingsScreenSettingTitleThemeLight" : MessageLookupByLibrary.simpleMessage("Light mode"),
    "textNavFilter" : MessageLookupByLibrary.simpleMessage("Filter"),
    "textNavHome" : MessageLookupByLibrary.simpleMessage("Home"),
    "textNavSettings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "textNavTransaction" : MessageLookupByLibrary.simpleMessage("Transaction"),
    "textNavWallet" : MessageLookupByLibrary.simpleMessage("Wallet"),
    "transactionBottomSheetButtonChooseWallet" : MessageLookupByLibrary.simpleMessage("Choose account"),
    "transactionBottomSheetButtonTextAccountExpense" : MessageLookupByLibrary.simpleMessage("From"),
    "transactionBottomSheetButtonTextAccountIncome" : MessageLookupByLibrary.simpleMessage("To"),
    "transactionBottomSheetButtonTextAdd" : MessageLookupByLibrary.simpleMessage("ADD"),
    "transactionBottomSheetButtonTextExpense" : MessageLookupByLibrary.simpleMessage("Expense"),
    "transactionBottomSheetButtonTextIncome" : MessageLookupByLibrary.simpleMessage("Income"),
    "transactionBottomSheetButtonTextUpdate" : MessageLookupByLibrary.simpleMessage("UPDATE"),
    "transactionBottomSheetLabelTextAmount" : MessageLookupByLibrary.simpleMessage("Possible balance"),
    "transactionBottomSheetLabelTextDate" : MessageLookupByLibrary.simpleMessage("Date"),
    "transactionBottomSheetLabelTextDescription" : MessageLookupByLibrary.simpleMessage("Description (optional)"),
    "transactionBottomSheetTextHeadingAdd" : MessageLookupByLibrary.simpleMessage("New Transaction"),
    "transactionBottomSheetTextHeadingUpdate" : MessageLookupByLibrary.simpleMessage("Transaction renewal"),
    "transactionBottomTextAmount" : MessageLookupByLibrary.simpleMessage("Amount"),
    "updateBudgetBottomSheetButtonTextClear" : MessageLookupByLibrary.simpleMessage("CLEAR"),
    "updateBudgetBottomSheetButtonTextSetBudget" : MessageLookupByLibrary.simpleMessage("YOUR BUDGET"),
    "updateBudgetBottomSheetHeadingText" : MessageLookupByLibrary.simpleMessage("Click here to enter your general monthly budget"),
    "updateBudgetBottomSheetLabelTextBudget" : MessageLookupByLibrary.simpleMessage("YOUR BUDGET"),
    "walletBottomSheetLabelDescription" : MessageLookupByLibrary.simpleMessage("Description"),
    "walletBottomSheetLabelTextAmount" : MessageLookupByLibrary.simpleMessage("Account number"),
    "walletBottomSheetLabelTextBankAccount" : MessageLookupByLibrary.simpleMessage("Bank account"),
    "walletBottomSheetLabelTextCash" : MessageLookupByLibrary.simpleMessage("Cash"),
    "walletBottomSheetLabelTextDescription" : MessageLookupByLibrary.simpleMessage("Bank name\n"),
    "walletBottomSheetLabelTextLoanAccount" : MessageLookupByLibrary.simpleMessage("Loan"),
    "walletBottomSheetLabelTextSaving" : MessageLookupByLibrary.simpleMessage("Saving"),
    "walletBottomSheetTextHeadingAdd" : MessageLookupByLibrary.simpleMessage("New Wallet"),
    "walletBottomSheetTextHeadingUpdate" : MessageLookupByLibrary.simpleMessage("Update Wallet"),
    "walletBottomSheetType" : MessageLookupByLibrary.simpleMessage("Type"),
    "walletEmptySubText" : MessageLookupByLibrary.simpleMessage("Click + to create your account"),
    "walletEmptyText" : MessageLookupByLibrary.simpleMessage("You do not have an account"),
    "walletSectionEmptyText" : MessageLookupByLibrary.simpleMessage("Add your new card click the \n + \n button in the bottom right"),
    "walletTitle" : MessageLookupByLibrary.simpleMessage("Accounts")
  };
}
