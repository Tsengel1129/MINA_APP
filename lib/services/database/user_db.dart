import 'package:expensemanager/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabaseService {
  final User user;
  static FirebaseFirestore _db = FirebaseFirestore.instance;
  DocumentReference _userDocument;

  UserDatabaseService(this.user) {
    _userDocument = _db.collection('users').doc(this.user.uid);
  }

  Future<User> fetchUserDocument() =>
      _userDocument.get().then((user) => User.fromJson(user.data()));

  Stream<User> get userDocument =>
      _userDocument.snapshots().map((user) => User.fromJson(user.data()));

  Future<bool> get checkIfUserExists async {
    try {
      var snapshot = await _userDocument.get();
      return (snapshot == null) ? false : snapshot.data()['currency'] != null;
    } catch (e) {
      return false;
    }
  }

  Future createUser() async {
    return await _userDocument.set({
      ...user.toJson(),
      'createdAt': DateTime.now(),
    }, SetOptions(merge: true));
  }

  Future updateUserName(String name) async {
    var userDoc = await fetchUserDocument();
    return _userDocument.update({
      ...userDoc.toJson(),
      'name': name,
    });
  }

  Future updateUserEmail(String email) async {
    var userDoc = await fetchUserDocument();
    return _userDocument.update({
      ...userDoc.toJson(),
      'email': email,
    });
  }

  Future updateUserCurrency(Currency currency) async {
    var userDoc = await fetchUserDocument();
    return _userDocument.update({
      ...userDoc.toJson(),
      'currency': currency.toJson(),
    });
  }

  Future updateUserBudget(double budget) async {
    var userDoc = await fetchUserDocument();
    return _userDocument.update({
      ...userDoc.toJson(),
      'budget': budget,
    });
  }

  Future updateUserDefaultWallet(String defaultWallet) async {
    var userDoc = await fetchUserDocument();
    return _userDocument.set({
      ...userDoc.toJson(),
      'defaultWallet': defaultWallet,
    }, SetOptions(merge: true));
  }

  Future updateUserPushToken(String pushToken) async {
    var userDoc = await fetchUserDocument();
    return _userDocument.update({
      ...userDoc.toJson(),
      'pushToken': pushToken,
    });
  }
}
