// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a mn locale. All the
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
  String get localeName => 'mn';

  static m0(type) => "${type} ангилал шинээр нэмэх";

  static m1(category) => "${Intl.select(category, {
        'Automobile': 'Машин',
        'Awards': 'Шагнал',
        'BabyCare': 'Хүүхдэд',
        'Bonus': 'Урамшуулал',
        'Books': 'Ном',
        'Charity': 'Хандив',
        'Clothing': 'Хувцас',
        'Drinks': 'Уух юмс',
        'Education': 'Боловсрол',
        'Electronics': 'Цахилгаан бараа',
        'Entertainment': 'Шоу',
        'Food': 'Хоол',
        'Freelance': 'Гэрээ',
        'FriendsFamily': 'Найзууд & Гэр бүл',
        'Gifts': 'Бэлэг',
        'Grants': 'Тусламж',
        'Groceries': 'Хүнс',
        'Health': 'Эрүүл мэнд',
        'Hobbies': 'Хобби',
        'Insurance': 'Даатгал',
        'Interest': 'Сонирхол',
        'Investments': 'Хөрөнгө оруулалт',
        'Laundry': 'Угаалгын газар',
        'Lottery': 'Сугалаа',
        'Mobile': 'Гар утас',
        'Office': 'Оффис',
        'Others': 'Бусад',
        'Pets': 'Тэжээвэр амьтан',
        'Refunds': 'Буцаан олголт',
        'Rent': 'Түрээс',
        'Salary': 'Цалин',
        'Sale': 'Зарсан',
        'SalonSpa': 'Салон & Спа',
        'Shopping': 'Дэлгүүр хэсэх',
        'Tax': 'Такси',
        'Transportation': 'Ачаа тээвэр',
        'Travel': 'Аялал',
        'Utilities': 'Гэр ахуйн',
        'other': '${category}',
      })}";

  static m2(budgetAmount, symbol, monthYear, spendAmount) =>
      "Та Нийт үлдэгдэл болох  ${budgetAmount} ${symbol}-өөс ${monthYear} сарын байдлаар ${spendAmount} ${symbol} зарцуулсан байна.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
        "addCategoryBottomSheetButtonTextAdd":
            MessageLookupByLibrary.simpleMessage("НЭМЭХ"),
        "addCategoryBottomSheetButtonTextCancel":
            MessageLookupByLibrary.simpleMessage("ЦУЦЛАХ"),
        "addCategoryBottomSheetHeadingText": m0,
        "addCategoryBottomSheetLabelTextCategoryName":
            MessageLookupByLibrary.simpleMessage("Ангиллын нэр"),
        "appName": MessageLookupByLibrary.simpleMessage("Mina app"),
        "categoriesScreenAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Ангиллууд"),
        "categoriesScreenButtonTextAddNew":
            MessageLookupByLibrary.simpleMessage("НЭМЭХ"),
        "categoriesScreenSnackbarTextDeleteMessage":
            MessageLookupByLibrary.simpleMessage(
                "Ангилал амжилттай устгагдлаа"),
        "categoriesScreenSnackbarTextResetCategoriesAction":
            MessageLookupByLibrary.simpleMessage("Тийм"),
        "categoriesScreenSnackbarTextResetCategoriesConfirmation":
            MessageLookupByLibrary.simpleMessage(
                "Бүх ангиллыг хуучин хэвэнд нь буцаах уу?"),
        "categoriesScreenSnackbarTextResetCategoriesSuccess":
            MessageLookupByLibrary.simpleMessage(
                "Бүх ангилал амжилттай анхны төлөв рүү буцаагдлаа"),
        "categoriesScreenTabBarTextExpense":
            MessageLookupByLibrary.simpleMessage("Зарлага"),
        "categoriesScreenTabBarTextIncome":
            MessageLookupByLibrary.simpleMessage("Орлого"),
        "categoryName": m1,
        "currenciesScreenAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Мөнгөн тэмдэгтүүд"),
        "currenciesScreenSnackbarTextResetCurrenciesAction":
            MessageLookupByLibrary.simpleMessage("Тийм"),
        "currenciesScreenSnackbarTextResetCurrenciesConfirmation":
            MessageLookupByLibrary.simpleMessage(
                "Бүх мөнгөн тэмдэгтүүдийг хуучин хэвэнд нь буцаахдаа итгэлтэй байна уу?"),
        "currenciesScreenSnackbarTextResetCurrenciesSuccess":
            MessageLookupByLibrary.simpleMessage(
                "Бүх мөнгөн тэмдэгтүүд амжилттай анхны төлөв рүү буцаагдлаа"),
        "currencySetupTextHeadline": MessageLookupByLibrary.simpleMessage(
            "Таны ашиглах мөнгөн тэмдэгт юу вэ?"),
        "deleteAccountDialogButtonTextCancel":
            MessageLookupByLibrary.simpleMessage(
                "Үгүй, Би бүртгэлээ устгахыг хүсэхгүй байна!"),
        "deleteAccountDialogButtonTextDelete":
            MessageLookupByLibrary.simpleMessage(
                "Тийм, миний бүртгэлийг устгана уу!"),
        "deleteAccountDialogContent": MessageLookupByLibrary.simpleMessage(
            "Та өөрийн бүх датаг устгах гэж байна (Профайлын өгөгдөл болон, гүйлгээний мэдээлэл устгагдана) буцаах боломжгүй тул та итгэлтэй байна уу?"),
        "deleteAccountDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Та өөрийн хаягийг устгахдаа итгэлтэй байна уу?"),
        "expenseManagerDrawerMessageShare": MessageLookupByLibrary.simpleMessage(
            "Энэхүү Апп нь таньд өдөр тутамдаа санхүүгийнхээ орлого зарлагыг хөтлөн явуулахад туслах зорилготой юм: https://example app share link"),
        "expenseManagerDrawerTextAbout":
            MessageLookupByLibrary.simpleMessage("Аппын талаар дэлгэрэнгүй"),
        "expenseManagerDrawerTextAboutAppLegalese":
            MessageLookupByLibrary.simpleMessage("Нэмэлт мэдээлэл бббббббб"),
        "expenseManagerDrawerTextAboutFooter":
            MessageLookupByLibrary.simpleMessage("бас нэмэлт мэдээлэл йййййй!"),
        "expenseManagerDrawerTextCategories":
            MessageLookupByLibrary.simpleMessage("Ангиллууд"),
        "expenseManagerDrawerTextCurrencies":
            MessageLookupByLibrary.simpleMessage("Мөнгөн тэмдэгтүүд"),
        "expenseManagerDrawerTextExport":
            MessageLookupByLibrary.simpleMessage("JSON/CSV ээр экспортлох"),
        "expenseManagerDrawerTextLogout":
            MessageLookupByLibrary.simpleMessage("Гарах"),
        "expenseManagerDrawerTextSettings":
            MessageLookupByLibrary.simpleMessage("Тохиргоо"),
        "expenseManagerDrawerTextShare":
            MessageLookupByLibrary.simpleMessage("Хуваалцах"),
        "expenseManagerOverviewTextBalanceHeading":
            MessageLookupByLibrary.simpleMessage("ТАНЫ ТӨСӨВ"),
        "expenseManagerOverviewTextBudgetSet": m2,
        "expenseManagerOverviewTextBudgetUnset":
            MessageLookupByLibrary.simpleMessage(
                "Та энд дарж сарынхаа зарцуулах ерөнхий төсвийг оруулна уу"),
        "exportBottomSheetButtonTextDownload":
            MessageLookupByLibrary.simpleMessage("ТАТАХ"),
        "exportBottomSheetButtonTextExport":
            MessageLookupByLibrary.simpleMessage("ЭКСПОРТЛОХ"),
        "exportBottomSheetHeadingText":
            MessageLookupByLibrary.simpleMessage("CSV/JSON оор экспортлох"),
        "exportBottomSheetLabelTextEndDate":
            MessageLookupByLibrary.simpleMessage("Дуусах хугацаа"),
        "exportBottomSheetLabelTextStartDate":
            MessageLookupByLibrary.simpleMessage("Эхлэх хугацаа"),
        "exportBottomSheetTextDateValidationError":
            MessageLookupByLibrary.simpleMessage(
                "Эхлэх хугацаа дуусах хугацаанаас өмнө байх ёстой"),
        "homeDailyNoTransactionsTextSubtitle":
            MessageLookupByLibrary.simpleMessage(
                " + тэмдэг дээр дарж орлого/зарлага нэмэх боломжтой"),
        "homeDailyNoTransactionsTextTitle":
            MessageLookupByLibrary.simpleMessage(
                "Энэхүү жагсаалт хоосон байна..."),
        "loginButtonTextGoogle":
            MessageLookupByLibrary.simpleMessage("Google ээр нэвтрэх"),
        "loginButtonTextGuest":
            MessageLookupByLibrary.simpleMessage("Зочноор нэвтрэх"),
        "loginTextTagline": MessageLookupByLibrary.simpleMessage(
            "Энэхүү Апп нь таньд өдөр тутамдаа санхүүгийнхээ орлого зарлагыг хөтлөн явуулахад туслах зорилготой юм."),
        "profileSetupButtonTextNext":
            MessageLookupByLibrary.simpleMessage("ДАРААГИЙН"),
        "profileSetupLabelTextEmailAddress":
            MessageLookupByLibrary.simpleMessage("И-Мейл хаяг"),
        "profileSetupLabelTextFullName":
            MessageLookupByLibrary.simpleMessage("Овог нэр"),
        "profileSetupTextHeadline": MessageLookupByLibrary.simpleMessage(
            "Та нэр болон и-мэйл хаягаа оруулна уу"),
        "settingsScreenHeaderTitleAccount":
            MessageLookupByLibrary.simpleMessage("Бүртгэл"),
        "settingsScreenHeaderTitleDangerZone":
            MessageLookupByLibrary.simpleMessage("Аюултай бүс"),
        "settingsScreenHeaderTitlePreferences":
            MessageLookupByLibrary.simpleMessage("Тохиргоо"),
        "settingsScreenSettingTitleAccentColor":
            MessageLookupByLibrary.simpleMessage("Аппын өнгө"),
        "settingsScreenSettingTitleBiometric":
            MessageLookupByLibrary.simpleMessage(
                "Хурууны хээ/царайгаар нэвтрэх"),
        "settingsScreenSettingTitleBiometricDescription":
            MessageLookupByLibrary.simpleMessage(
                "Та аппыг нээх болгонд хурууны хээ/болон царайгаар нэвтрэх болно."),
        "settingsScreenSettingTitleCurrency":
            MessageLookupByLibrary.simpleMessage("Мөнгөн тэмдэгт"),
        "settingsScreenSettingTitleDeleteAccount":
            MessageLookupByLibrary.simpleMessage("Бүртгэл устгах"),
        "settingsScreenSettingTitleEmailAddress":
            MessageLookupByLibrary.simpleMessage("И-мейл хаяг"),
        "settingsScreenSettingTitleLanguage":
            MessageLookupByLibrary.simpleMessage("Хэл"),
        "settingsScreenSettingTitleName":
            MessageLookupByLibrary.simpleMessage("Бүтэн Нэр"),
        "settingsScreenSettingTitleTheme":
            MessageLookupByLibrary.simpleMessage("Дизайн"),
        "settingsScreenSettingTitleThemeAMOLED":
            MessageLookupByLibrary.simpleMessage("Амолэд"),
        "settingsScreenSettingTitleThemeDark":
            MessageLookupByLibrary.simpleMessage("Харанхуй"),
        "settingsScreenSettingTitleThemeLight":
            MessageLookupByLibrary.simpleMessage("Гэрэлтэй"),
        "transactionBottomSheetButtonTextAdd":
            MessageLookupByLibrary.simpleMessage("НЭМЭХ"),
        "transactionBottomSheetButtonTextExpense":
            MessageLookupByLibrary.simpleMessage("Зарлага"),
        "transactionBottomSheetButtonTextIncome":
            MessageLookupByLibrary.simpleMessage("Орлого"),
        "transactionBottomSheetButtonTextUpdate":
            MessageLookupByLibrary.simpleMessage("ШИНЭЧЛЭХ"),
        "transactionBottomSheetLabelTextAmount":
            MessageLookupByLibrary.simpleMessage("Дүн"),
        "transactionBottomSheetLabelTextDate":
            MessageLookupByLibrary.simpleMessage("Огноо"),
        "transactionBottomSheetLabelTextDescription":
            MessageLookupByLibrary.simpleMessage("Тайлбар (заавал биш)"),
        "transactionBottomSheetTextHeadingAdd":
            MessageLookupByLibrary.simpleMessage("Шинэ гүйлгээ хийх"),
        "transactionBottomSheetTextHeadingUpdate":
            MessageLookupByLibrary.simpleMessage("Гүйлгээ шинэчлэх"),
        "updateBudgetBottomSheetButtonTextClear":
            MessageLookupByLibrary.simpleMessage("ЦЭВЭРЛЭХ"),
        "updateBudgetBottomSheetButtonTextSetBudget":
            MessageLookupByLibrary.simpleMessage("ТӨСӨВ ОРУУЛАХ"),
        "updateBudgetBottomSheetHeadingText":
            MessageLookupByLibrary.simpleMessage(
                "Та энд дарж сарынхаа зарцуулах ерөнхий төсвийг оруулна уу"),
        "updateBudgetBottomSheetLabelTextBudget":
            MessageLookupByLibrary.simpleMessage("ТӨСӨВ"),
        "walletSectionEmptyText": MessageLookupByLibrary.simpleMessage(
            "Таньд данс байхгүй байна \n + \n дарж данс нээнэ үү.")
      };
}
