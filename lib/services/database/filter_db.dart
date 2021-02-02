import 'dart:async';

import 'package:collection/collection.dart';
import 'package:expensemanager/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
import 'package:intl/intl.dart';

class FilterDatabaseService {
  final User user;
  static FirebaseFirestore _db = FirebaseFirestore.instance;
  DocumentReference _filterDocument;
  CollectionReference _filterCollection;
  DocumentReference _chartRef;
  CollectionReference _filterWalletCollection;
  bool isNull(String string) => string == null;
  FilterDatabaseService(this.user) {
    _filterDocument = _db
        .collection('users')
        .doc(this.user.uid)
        .collection("wallets")
        .doc("filtered");

    _filterCollection = _db
        .collection('users')
        .doc(this.user?.uid)
        .collection('wallets')
        .doc("allTransactions")
        .collection('transactions');

    _filterWalletCollection =
        _db.collection('users').doc(this.user?.uid).collection('wallets');
    _chartRef = _db
        .collection('users')
        .doc(this.user?.uid)
        .collection('wallets')
        .doc('chartRef');
  }

  // Future<User> fetchFilterDocument() =>
  //     _filterDocument.get().then((doc) => doc.data());

  Stream get filteredDocument =>
      _filterDocument.snapshots().map((user) => user.data());

  Stream<List<Transaction>> filterTransaction(
      DateTime selectedPrimaryDay,
      DateTime selectedSecondaryDay,
      List mySelectedCategories,
      String filterTransferType,
      String filterWalletId) {
    if (mySelectedCategories == null ||
        mySelectedCategories.length == 0 && filterWalletId == null) {
      return _filterCollection
          .where('category.type', isEqualTo: filterTransferType)
          .where('timestamp', isGreaterThanOrEqualTo: selectedPrimaryDay)
          .where('timestamp', isLessThanOrEqualTo: selectedSecondaryDay)
          .orderBy('timestamp', descending: true)
          .snapshots()
          .map((x) {
        print({"aldaa": x});

        return x.docs.map((y) {
          return Transaction.fromJson(y.data());
        }).toList();
      });
    } else if (mySelectedCategories[0] == "transfer" &&
        filterWalletId != null) {
      print({
        "selectedPrimaryDay": selectedPrimaryDay,
        "myfinal12": selectedSecondaryDay,
        "mySelectedCategories": mySelectedCategories,
        "filterTransferType": filterTransferType,
        "filterWalletId": filterWalletId
      });
      return _filterWalletCollection
          .doc(filterWalletId)
          .collection('transactions')
          .where('timestamp', isGreaterThanOrEqualTo: selectedPrimaryDay)
          .where('timestamp', isLessThanOrEqualTo: selectedSecondaryDay)
          .orderBy('timestamp', descending: true)
          .snapshots()
          .map((y) {
        return y.docs.map((e) {
          print({"isDocNull": e.data()});
          return Transaction.fromJson(e.data());
        }).toList();
      });
    } else if (isNull(filterWalletId) && mySelectedCategories.length > 0 ||
        mySelectedCategories != null) {
      return _filterCollection
          .where('category.type', isEqualTo: filterTransferType)
          .where('timestamp', isGreaterThanOrEqualTo: selectedPrimaryDay)
          .where('timestamp', isLessThanOrEqualTo: selectedSecondaryDay)
          .where('category.name', whereIn: mySelectedCategories)
          .orderBy('timestamp', descending: true)
          .snapshots()
          .map((y) {
        return y.docs.map((e) {
          return Transaction.fromJson(e.data());
        }).toList();
      });
    }
  }

  Future<void> dailyPieChart(pieData) {
    // print({"servicePie": pieData});
    // print(_chartRef.set({"pieCategory": []}));

    print(_chartRef.set({"pieCategory": []}, SetOptions(merge: false)));
    return _chartRef.update({"pieCategory": FieldValue.arrayUnion(pieData)});
  }

  Stream<List<dynamic>> get getPieChart => _chartRef.snapshots().map((x) {
        return x.data()['pieCategory'];
        // return x.docs.map((y) {
        //   return Wallet.fromJson(y.data());
        // }).toList();
      });

  Map<String, List<Transaction>> groupTransactionsByFilter(
    List<Transaction> transactions,
  ) {
    return groupBy<Transaction, String>(transactions, (txn) {
      return DateFormat('dd MMMM y').format(txn.timestamp);
    });
  }
}
