import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/models/models.dart';
import 'package:expensemanager/shared/shared.dart';
import 'package:flutter/material.dart';

class FilteredList extends StatefulWidget {
  //TransactionList
  final String date;
  final Map<String, List<Transaction>> grouped;

  const FilteredList({
    Key key,
    @required this.date,
    @required this.grouped,
  }) : super(key: key);

  @override
  _FilteredListState createState() => _FilteredListState();
}

class _FilteredListState extends State<FilteredList> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildListHeader(),
        ...visible
            ? widget.grouped[widget.date].map((txn) => TransactionListTile(txn))
            : [],
      ],
    );
  }

  InkWell buildListHeader() {
    return InkWell(
      onTap: () {
        setState(() => visible = !visible);
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 30,
          bottom: 10,
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            DateLabel(widget.date),
            Row(
              children: <Widget>[
                visible
                    ? Container()
                    : Text(S.of(context).categoriesScreenAppBarTitle),
                SizedBox(width: 5),
                Icon(
                  visible ? Icons.arrow_upward : Icons.arrow_downward,
                  size: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
