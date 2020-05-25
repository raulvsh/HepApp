import 'package:custom_radio/custom_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/src/utils/utils.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:sized_context/sized_context.dart';

/// A material design radio buttons.
class CalcGroupField<Value> extends StatefulWidget {
  final reset;
  final error;

  //final previous;

  //final initialValue;
  final formBloc;
  final errorControl;

  CalcGroupField({
    Key key,
    @required this.selectFieldBloc,
    @required this.itemBuilder,
    this.errorControl = false,
    this.enableOnlyWhenFormBlocCanSubmit = false,
    this.isEnabled = true,
    this.errorBuilder,
    this.padding,
    this.decoration = const InputDecoration(),
    this.canDeselect = true,
    this.nextFocusNode,
    this.title,
    this.reset = false,
    this.error = false,
    //this.previous = false,
    //this.initialValue,
    this.formBloc,
  })  : assert(selectFieldBloc != null),
        assert(enableOnlyWhenFormBlocCanSubmit != null),
        assert(isEnabled != null),
        assert(canDeselect != null),
        assert(decoration != null),
        super(key: key);

  /// {@macro flutter_form_bloc.FieldBlocBuilder.fieldBloc}
  final SelectFieldBloc<Value> selectFieldBloc;

  /// {@macro flutter_form_bloc.FieldBlocBuilder.stringItemBuilder}
  final FieldBlocStringItemBuilder<Value> itemBuilder;

  /// {@macro flutter_form_bloc.FieldBlocBuilder.errorBuilder}
  final FieldBlocErrorBuilder errorBuilder;

  /// {@macro flutter_form_bloc.FieldBlocBuilder.enableOnlyWhenFormBlocCanSubmit}
  final bool enableOnlyWhenFormBlocCanSubmit;

  /// {@macro flutter_form_bloc.FieldBlocBuilder.isEnabled}
  final bool isEnabled;

  /// {@macro flutter_form_bloc.FieldBlocBuilder.padding}
  final EdgeInsetsGeometry padding;

  /// if `true` the radio button selected can
  ///  be deselect by tapping.
  final bool canDeselect;

  /// {@macro flutter_form_bloc.FieldBlocBuilder.decoration}
  final InputDecoration decoration;

  /// {@macro flutter_form_bloc.FieldBlocBuilder.nextFocusNode}
  final FocusNode nextFocusNode;

  /// Le mandamos el texto que aparecerá al principio de la fila
  final String title;

  @override
  _CalcGroupFieldState<Value> createState() => _CalcGroupFieldState();
}

