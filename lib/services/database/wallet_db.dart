import 'package:expensemanager/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Wallet;
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

class WalletDatabaseService {
  final User user;
  static FirebaseFirestore _db = FirebaseFirestore.instance;
  CollectionReference _walletCollection;

  WalletDatabaseService(this.user) {
    _walletCollection =
        _db.collection('users').doc(this.user?.uid).collection('wallets');
  }

  Stream<List<Wallet>> get wallets => _walletCollection
          .orderBy('timestamp', descending: true)
          .snapshots()
          .map((x) {
        return x.docs.map((y) {
          return Wallet.fromJson(y.data());
        }).toList();
      });

  Stream<double> get balance => _walletCollection.snapshots().map((x) {
        var wallets = x.docs.map((y) {
          return Wallet.fromJson(y.data());
        }).toList();

        return wallets.fold(0, (value, element) => (value + element.amount));
      });

  Stream<List<Wallet>> walletsByMonth(DateTime date) {
    // var firstDay = new DateTime(date.year, date.month, 1);
    // var lastDay = new DateTime(date.year, date.month + 1, 0);

    return _walletCollection.snapshots().map((x) {
      return x.docs.map((y) {
        return Wallet.fromJson(y.data());
      }).toList();
    });
  }

  addWallet(Wallet wallet) async {
    var doc = await _walletCollection.add(wallet.toJson());
    return doc.update({'id': doc.id, 'walletId': doc.id});
  }

  updateWallet(Wallet wallet) async {
    await _walletCollection.doc(wallet.id).update(wallet.toJson());
    return _walletCollection.doc(wallet.id).update({'walletId': wallet.id});
  }

  deleteWallet(Wallet wallet) async {
    var findQuery = await _walletCollection
        .doc(wallet.walletId)
        .collection('transactions')
        .where('walletId', isEqualTo: wallet.walletId)
        .snapshots()
        .listen((data) => {
              data.docs.forEach((dat) async {
                print(dat.id);
                await _walletCollection
                    .doc('allTransactions')
                    .collection('transactions')
                    .doc(dat.id)
                    .delete();
                await _walletCollection
                    .doc(wallet.walletId)
                    .collection('transactions')
                    .doc(dat.id)
                    .delete();
              })
            });

    // .forEach((snapshot) async {

    //   await _walletCollection
    //       .document('allTransaction')
    //       .collection('transactions')
    //       .document(snapshot.data['documents']);
    // }).map((x) {
    //   return x.documents.map((y) async {}).toList();
    // });
    // ;
    // findQuery.getDocuments().then((docs) => {
    //       for (Document myDoc in docs) {await  _walletCollection
    //     .document('allTransaction')
    //     .collection('transactions').document(myDoc.id) }
    //     });
    await _walletCollection.doc(wallet.id).delete();
  }

  Future setWalletCurrency(String id, Currency currency) async {
    return _walletCollection.doc(id).update({
      'currency': currency.toJson(),
    });
  }

  List<Wallet> groupWalletsByDate(
    List<Wallet> wallets,
  ) {
    return wallets;
  }
}
