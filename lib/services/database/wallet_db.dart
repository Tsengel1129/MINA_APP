import 'package:expensemanager/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Wallet;
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

class WalletDatabaseService {
  final User user;
  static Firestore _db = Firestore.instance;
  CollectionReference _walletCollection;

  WalletDatabaseService(this.user) {
    _walletCollection =
        _db.collection('users').document(this.user?.uid).collection('wallets');
  }

  Stream<List<Wallet>> get wallets => _walletCollection
          .orderBy('timestamp', descending: true)
          .snapshots()
          .map((x) {
        return x.documents.map((y) {
          return Wallet.fromJson(y.data);
        }).toList();
      });

  Stream<double> get balance => _walletCollection.snapshots().map((x) {
        var wallets = x.documents.map((y) {
          return Wallet.fromJson(y.data);
        }).toList();

        return wallets.fold(0, (value, element) => (value + element.amount));
      });

  Stream<List<Wallet>> walletsByMonth(DateTime date) {
    var firstDay = new DateTime(date.year, date.month, 1);
    var lastDay = new DateTime(date.year, date.month + 1, 0);

    return _walletCollection
        .where('timestamp', isGreaterThanOrEqualTo: firstDay)
        .where('timestamp', isLessThanOrEqualTo: lastDay)
        .snapshots()
        .map((x) {
      return x.documents.map((y) {
        return Wallet.fromJson(y.data);
      }).toList();
    });
  }

  addWallet(Wallet wallet) async {
    var doc = await _walletCollection.add(wallet.toJson());
    return doc.updateData({'id': doc.documentID});
  }

  updateWallet(Wallet wallet) {
    return _walletCollection.document(wallet.id).updateData(wallet.toJson());
  }

  deleteWallet(Wallet wallet) async {
    await _walletCollection.document(wallet.id).delete();
  }

  Map<String, List<Wallet>> groupWalletsByDate(
    List<Wallet> wallets,
  ) {
    return groupBy<Wallet, String>(wallets, (txn) {
      return DateFormat('dd MMMM y').format(txn.timestamp);
    });
  }
}
