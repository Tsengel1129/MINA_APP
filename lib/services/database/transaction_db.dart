// import 'dart:html';

import 'dart:convert';

import 'package:expensemanager/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

class TransactionDatabaseService {
  final User user;
  static FirebaseFirestore _db = FirebaseFirestore.instance;
  CollectionReference _transactionCollection;
  CollectionReference _transaction2Collection;
  var filterData = {};
  CollectionReference _walletCollection;
  DocumentReference _filterCollection;
  CollectionReference _filterRefCollection;

  TransactionDatabaseService(this.user) {
    _transactionCollection = _db
        .collection('users')
        .doc(this.user?.uid)
        .collection('wallets')
        .doc(this.user?.defaultWallet)
        .collection('transactions');
    _transaction2Collection = _db
        .collection('users')
        .doc(this.user?.uid)
        .collection('wallets')
        .doc("allTransactions")
        .collection('transactions');

    _walletCollection =
        _db.collection('users').doc(this.user?.uid).collection('wallets');
    _filterCollection = _db
        .collection('users')
        .doc(this.user?.uid)
        .collection('wallets')
        .doc('filtered');
    _filterRefCollection =
        _db.collection('users').doc(this.user?.uid).collection('wallets');
  }

  Stream<List<Transaction>> get mainTransactions => _transaction2Collection
          .orderBy('timestamp', descending: true)
          .snapshots()
          .map((x) {
        return x.docs.map((y) {
          // print({"mainTrans": y.data()});

          getData();
          return Transaction.fromJson(y.data());
        }).toList();
      });
  // Stream<List<Transaction>> mainFiltered () {
  //  return _transaction2Collection
  //         .where("category.type", isEqualTo: getData()['filterTransferType'])
  //         .orderBy('timestamp', descending: true)
  //         .snapshots()
  //         .map((x) {
  //       return x.docs.map((y) {
  //         print({"jelo": mainFiltered});
  //         return Transaction.fromJson(y.data());
  //       }).toList();
  //     });
  // }

  Stream<List<Transaction>> get transactions => _transactionCollection
          // .where(
          //   "category.type",
          //   isEqualTo: "transfer",
          // )
          .orderBy('timestamp', descending: true)
          .snapshots()
          .map((x) {
        return x.docs.map((y) {
          print({"walletLog": y.data()});

          return Transaction.fromJson(y.data());
        }).toList();
      });

  Stream<List<Transaction>> get filteredTransaction => _transaction2Collection
          .orderBy('timestamp', descending: true)
          .snapshots()
          .map((x) {
        return x.docs.map((y) {
          print({"walletLog": _filterCollection});

          return Transaction.fromJson(y.data());
        }).toList();
      });

  // Future<DocumentSnapshot> myCollectionData = _filterCollection.get();
  getData() async {
    var dat = await _filterCollection.get();
    return dat.data();
  }

  Future updateFilterData(
      DateTime selectedPrimaryDay,
      DateTime selectedSecondaryDay,
      List<String> mySelectedCategories,
      String filterTransferType,
      String filterWalletId) async {
    return _filterCollection.update({
      "selectedPrimaryDay:": selectedPrimaryDay,
      "selectedSecondaryDay:": selectedSecondaryDay,
      "mySelectedCategories": mySelectedCategories,
      "filterTransferType": filterTransferType,
      "filterWalletId": filterWalletId,
    });
  }

  Stream<double> get balance => _transactionCollection.snapshots().map((x) {
        var transactions = x.docs.map((y) {
          return Transaction.fromJson(y.data());
        }).toList();

        return transactions.fold(
            0, (value, element) => (value + element.amount));
      });

  Stream<List<Transaction>> expensesByMonth(DateTime date) {
    var firstDay = new DateTime(date.year, date.month, 1);
    var lastDay = new DateTime(date.year, date.month + 1, 0);
    print({"first:": firstDay, "last:": lastDay});
    return _transactionCollection
        .where('category.type', isEqualTo: 'expense')
        .where('timestamp', isGreaterThanOrEqualTo: firstDay)
        .where('timestamp', isLessThanOrEqualTo: lastDay)
        .snapshots()
        .map((x) {
      return x.docs.map((y) {
        return Transaction.fromJson(y.data());
      }).toList();
    });
  }

  Stream<List<Transaction>> filteredBy(selectedPrimaryDay, selectedSecondaryDay,
      mySelectedCategories, filterTransferType) {
    // var myday= new DateTime()
    // print({
    //   "dbFirst:": selectedPrimaryDay,
    //   "dbLast:": selectedSecondaryDay,
    //   "streamselectedCate": mySelectedCategories,
    //   "filterTransferType": filterTransferType
    // });

    return _transactionCollection
        .where('category.name', arrayContainsAny: mySelectedCategories)
        .where('category.type', isEqualTo: filterTransferType)
        .where('timestamp', isGreaterThanOrEqualTo: selectedPrimaryDay)
        .where('timestamp', isLessThanOrEqualTo: selectedSecondaryDay)
        .snapshots()
        .map((x) {
      return x.docs.map((y) {
        print({"lastAnhaa": Transaction.fromJson(y.data())});
        return Transaction.fromJson(y.data());
      }).toList();
    });
  }

