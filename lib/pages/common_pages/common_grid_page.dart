import 'package:flutter/material.dart';
import 'package:hepapp/widgets/combo_button.dart';
import 'package:hepapp/widgets/figure_button.dart';
import 'package:sized_context/sized_context.dart';

class CommonGridPage extends StatefulWidget {
  final data;
  final String type;

  CommonGridPage({this.data, this.type});

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
    var padding = context.widthPct(0.01);
    bool isTablet = context.diagonalInches >= 7;
    bool isLandscape = context.isLandscape;

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: FractionallySizedBox(
        widthFactor:
        isLandscape ? (isTablet ? 0.7 : 0.7) : (isTablet ? 0.6 : 0.7),
        alignment: Alignment.topCenter,
        child: GridView.count(
          padding: isLandscape
              ? EdgeInsets.symmetric(
              vertical: isTablet ? 5 * padding : 2 * padding)
              : EdgeInsets.symmetric(vertical: 3 * padding),
          primary: false,
          crossAxisCount: isLandscape ? 4 : 2,
          children: _buildGridView(),
        ),
      ),
    );
  }

  _buildGridView() {
    List<Widget> widgets = [];
    for (int i = 0; i < dataLength; i++) {
      if (widget.type == 'figure') {
        widgets.add(FigureButton(
          context,
          widget.data[i],
          i,
        ));
      } else {
        widgets
            .add(ComboButton(context, widget.data[i], i)); //+ widget.index));
      }
    }
    return widgets;
  }
}
