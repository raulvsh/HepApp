import 'package:flutter/material.dart';
import 'package:painter/painter.dart';

import 'ColorSelectButton.dart';

class DrawBottomBar extends StatelessWidget {
  const DrawBottomBar({
    Key key,
    @required PainterController controller,
  })  : _controller = controller,
        super(key: key);

  final PainterController _controller;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color.fromARGB(255, 56, 185, 199),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
              icon: new Icon(
                Icons.undo,
                color: Colors.white,
              ),
              tooltip: 'Undo',
              onPressed: _controller.undo),
          ColorSelectButton(_controller, false),
          StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return new Container(
                height: 40,
                //color: Colors.red,
                child: new Slider(
                  value: _controller.thickness,
                  onChanged: (double value) => setState(() {
                    _controller.thickness = value;
                  }),
                  min: 1.0,
                  max: 20.0,
                  activeColor: Colors.white,
                ));
          }),
          IconButton(
              icon: new Icon(
                Icons.delete,
                color: Colors.white,
              ),
              tooltip: 'Clear',
              onPressed: _controller.clear),
        ],
      ),
    );
  }
}
