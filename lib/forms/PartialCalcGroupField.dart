import 'dart:async';

import 'package:custom_radio/custom_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/src/utils/utils.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';
import 'package:sized_context/sized_context.dart';

/// A material design radio buttons.
class PartialCalcGroupField<Value> extends StatefulWidget {
  bool reset;
  bool error;
  bool previous;

  final initialValue;
  final formBloc;

  PartialCalcGroupField({
    Key key,
    @required this.selectFieldBloc,
    @required this.itemBuilder,
    this.enableOnlyWhenFormBlocCanSubmit = false,
    this.isEnabled = true,
    this.errorBuilder,
    this.padding,
    this.decoration = const InputDecoration(),
    this.canDeselect = true,
    this.nextFocusNode,
    this.title,
    this.reset,
    this.error,
    this.previous,
    this.initialValue,
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
  _PartialCalcGroupFieldState<Value> createState() =>
      _PartialCalcGroupFieldState();
}

class _PartialCalcGroupFieldState<Value> extends State<PartialCalcGroupField> {
  Map<String, bool> isSelected = {};
  final prefs = PreferenciasUsuario();
  bool firstRun = true;
  bool _errorFlag = false;
  StreamSubscription streamSubError;

  @override
  void initState() {
    //prueba a quitar stream de errores, creo que funcionará igual
    /*streamSubError = prefs.errorUpdates.listen((newVal) =>
        setState(() {
          _errorFlag = newVal;
        }));*/
    //prefs.setError(true);
    super.initState();
  }

  @override
  dispose() {
    //streamSubError.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectFieldBloc<Value>, SelectFieldBlocState<Value>>(
      bloc: widget.selectFieldBloc,
      builder: (context, state) {
        //Solo se inicia el mapa en el primer arranque de la app
        if (firstRun) {
          _initMap(state);
          firstRun = false;
        }
        if (widget.previous) {
          updateMap(state);
        }
        //else updateMap(state);
        //updateMap(state);

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

  updateMap(SelectFieldBlocState<Value> state) {
    for (int i = 0; i < state.items.length; i++) {
      if (state.items.elementAt(i).toString() ==
          widget.initialValue.toString()) {
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
      //width: 90,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          aux.tr(widget.title),
          style: TextStyle(
            color: Colors.black,
            fontSize: isTablet ? 15 : 12,
          ),
        ));
  }

  Expanded _buildOptionsRow(SelectFieldBlocState state,
      RadioBuilder<String, double> simpleBuilder) {
    var aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;

    return Expanded(
      child: Container(
        //alignment: Alignment.center,
        padding: EdgeInsets.only(
          left: 15.0,
        ),
        //color: Colors.red,
        width: 100.0 * state.items.length,
        height: 20.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.items.length,
          //padding: EdgeInsets.symmetric(vertical: 1),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.reset = false;
                      widget.previous = false;
                      //prefs.setError(false);
                      print("selectfield blo " + widget.title);
                      //TODO metodo aparte, adaptado al Map<String,bool>
                      if (widget.title == 'encephalopaty') {
                        prefs
                            .getErrorMap()
                            .update('encephalopaty', (v) => false);
                      } else if (widget.title == 'ascites') {
                        prefs.getErrorMap().update('ascites', (v) => false);
                      } else if (widget.title == 'dialysis') {
                        prefs.getErrorMap().update('dialysis', (v) => false);
                      }
                      _errorFlag = false;

                      _initMap(state);

                      //Elemento seleccionado
                      radioValue = state.items.elementAt(index).toString();

                      widget.selectFieldBloc
                          .updateValue(radioValue); //Actualizo el valor
                      isSelected[radioValue] = true;
                    });
                  },
                  child: Container(
                    //color: Colors.black,
                    height: 20,
                    width: isTablet ? 110 : 90,
                    //color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          //color: Colors.red,
                          child: CustomRadio<String, double>(
                            value: state.items.elementAt(index).toString(),
                            groupValue: radioValue,
                            duration: Duration(milliseconds: 150),
                            animsBuilder: (AnimationController controller) =>
                            [
                              CurvedAnimation(
                                  parent: controller, curve: Curves.easeInOut)
                            ],
                            builder: (BuildContext context,
                                List<double> animValues,
                                Function updateState,
                                String value) {
                              final alpha = (animValues[0] * 255).toInt();
                              var opacity =
                              (!widget.reset && !_errorFlag) ? alpha : 0;

                              /* print("dentro builder " +
                                  isSelected.toString() +
                                  " reset " +
                                  widget.reset.toString() +
                                  " error " +
                                  _errorFlag.toString());*/
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
                                      (!widget.reset && !_errorFlag)
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
                                      (!widget.reset && !_errorFlag)
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

            //return Row
          },
        ),
      ),
    );
  }

  InputDecoration _buildDecoration(BuildContext context,
      SelectFieldBlocState<Value> state, bool isEnable) {
    InputDecoration decoration = this.widget.decoration;
    //prefs.setError(false);
    _errorFlag = false;
    return decoration.copyWith(
      /*suffix: SizedBox(width: 100,),//.shrink(),
      prefixIcon: SizedBox.shrink(),
      prefix: SizedBox.shrink(),
      suffixIcon: SizedBox.shrink(),*/
      enabled: isEnable,
      contentPadding:
      //EdgeInsets.all(0),

      Style.getGroupFieldBlocContentPadding(
        isVisible: true,
        decoration: decoration,
      ),
      errorText: Style.getErrorText(
        context: context,
        //errorBuilder: widget.errorBuilder,
        errorBuilder:
        //widget.error ? (context,error){_errorFlag=true; return null;} : widget.errorBuilder,
            (context, error) {
          //widget.errorBuilder;
          //print(error);
          //prefs.setError(true);
          print("selectfield to string: " + widget.selectFieldBloc.toString());
          /* print("error desde error builder part group " +
              prefs.getError().toString());*/
          //_errorFlag = true;
          switch (error) {
            case ValidatorsError.requiredSelectFieldBloc:
            //prefs.setError(true);
              _errorFlag = true;
              return null; //null; //"dentro";
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