class _CalcGroupFieldState<Value> extends State<CalcGroupField> {
  Map<String, bool> isSelected = {};
  final prefs = UserSettings();
  bool firstRun = true;
  bool _errorFlag = false;
  bool _resetFlag = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectFieldBloc<Value>, SelectFieldBlocState<Value>>(
      bloc: widget.selectFieldBloc,
      builder: (context, state) {
        if (firstRun) {
          _initMap(state);

          firstRun = false;
        }
        /*if (widget.previous) {
          updateMap(state);
        }*/
        //markInitialValue(state);

        updateMap(state);

        final isEnabled = fieldBlocIsEnabled(
          isEnabled: this.widget.isEnabled,
          enableOnlyWhenFormBlocCanSubmit:
              widget.enableOnlyWhenFormBlocCanSubmit,
          fieldBlocState: state,
        );

        return DefaultFieldBlocBuilderPadding(
          padding: widget.padding,
          child: InputDecorator(
            decoration: _buildDecoration(context, state, isEnabled),
            child: _buildRadioButtons(state, isEnabled),
          ),
        );
      },
    );
  }

  _initMap(SelectFieldBlocState<Value> state) {
    for (int i = 0; i < state.items.length; i++) {
      isSelected[state.items.elementAt(i).toString()] = false;
    }
  }

  /*markInitialValue(SelectFieldBlocState<Value> state) {
    for (int i = 0; i < state.items.length; i++) {
      if (state.items.elementAt(i).toString() ==
          widget.initialValue.toString()) {
        isSelected[state.items.elementAt(i).toString()] = true;
      } else
        isSelected[state.items.elementAt(i).toString()] = false;
    }
  }*/

  updateMap(SelectFieldBlocState<Value> state) {
    for (int i = 0; i < state.items.length; i++) {
      if (state.items.elementAt(i).toString() == state.value.toString()) {
        isSelected[state.items.elementAt(i).toString()] = true;
      } else
        isSelected[state.items.elementAt(i).toString()] = false;
    }
  }

  var radioValue = '';

  Widget _buildRadioButtons(SelectFieldBlocState<Value> state, bool isEnable) {
    RadioBuilder<String, double> simpleBuilder;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildInitialBlueRectangle(),
        _buildInitialText(),
        _buildOptionsRow(state, simpleBuilder),
      ],
    );
  }

  Container _buildInitialBlueRectangle() {
    return Container(
      color: Color.fromARGB(255, 210, 242, 245),
      width: 10.0,
      height: 20.0,
    );
  }

  Container _buildInitialText() {
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          aux.tr(widget.title),
          style: TextStyle(
            color: Colors.black,
            fontSize: isTablet ? 15 : 12,
          ),
        ));
  }

  _buildOptionsRow(
      SelectFieldBlocState state, RadioBuilder<String, double> simpleBuilder) {
    var aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;

    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          left: 5.0,
        ),
        height: 20.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.items.length,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    _resetFlag = false;
                    _markErrorFalse();
                    _errorFlag = false;
                    _initMap(state);

                    //Elemento seleccionado
                    radioValue = state.items.elementAt(index).toString();
                    widget.selectFieldBloc.updateValue(radioValue);
                    await Future.delayed(Duration(milliseconds: 200));
                    isSelected[radioValue] = true;

                    if (widget.title == 'tumour_number') {
                      if (radioValue == '6+') {
                        prefs.setTumourNumber(6);
                      } else {
                        prefs.setTumourNumber(int.parse(radioValue));
                      }
                    }
                    setState(() {});
                    await Future.delayed(Duration(milliseconds: 300));
                  },
                  child: Container(
                    height: 20,
                    width: _calculateWidth(state),
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: CustomRadio<String, double>(
                            value: state.items.elementAt(index).toString(),
                            groupValue: radioValue,
                            duration: Duration(milliseconds: 150),
                            animsBuilder: (AnimationController controller) => [
                              CurvedAnimation(
                                  parent: controller, curve: Curves.easeInOut)
                            ],
                            builder: (BuildContext context,
                                List<double> animValues,
                                Function updateState,
                                String value) {
                              /*final alpha = (animValues[0] * 255).toInt();
                                  var opacity =
                                  (!_resetFlag && !_errorFlag) ? alpha : 0;*/
                              return Container(
                                width: 100,
                                height: 20,
                                //Alineación del texto dentro del botón

                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  //Color del fondo del botón
                                  color: isSelected[state.items
                                      .elementAt(index)
                                      .toString()] &&
                                      (!_resetFlag && !_errorFlag)
                                      ? Theme
                                      .of(context)
                                      .primaryColor
                                      : Colors.white,
                                  border: Border.all(
                                    //Color del borde
                                    color: _errorFlag
                                        ? Color.fromARGB(255, 211, 47, 47)
                                        : Color.fromARGB(255, 45, 145, 155),
                                    width: _errorFlag ? 0.9 : 1.3,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                                ),
                                // ),
                              );
                            },
                          ),
                        ),
                        DefaultFieldBlocBuilderTextStyle(
                          isEnabled: false,
                          child: Center(
                            child: Container(
                              child: Text(
                                aux.tr(state.items.elementAt(index).toString()),
                                style: TextStyle(
                                  color: isSelected[state.items
                                      .elementAt(index)
                                      .toString()] &&
                                      (!_resetFlag && !_errorFlag)
                                      ? Colors.white
                                      : Theme
                                      .of(context)
                                      .primaryColor,
                                  fontSize: isTablet ? 14 : 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _markErrorFalse() {
    prefs.getEmptyFieldsErrorMap().forEach((key, value) {
      if (widget.title == key) {
        prefs.getEmptyFieldsErrorMap().update(key, (v) => false);
      }
    });
  }

  double _calculateWidth(state) {
    var isLandscape = context.isLandscape;
    bool isTablet = context.diagonalInches >= 7;
    bool moreThanFive = state.items.length > 5.0;
    bool moreThanFour = state.items.length > 4.0;

    if (moreThanFive) {
      return isTablet ? (isLandscape ? 70 : 55) : 42;
    } else if (moreThanFour) {
      return isTablet ? 80 : 42;
    }
    return isTablet ? (isLandscape ? 110 : 100) : 90;
  }

  InputDecoration _buildDecoration(BuildContext context,
      SelectFieldBlocState<Value> state, bool isEnable) {
    InputDecoration decoration = this.widget.decoration;
    _errorFlag = false;
    _resetFlag = widget.reset;
    return decoration.copyWith(
      enabled: isEnable,
      contentPadding: Style.getGroupFieldBlocContentPadding(
        isVisible: true,
        decoration: decoration,
      ),
      errorText: Style.getErrorText(
        context: context,
        errorBuilder: (context, error) {
          switch (error) {
            case ValidatorsError.requiredSelectFieldBloc:
              if (widget.errorControl) {
                _errorFlag = true;
              }
              return null;
              break;
            default:
              return 'This text is nor valid.';
          }
        },
        fieldBlocState: state,
      ),
    );
  }
}
