import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final BuildContext context;
  final List<String> type;

  HomeButton(this.context, this.type);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'images/${type[1]}',
            ),
            Align(
              alignment: Alignment(0, 0.7),
              child: Text(
                type[0],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 93, 188, 210),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        onTap: () => Navigator.pushNamed(context, type[2]),
      ),
    );
  }
}
