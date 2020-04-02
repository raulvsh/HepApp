import 'package:custom_radio/custom_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/src/utils/utils.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/lang/app_localizations.dart';

/// A material design radio buttons.
class CustomButtonGroupFieldBlocBuilder<Value> extends StatefulWidget {

  const CustomButtonGroupFieldBlocBuilder({
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
  _CustomButtonGroupFieldBlocBuilderState<Value> createState() =>
      _CustomButtonGroupFieldBlocBuilderState();
}

class _CustomButtonGroupFieldBlocBuilderState<Value>
    extends State<CustomButtonGroupFieldBlocBuilder> {
  Map<String, bool> isSelected = {
  };
  bool firstRun = true;

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
    }
  }

  var radioValue = '';

  Widget _buildRadioButtons(SelectFieldBlocState<Value> state, bool isEnable) {
    RadioBuilder<String, double> simpleBuilder;
    var aux = AppLocalizations.of(context);


    simpleBuilder = (BuildContext context, List<double> animValues,
        Function updateState, String value) {
      final alpha = (animValues[0] * 255).toInt();

      return /*Center(
        child:*/
        Container(
          //color: Colors.red,
          width: 100,
          height: 20,

          alignment: Alignment.center,
          //Alineación del texto dentro del botón
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            //Color del fondo del botón
            color: Theme
                .of(context)
                .primaryColor
                .withAlpha(alpha),
            //color: Color.fromARGB(255, 56, 183, 198).withAlpha(alpha),
            border: Border.all(
              color: Color.fromARGB(255, 45, 145, 155), //Color del borde
              width: 1.3,
            ),
            borderRadius: BorderRadius.all(new Radius.circular(3.0)),
          ),
          // ),
      );
    };
    return Row(
      //verticalDirection: VerticalDirection.up,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Color.fromARGB(255, 210, 242, 245),
          width: 10.0,
          height: 20.0,
        ),
        Container(
          //width: 90,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              widget.text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            )),
        Expanded(
          child: Container(
            //alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
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
                          _initMap(state);

                          radioValue = state.items
                              .elementAt(index)
                              .toString(); //radioValue es el elemento seleccionado

                          /* Venían en la función onChange, quizás se necesiten
                        widget.isEnabled,
                        widget.nextFocusNode,*/

                          widget.selectFieldBloc
                              .updateValue(radioValue); //Actualizo el valor
                          isSelected[radioValue] = true;
                          //print('Mapa actualizado $isSelected \n\n');
                        });
                      },

                      child: Container(
                        height: 20,
                        width: 90,
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        //color:Colors.red,
                        child: Stack(
                          children: <Widget>[
                            CustomRadio<String, double>(
                              value: state.items.elementAt(index).toString(),
                              groupValue: radioValue,
                              duration: Duration(milliseconds: 500),
                              animsBuilder: (AnimationController controller) =>
                              [
                                CurvedAnimation(
                                    parent: controller, curve: Curves.easeInOut)
                              ],
                              builder: simpleBuilder,
                            ),
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
                                          .toString()]
                                          ? Colors.white
                                          : Theme
                                          .of(context)
                                          .primaryColor,
                                      fontSize: 12,
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
        ),

      ],
    );
  }

  InputDecoration _buildDecoration(BuildContext context,
      SelectFieldBlocState<Value> state, bool isEnable) {
    InputDecoration decoration = this.widget.decoration;

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
        errorBuilder: widget.errorBuilder,
        fieldBlocState: state,
      ),
    );
  }
}
