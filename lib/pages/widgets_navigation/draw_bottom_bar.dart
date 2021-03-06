import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/widgets/color_select_button.dart';
import 'package:painter/painter.dart';

class DrawBottomBar extends StatelessWidget {
  const DrawBottomBar({
    Key key,
    @required PainterController controller,
  })  : _controller = controller,
        super(key: key);

  final PainterController _controller;

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);

    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                  icon: new Icon(
                    Icons.undo,
                    color: Color.fromARGB(255, 93, 188, 210),
                  ),
                  tooltip: aux.tr('undo'),
                  onPressed: _controller.undo),
              ColorSelectButton(_controller, false),
              StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                  height: 30,
                  width: 110,
                  child: Slider(
                    value: _controller.thickness,
                    onChanged: (double value) => setState(() {
                      _controller.thickness = value;
                    }),
                    min: 1.0,
                    max: 20.0,
                    activeColor: Color.fromARGB(255, 93, 188, 210),
                  ),
                );
              }),
              IconButton(
                  icon: new Icon(
                    Icons.delete,
                    color: Color.fromARGB(255, 93, 188, 210),
                  ),
                  tooltip: aux.tr('clear_image'),
                  onPressed: _controller.clear),
            ],
          ),
        ],
      ),
    );
  }
}
