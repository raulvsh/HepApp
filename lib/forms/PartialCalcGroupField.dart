import 'package:custom_radio/custom_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/src/utils/utils.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:sized_context/sized_context.dart';

/// A material design radio buttons.
class PartialCalcGroupField<Value> extends StatefulWidget {
  bool reset;
  bool error;
  bool previous;

  final initialValue;


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
    this.text,
    this.reset,
    this.error,
    this.previous, this.initialValue
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
  final String text;

  @override
  _PartialCalcGroupFieldState<Value> createState() =>
      _PartialCalcGroupFieldState();
}

class _PartialCalcGroupFieldState<Value> extends State<PartialCalcGroupField> {
  Map<String, bool> isSelected = {};

  bool firstRun = true;

  //String selectedChoice = "";
  bool errorFlag = false;

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

          //child: Stack(
          //children: <Widget>[
          //Decoración que le viene de fuera
          //Container(
          //color: Colors.greenAccent,
          child: InputDecorator(
            decoration: _buildDecoration(context, state, isEnabled),
            child: _buildRadioButtons(state, isEnabled),
          ),
          //),
          //],
          //),
        );
      },
    );
  }

  _initMap(SelectFieldBlocState<Value> state) {
    for (int i = 0; i < state.items.length; i++) {
      isSelected[state.items.elementAt(i).toString()] = false;
      print("Init element at: " + state.items.elementAt(i).toString());
      /*if (state.items.elementAt(i).toString() == widget.initialValue) {
        isSelected[state.items.elementAt(i).toString()] = true;
      }
      else
        isSelected[state.items.elementAt(i).toString()] = false;*/

      print("Init isSelected: $isSelected");
    }
  }

  updateMap(SelectFieldBlocState<Value> state) {
    //_initMap(state);
    for (int i = 0; i < state.items.length; i++) {
      //isSelected[state.items.elementAt(i).toString()] = false;
      print("Update element at: " + state.items.elementAt(i).toString());
      print("Update widget initial value " + widget.initialValue.toString());
      if (state.items.elementAt(i).toString() ==
          widget.initialValue.toString()) {
        isSelected[state.items.elementAt(i).toString()] = true;
      }
      else
        isSelected[state.items.elementAt(i).toString()] = false;

      print("Update isSelected update: $isSelected");
    }
  }

  var radioValue = '';

  Widget _buildRadioButtons(SelectFieldBlocState<Value> state, bool isEnable) {
    RadioBuilder<String, double> simpleBuilder;

    /*simpleBuilder = (BuildContext context, List<double> animValues,
        Function updateState, String value) {
      final alpha = (animValues[0] * 255).toInt();
      var opacity = (!widget.reset && !errorFlag) ? alpha : 0;
      //var opacity = 255;
      return */ /*Center(
        child:*/ /*
          Container(
        //color: Colors.red,
        width: 100,
        height: 20,
        //Alineación del texto dentro del botón

        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          //Color del fondo del botón
          color: Theme.of(context).primaryColor.withAlpha(opacity),
          border: Border.all(
            //Color del borde
            color: errorFlag
                ? Color.fromARGB(255, 211, 47, 47)
                : Color.fromARGB(255, 45, 145, 155), //Color del borde
            width: errorFlag ? 0.9 : 1.3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
        ),
        // ),
      );
    };*/
    return Row(
      //verticalDirection: VerticalDirection.up,
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

    return Container(
      //width: 90,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          widget.text,
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
        child: //_buildChoiceList(),

            //OnlySelectChip(encephalopatyList, ),

            ListView.builder(
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
                          errorFlag = false;

                          _initMap(state);

                          radioValue = state.items
                              .elementAt(index)
                              .toString(); //radioValue es el elemento seleccionado

                          /*Venían en la función onChange, quizás se necesiten
                      widget.isEnabled,
                      widget.nextFocusNode,*/

                          widget.selectFieldBloc
                              .updateValue(radioValue); //Actualizo el valor
                          isSelected[radioValue] = true;
                          //print('Mapa actualizado $isSelected \n\n');
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
                                animsBuilder:
                                    (AnimationController controller) =>
                                [
                                  CurvedAnimation(
                                      parent: controller,
                                      curve: Curves.easeInOut)
                                ],
                                builder: (BuildContext context,
                                    List<double> animValues,
                                    Function updateState,
                                    String value) {
                                  final alpha = (animValues[0] * 255).toInt();
                                  var opacity =
                                  (!widget.reset && !errorFlag) ? alpha : 0;
                                  //var opacity = 255;
                                  //isSelected[state.items.elementAt(0)] = false;
                                  //isSelected[state.items.elementAt(1)] = false;
                                  //isSelected[state.items.elementAt(2)] = false;

                                  print("dentro builder " +
                                      isSelected.toString() + " reset " +
                                      widget.reset.toString() + " error " +
                                      errorFlag.toString());
                                  return /*Center(
        child:*/
                                    Container(
                                      //color: Colors.red,
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
                                            (!widget.reset && !errorFlag)
                                            ? Theme
                                            .of(context)
                                            .primaryColor : Colors.white,
                                        border: Border.all(
                                          //Color del borde
                                          color: errorFlag
                                              ? Color.fromARGB(255, 211, 47, 47)
                                              : Color.fromARGB(
                                              255, 45, 145, 155),
                                          //Color del borde
                                          width: errorFlag ? 0.9 : 1.3,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3.0)),
                                      ),
                                      // ),
                                    );
                                },
                              ),),
                            DefaultFieldBlocBuilderTextStyle(
                              isEnabled: false,
                              child: Center(
                                child: Container(
                                  child: Text(
                                    aux.tr(state.items.elementAt(index)
                                        .toString()),
                                    style: TextStyle(
                                      color: isSelected[state.items
                                          .elementAt(index)
                                          .toString()] &&
                                          (!widget.reset && !errorFlag)
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
    errorFlag = false;
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
        errorBuilder: (context, error) {
          print(error);
          switch (error) {
            case ValidatorsError.requiredSelectFieldBloc:
              errorFlag = true;
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

/*resetear() {
    widget.reset = true;
    setState(() {});
  }*/
}
