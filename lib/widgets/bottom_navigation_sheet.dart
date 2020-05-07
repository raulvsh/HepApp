import 'package:flutter/material.dart';

class BottomNavigationSheet extends StatelessWidget {
  final currentPage;
  final route;
  final endPage;

  BottomNavigationSheet(this.currentPage, this.route, this.endPage);

  @override
  Widget build(BuildContext context) {
    List<IconButton> widgets = [];
    var backIcon = IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: Theme.of(context).primaryColor,
      onPressed: () =>
          Navigator.pushReplacementNamed(
              context, '$route', arguments: currentPage - 1),
    );

    var nextIcon = IconButton(
      icon: Icon(Icons.arrow_forward_ios),
      color: Theme.of(context).primaryColor,
      onPressed: () =>
          Navigator.pushReplacementNamed(
              context, '$route', arguments: currentPage + 1),
    );
    //print('Contador i $i, url $url, endpage $endPage');
    if (currentPage == 0) {
      widgets.add(nextIcon);
    } else if (currentPage == endPage - 1) {
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