  addTransaction(Transaction transaction) async {
    var lastBalance;
    var currentBalance = await _walletCollection
        .doc(transaction.walletId)
        .get()
        .then((doc) => doc.data()['amount']);
    print("==============Current Balance========");

    print(currentBalance);

    var doc = await _walletCollection
        .doc(transaction.walletId)
        .collection('transactions')
        .add(transaction.toJson());
    if (double.parse(currentBalance) == 0) {
      lastBalance = transaction.amount;
    } else {
      lastBalance = double.parse(currentBalance) + transaction.amount;
    }
    await _walletCollection
        .doc(transaction.walletId)
        .set({"amount": lastBalance.toString()}, SetOptions(merge: true));

    await _walletCollection
        .doc("allTransactions")
        .collection("transactions")
        .doc(doc.id)
        .set(transaction.toJson());
    return {
      await doc.update({'id': doc.id}),
      await _walletCollection
          .doc("allTransactions")
          .collection("transactions")
          .doc(doc.id)
          .set({'id': doc.id}, SetOptions(merge: true))
    };
  }

  addTransfer(Transaction transaction) async {
    var lastBalance;
    var currentBalance = await _walletCollection
        .doc(transaction.walletId)
        .get()
        .then((doc) => doc.data()['amount']);
    print("==============Current Balance========");

    print(currentBalance);

    var doc = await _walletCollection
        .doc(transaction.walletId)
        .collection('transactions')
        .add(transaction.toJson());
    if (double.parse(currentBalance) == 0) {
      lastBalance = transaction.amount;
    } else {
      lastBalance = double.parse(currentBalance) + transaction.amount;
    }
    await _walletCollection
        .doc(transaction.walletId)
        .set({"amount": lastBalance.toString()}, SetOptions(merge: true));

    await _walletCollection
        .doc("allTransactions")
        .collection("transactions")
        .doc(doc.id)
        .set(transaction.toJson());

    await doc.update({'id': doc.id});
    await _walletCollection
        .doc("allTransactions")
        .collection("transactions")
        .doc(doc.id)
        .set({'id': doc.id}, SetOptions(merge: true));

    var lastBalance2;
    var currentBalance2 = await _walletCollection
        .doc(transaction.walletId)
        .get()
        .then((doc) => doc.data()['amount']);

    var doc2 = await _walletCollection
        .doc(transaction.walletId2)
        .collection('transactions')
        .add(transaction.toJson());
    await doc.update({'id2': doc2.id});
    await doc2.update({'id': doc.id});

    await doc2.update({'id2': doc2.id});

    await _walletCollection
        .doc("allTransactions")
        .collection("transactions")
        .doc(doc.id)
        .set({'id2': doc2.id}, SetOptions(merge: true));

    if (double.parse(currentBalance2) == 0) {
      lastBalance2 = transaction.amount2;
    } else {
      lastBalance2 = double.parse(currentBalance) + transaction.amount2;
    }

    await _walletCollection
        .doc(transaction.walletId2)
        .collection("transactions")
        .doc(doc2.id)
        .set({
      "amount": (transaction.amount * (-1)).toString(),
      "amount2": (transaction.amount).toString()
    }, SetOptions(merge: true));
    await _walletCollection
        .doc(transaction.walletId2)
        .set({"amount": lastBalance2.toString()}, SetOptions(merge: true));
    DocumentReference document = _walletCollection
        .doc(transaction.walletId2)
        .collection("transactions")
        .doc(doc2.id);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      var data = snapshot.data();

      await _walletCollection
          .doc("allTransactions")
          .collection("transactions")
          .doc(doc2.id)
          .set(data);
    });

    return {
      await _walletCollection
          .doc("allTransactions")
          .collection("transactions")
          .doc(doc.id)
          .set({'id': doc.id, 'id2': doc2.id}, SetOptions(merge: true)),
      await _walletCollection
          .doc("allTransactions")
          .collection("transactions")
          .doc(doc2.id)
          .set({'id': doc2.id, 'id2': doc.id}, SetOptions(merge: true)),
      await _walletCollection
          .doc(transaction.walletId2)
          .collection("transactions")
          .doc(doc2.id)
          .set({'id': doc2.id, 'id2': doc.id}, SetOptions(merge: true))
    };
  }

  updateTransaction(Transaction transaction) async {
    var currentBalance = await _walletCollection
        .doc(transaction.walletId)
        .get()
        .then((doc) => doc.data()['amount']);
    print("==============Current Balance========");

    print(currentBalance);
    var previousTransactionAmount = await _walletCollection
        .doc((transaction.walletId))
        .collection('transactions')
        .doc(transaction.id)
        .get()
        .then((doc) => doc.data()['amount']);
    var tempBalance =
        double.parse(currentBalance) - double.parse(previousTransactionAmount);
    var lastBalance = tempBalance + transaction.amount;

    await _walletCollection
        .doc(transaction.walletId)
        .set({"amount": lastBalance.toString()}, SetOptions(merge: true));
    await _walletCollection
        .doc("allTransactions")
        .collection('transactions')
        .doc(transaction.id)
        .update(transaction.toJson());
    return _walletCollection
        .doc((transaction.walletId))
        .collection('transactions')
        .doc(transaction.id)
        .update(transaction.toJson());
  }

  updateTransfer(Transaction transaction) async {
    // var currentBalance = await _walletCollection
    //     .doc(transaction.walletId)
    //     .get()
    //     .then((doc) => doc.data()['amount']);
    // print("==============Current Balance========");

    // print(currentBalance);
    // var previousTransactionAmount = await _walletCollection
    //     .doc((transaction.walletId))
    //     .collection('transactions')
    //     .doc(transaction.id)
    //     .get()
    //     .then((doc) => doc.data()['amount']);
    // var tempBalance =
    //     double.parse(currentBalance) - double.parse(previousTransactionAmount);
    // var lastBalance = tempBalance + transaction.amount;

    // await _walletCollection
    //     .doc(transaction.walletId)
    //     .set({"amount": lastBalance.toString()}, SetOptions(merge: true));
    // await _walletCollection
    //     .doc("allTransactions")
    //     .collection('transactions')
    //     .doc(transaction.id)
    //     .update(transaction.toJson());
    // return _walletCollection
    //     .doc((transaction.walletId))
    //     .collection('transactions')
    //     .doc(transaction.id)
    //     .update(transaction.toJson());
  }

  deleteTransaction(Transaction transaction) async {
    if (transaction.category.type == "income" ||
        transaction.category.type == "expense") {
      try {
        Map<String, dynamic> success = await _db.runTransaction((trx) async {
          var currentBalance = await _walletCollection
              .doc(transaction.walletId)
              .get()
              .then((doc) => doc.data()['amount']);
          print("==============Current Balance========");

          print(currentBalance);
          var previousTransactionAmount = await _walletCollection
              .doc((transaction.walletId))
              .collection('transactions')
              .doc(transaction.id)
              .get()
              .then((doc) => doc.data()['amount']);
          var tempBalance = double.parse(currentBalance) -
              double.parse(previousTransactionAmount);
          await _walletCollection
              .doc(transaction.walletId)
              .set({"amount": tempBalance.toString()}, SetOptions(merge: true));
          await _walletCollection
              .doc("allTransactions")
              .collection("transactions")
              .doc(transaction.id)
              .delete();

          await _transactionCollection.doc(transaction.id).delete();
        });
        print("sucessfulle deleted" + success.toString());
      } catch (e) {
        print(e);
      }
    } else {
      if ((transaction.amount).toInt() > 0) {
        var getWalletId2 = await _walletCollection
            .doc("allTransactions")
            .collection('transactions')
            .doc(transaction.id)
            .get()
            .then((doc) => {doc.data()['walletId2']});
        print("---------");
        print(getWalletId2);
        var currentBalance = await _walletCollection
            .doc(getWalletId2.toString())
            .get()
            .then((doc) => doc.data()['amount']);
        print("==============Current Balance========");

        print(currentBalance);
        var previousTransactionAmount = await _walletCollection
            .doc(getWalletId2.toString())
            .collection("transactions")
            .doc(transaction.id)
            .get()
            .then((doc) => doc.data()['amount']);
        var tempBalance = double.parse(currentBalance) -
            double.parse(previousTransactionAmount);
        await _walletCollection
            .doc(getWalletId2.toString())
            .set({"amount": tempBalance.toString()}, SetOptions(merge: true));

        await _transactionCollection.doc(transaction.id).delete();
        return {
          await _walletCollection
              .doc("allTransactions")
              .collection("transactions")
              .doc(transaction.id)
              .delete(),
          await _walletCollection
              .doc(getWalletId2.toString())
              .collection("transactions")
              .doc(transaction.id)
              .delete()
        };
      } else {
        var currentBalance = await _walletCollection
            .doc(transaction.walletId)
            .get()
            .then((doc) => doc.data()['amount']);
        print("==============Current Balance========");

        print(currentBalance);
        var previousTransactionAmount = await _walletCollection
            .doc((transaction.walletId))
            .collection('transactions')
            .doc(transaction.id)
            .get()
            .then((doc) => doc.data()['amount']);
        var tempBalance = double.parse(currentBalance) -
            double.parse(previousTransactionAmount);
        await _walletCollection
            .doc(transaction.walletId)
            .set({"amount": tempBalance.toString()}, SetOptions(merge: true));

        await _transactionCollection.doc(transaction.id).delete();
        return {
          await _walletCollection
              .doc("allTransactions")
              .collection("transactions")
              .doc(transaction.id)
              .delete(),
          await _walletCollection
              .doc(transaction.walletId)
              .collection("transactions")
              .doc(transaction.id)
              .delete()
        };
      }
    }
  }

  Map<String, List<Transaction>> groupTransactionsByDate(
    List<Transaction> transactions,
  ) {
    return groupBy<Transaction, String>(transactions, (txn) {
      return DateFormat('dd MMMM y').format(txn.timestamp);
    });
  }
}
