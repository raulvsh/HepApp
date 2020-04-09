import 'package:flutter/material.dart';
import 'package:hepapp/widgets/ComboButton.dart';
import 'package:hepapp/widgets/FigureButton.dart';

//const String _documentPath = 'assets/HepM1C1.pdf';

class CommonGridPage extends StatefulWidget {
  final data;
  final String type;

  final index;

  CommonGridPage({this.data, this.type, this.index = 0});

  @override
  _CommonGridPageState createState() => _CommonGridPageState();
}

class _CommonGridPageState extends State<CommonGridPage> {
  var dataLength;

  @override
  void initState() {
    dataLength = widget.data.length;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return _buildLayout(orientation);
    });
  }

  _buildLayout(orientation) {
    final width = MediaQuery.of(context).size.width;
    var padding = width / 100;

    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Colors.lightBlueAccent,
      child: FractionallySizedBox(
        widthFactor: orientation == Orientation.portrait ? 0.60 : 0.7,
        alignment: Alignment.center,
        child: GridView.count(
          padding: orientation == Orientation.portrait
              ? EdgeInsets.symmetric(vertical: 6 * padding)
              : EdgeInsets.symmetric(vertical: 2 * padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildGridView(),
        ),
      ),
    );
  }

  _buildGridView() {
    List<Widget> widgets = [];
    for (int i = 0; i < dataLength; i++) {
      if (widget.type == 'figure') {
        widgets.add(FigureButton(context, widget.data[i], i + widget.index,));
      } else {
        widgets.add(ComboButton(context, widget.data[i], i + widget.index));
      }
    }
    return widgets;
  }
}
