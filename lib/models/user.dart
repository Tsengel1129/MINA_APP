import 'package:expensemanager/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String uid;
  final String name;
  final String email;
  final double budget;
  final String photoURL;
  final Currency currency;
  final String defaultWallet;

  User(
      {this.uid,
      this.name,
      this.email,
      this.budget,
      this.photoURL,
      this.currency,
      this.defaultWallet});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromFirebaseUser(FirebaseUser user) => (user != null)
      ? User(
          uid: user.uid,
          name: user.displayName ?? '',
          email: user.email ?? '',
          budget: null,
          photoURL: user.photoUrl ?? '',
          currency: null,
          defaultWallet: null)
      : null;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'uid': this.uid,
        'name': this.name,
        'email': this.email,
        'budget': this.budget,
        'photoURL': this.photoURL,
        'currency': this.currency?.toJson(),
        'defaultWallet': this.defaultWallet
      };
}
