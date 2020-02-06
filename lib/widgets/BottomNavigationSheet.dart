import 'package:flutter/material.dart';

class BottomNavigationSheet extends StatelessWidget {
  final i;
  final url;
  final endPage;

  BottomNavigationSheet(this.i, this.url, this.endPage);

  @override
  Widget build(BuildContext context) {
    List<IconButton> widgets = [];
    var backIcon = IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: Theme.of(context).primaryColor,
      onPressed: () =>
          Navigator.pushReplacementNamed(context, '$url', arguments: i - 1),
    );

    var nextIcon = IconButton(
      icon: Icon(Icons.arrow_forward_ios),
      color: Theme.of(context).primaryColor,
      onPressed: () =>
          Navigator.pushReplacementNamed(context, '$url', arguments: i + 1),
    );
    //print('Contador i $i, url $url, endpage $endPage');
    if (i == 0) {
      widgets.add(nextIcon);
    } else if (i == endPage - 1) {
      widgets.add(backIcon);
    } else {
      widgets.add(backIcon);
      widgets.add(nextIcon);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: widgets,
    );
  }
}
