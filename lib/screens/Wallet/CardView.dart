import 'package:expensemanager/screens/Wallet/CardModel.dart';
import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  final CardModel card;
  //super gesniig asuuh
  CardView(this.card) : super();

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    // card shape
    return AspectRatio(
      aspectRatio: 3.1 / 2,
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        //circle 2 shapes on wallet
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              color: Colors.red.withOpacity(.8),
                              shape: BoxShape.circle),
                        ),
                        Transform.translate(
                          offset: Offset(-15, 0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(.8),
                                shape: BoxShape.circle),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        //cardModel- iin available haruulah
                        Text(
                          widget.card.available.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                        //cardModel- iin currency haruulah
                        Text(
                          " " + widget.card.currency,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      //cardModel- iin bankname haruulah
                      child: Text(
                        widget.card.bankname,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FittedBox(
                      //cardModel- iin cardnumber haruulah
                      fit: BoxFit.contain,
                      child: Text(widget.card.cardnumber,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 10,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
