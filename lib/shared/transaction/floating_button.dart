import 'package:expensemanager/shared/shared.dart';
import 'package:flutter/material.dart';

class AddTransactionFloatingButton extends StatelessWidget {
  AddTransactionFloatingButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.5),
        color: Theme.of(context).accentColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        color: Colors.white,
        iconSize: 34,
        icon: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => TransactionBottomSheet(),
          );
        },
      ),
    );
    // return FloatingActionButton(
    //   onPressed: () {
    //     showModalBottomSheet(
    //       context: context,
    //       isScrollControlled: true,
    //       builder: (context) => TransactionBottomSheet(),
    //     );
    //   },
    //   elevation: 0,
    //   shape: RoundedRectangleBorder(
    //       side: BorderSide(color: Colors.pink, width: 4.0)),
    //   splashColor: Colors.white.withOpacity(0.5),
    //   backgroundColor: Theme.of(context).accentColor,
    //   foregroundColor: Colors.white,
    //   child: Icon(
    //     Icons.add,
    //     size: 32,
    //   ),
    // );
  }
}
