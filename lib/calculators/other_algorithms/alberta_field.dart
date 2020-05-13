import 'package:flutter/material.dart';

class AlbertaField extends StatelessWidget {
  final height;
  final width;
  final color;
  final txt;
  final shape;

  const AlbertaField({
    Key key,
    this.height,
    this.width,
    this.color,
    this.txt,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        //color: Colors.blueAccent,
        decoration: BoxDecoration(
          shape: shape,
          color: color,
          border: Border.all(
            color: Theme.of(context).primaryColor, //Colors.blueAccent,
            width: 1.3,
          ),
        ),
        child: Text(
          txt,
          textAlign: TextAlign.center,
        ), //txt[index]),
      ),
    );
  }
}
