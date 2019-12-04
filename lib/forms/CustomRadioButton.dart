/*
import 'package:custom_radio/custom_radio.dart';
import 'package:flutter/material.dart';
import 'CustomRadioButtonUtils.dart';

class CustomRadioButton {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomRadio<String, double>(
                  value: 'First',
                  groupValue: widget.radioValue,
                  duration: Duration(milliseconds: 500),
                  animsBuilder: (AnimationController controller) =>
                  [
                    CurvedAnimation(
                        parent: controller,
                        curve: Curves.easeInOut
                    )
                  ],
                  builder: simpleBuilder
              ),
              CustomRadio<String, double>(
                  value: 'Second',
                  groupValue: widget.radioValue,
                  duration: Duration(milliseconds: 500),
                  animsBuilder: (AnimationController controller) =>
                  [
                    CurvedAnimation(
                        parent: controller,
                        curve: Curves.easeInOut
                    )
                  ],
                  builder: simpleBuilder
              ),
              CustomRadio<String, double>(
                  value: 'Third',
                  groupValue: widget.radioValue,
                  duration: Duration(milliseconds: 500),
                  animsBuilder: (AnimationController controller) =>
                  [
                    CurvedAnimation(
                        parent: controller,
                        curve: Curves.easeInOut
                    )
                  ],
                  builder: simpleBuilder
              ),
            ],
          ),

        ],
      ),
    );
  }
}*/
