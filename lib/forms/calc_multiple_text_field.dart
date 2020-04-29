import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:sized_context/sized_context.dart';

class CalcMultipleTextField extends StatefulWidget {
  const CalcMultipleTextField({
    Key key,
    @required this.textFieldBlocList,
    @required this.titleList,
    @required this.length,
    this.errorControl = false,
    this.numActivos = 1,
    this.multiTitle = false,
    this.udsList = '',
    this.showUds = true,
    this.hintList,
  }) : super(key: key);

  final List<TextFieldBloc> textFieldBlocList;
  final titleList;
  final udsList;
  final errorControl;
  final length;
  final int numActivos;
  final multiTitle;
  final showUds;
  final hintList;

  @override
  _CalcMultipleTextFieldState createState() => _CalcMultipleTextFieldState();
}

class _CalcMultipleTextFieldState extends State<CalcMultipleTextField> {
  final prefs = UserSettings();

  @override
  Widget build(BuildContext context) {
    bool isTablet = context.diagonalInches >= 7;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(width: 8),
        _buildInitialBlueRectangle(),
        //_buildInitialText(isTablet),

        Row(
          children: _buildTextFields(context),
        ),
      ],
    );
  }

  _buildTextFields(BuildContext context) {
    AppLocalizations aux = AppLocalizations.of(context);
    List<Widget> list = [];
    print("num activos " + widget.numActivos.toString());
    for (int i = 0; i < widget.length; i++) {
      if (widget.multiTitle || i == 0) {
        _addTitle(list, i);
      }
      _addTextField(list, context, i);
      if (widget.showUds) {
        _addUds(list, i);
        list.add(SizedBox(
          width: 20,
        ));
      }
    }

    return list;
  }

  void _addTitle(
    List<Widget> list,
    int i,
  ) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    list.add(Container(
        //color: Colors.red,
        //width: 90,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          aux.tr(widget.titleList[i]),
          style: TextStyle(
            color: Colors.black,
            fontSize: isTablet ? 15 : 12,
          ),
        )));
  }

  void _addUds(List<Widget> list, int i) {
    bool isTablet = context.diagonalInches >= 7;

    list.add(
      Container(
          //color: Colors.red,
          //width: 90,
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            widget.udsList[i], //'umol/L',
            style: TextStyle(
              color: Colors.black,
              fontSize: isTablet ? 15 : 12,
            ),
          )),
    );
  }

  void _addTextField(List<Widget> list, BuildContext context, int i) {
    bool isTablet = context.diagonalInches >= 7;

    list.add(
      Container(
        width: _calculateWidth(widget.length),
        height: 40,
        child: TextFieldBlocBuilder(
          padding: widget.multiTitle
              ? EdgeInsets.symmetric(
                  vertical: 10, horizontal: isTablet ? 10 : 5)
              : EdgeInsets.symmetric(
                  vertical: 10, horizontal: isTablet ? 5 : 5),
          cursorColor: Theme.of(context).primaryColor,
          keyboardType: TextInputType.numberWithOptions(),
          isEnabled: i <= widget.numActivos ? true : false,
          textFieldBloc: widget.textFieldBlocList[i],
          expands: false,
          style: TextStyle(
            fontSize: isTablet ? 14 : 12,
            color: Theme.of(context).primaryColor,
          ),
          decoration: InputDecoration(
            hintText: widget.hintList != null ? widget.hintList[i] : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.0),
              borderSide: BorderSide(
                width: 1.3,
                color: Color.fromARGB(255, 45, 145, 155),
              ), //color: Colors.red),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.0),
              borderSide: BorderSide(
                width: 1.3,
                color: Color.fromARGB(255, 45, 145, 155),
              ), //color: Colors.red),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          ),
          onChanged: (text) => _markErrorFalse(),
          errorBuilder: widget.errorControl
              ? (context, error) {
                  _markErrorTrue();
                  switch (error) {
                    case ValidatorsError.requiredTextFieldBloc:
                      return "";
                    default:
                      return 'This text is nor valid.';
                  }
                }
              : (context, error) => null,
        ),
      ),
    );
  }

  void _markErrorTrue() {
    prefs.getErrorMap().forEach((key, value) {
      if (widget.titleList == key) {
        prefs.getErrorMap().update(key, (v) => true);
      }
    });
  }

  void _markErrorFalse() {
    print("holi text " + prefs.getErrorMap().toString());
    prefs.getErrorMap().forEach((key, value) {
      if (widget.titleList == key) {
        prefs.getErrorMap().update(key, (v) => false);
      }
    });
  }

  /*Container _buildInitialText(bool isTablet) {

    AppLocalizations aux = AppLocalizations.of(context);
    return Container(
        //color: Colors.red,
        //width: 90,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          aux.tr(widget.titleList),
          style: TextStyle(
            color: Colors.black,
            fontSize: isTablet ? 15 : 12,
          ),
        ));
  }*/

  Container _buildInitialBlueRectangle() {
    return Container(
      color: Color.fromARGB(255, 210, 242, 245),
      width: 10.0,
      height: 20.0,
    );
  }

  double _calculateWidth(length) {
    bool isTablet = context.diagonalInches >= 7;
    bool moreThanTree = length > 3.0;
    if (moreThanTree) {
      return isTablet ? 60 : 50;
    }
    return isTablet ? 90 : 60;
  }
}
