class CardModel {
  final int id;
  final String bankname;
  final String cardnumber;
  final int available;
  final String currency;

  CardModel(
      {this.id, this.bankname, this.cardnumber, this.available, this.currency});
}
