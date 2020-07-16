import 'package:flutter/material.dart';

class BottomNavigationSheet extends StatelessWidget {
  final int currentPage;
  final route;
  final endPage;

  BottomNavigationSheet(this.currentPage, this.route, this.endPage);

  @override
  Widget build(BuildContext context) {
    List<IconButton> widgets = [];

    if (currentPage == 0) {
      widgets.add(_buildNextIcon(context));
    } else if (currentPage == endPage - 1) {
      widgets.add(_buildBackIcon(context));
    } else {
      widgets.add(_buildBackIcon(context));
      widgets.add(_buildNextIcon(context));
    }

    return Container(
      alignment: Alignment.bottomRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: widgets,
      ),
    );
  }

  IconButton _buildBackIcon(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: Theme.of(context).primaryColor,
      onPressed: () => Navigator.pushReplacementNamed(context, '$route',
          arguments: currentPage - 1),
    );
  }

  IconButton _buildNextIcon(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_forward_ios),
      color: Theme
          .of(context)
          .primaryColor,
      onPressed: () =>
          Navigator.pushReplacementNamed(context, '$route',
              arguments: currentPage + 1),
    );
  }
}
