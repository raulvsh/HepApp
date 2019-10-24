import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:painter/painter.dart';

class ColorSelectButton extends StatefulWidget {
  final PainterController _controller;
  final bool _background;

  ColorSelectButton(this._controller, this._background);

  @override
  _ColorPickerButtonState createState() => new _ColorPickerButtonState();
}

class _ColorPickerButtonState extends State<ColorSelectButton> {
  @override
  Widget build(BuildContext context) {
    return new IconButton(
      icon: new Icon(_iconData, color: _color),
      tooltip:
          widget._background ? 'Change background color' : 'Change draw color',
      onPressed: _elegirColor,
    );
  }

  void _elegirColor() {
    Color pickerColor = _color;

    //TODO TRADUCIR MENSAJES AlertDialog
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          content: Container(
            height: 360,
            child: MaterialColorPicker(
              colors: fullMaterialColors,
              selectedColor: pickerColor,
              allowShades: false,
              onMainColorChange: ((Color c) {
                pickerColor = c;
              }),
            ),
          ),
          actions: [
            FlatButton(
              child: Text('CANCELAR'),
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
              child: Text('ACEPTAR'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _color = pickerColor);
              },
            ),
          ],
        );
      },
    );
  }

  Color get _color => widget._controller.drawColor;

  IconData get _iconData => Icons.brush;

  set _color(Color color) => widget._controller.drawColor = color;
}
