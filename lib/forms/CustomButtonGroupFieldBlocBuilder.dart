import 'package:custom_radio/custom_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/src/utils/utils.dart';
import 'package:form_bloc/form_bloc.dart';

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

  @override
  _CustomButtonGroupFieldBlocBuilderState<Value> createState() =>
      _CustomButtonGroupFieldBlocBuilderState();
}

class _CustomButtonGroupFieldBlocBuilderState<Value>
    extends State<CustomButtonGroupFieldBlocBuilder> {
  Map<String, bool> isSelected = Map<String, bool>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectFieldBloc<Value>, SelectFieldBlocState<Value>>(
      bloc: widget.selectFieldBloc,
      builder: (context, state) {
        final isEnabled = fieldBlocIsEnabled(
          isEnabled: this.widget.isEnabled,
          enableOnlyWhenFormBlocCanSubmit:
          widget.enableOnlyWhenFormBlocCanSubmit,
          fieldBlocState: state,
        );

        return DefaultFieldBlocBuilderPadding(
          padding: widget.padding,
          child: Stack(
            children: <Widget>[
              //Decoración que le viene de fuera
              InputDecorator(
                decoration: _buildDecoration(context, state, isEnabled),
                child: Opacity(
                  opacity: 0.0,
                  child: _buildRadioButtons(state, isEnabled),
                ),
              ),
              InputDecorator(
                decoration: Style.inputDecorationWithoutBorder.copyWith(
                  contentPadding: Style.getGroupFieldBlocContentPadding(
                    isVisible: true,
                    decoration: widget.decoration,
                  ),
                ),
                child: _buildRadioButtons(state, isEnabled),
              ),
            ],
          ),
        );
      },
    );
  }

  var radioValue = '';
  var colorBoton;

  Widget _buildRadioButtons(SelectFieldBlocState<Value> state, bool isEnable) {
    RadioBuilder<String, double> simpleBuilder;

    simpleBuilder = (BuildContext context, List<double> animValues,
        Function updateState, String value) {
      final alpha = (animValues[0] * 255).toInt();

      return Center(
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(2.0),
              width: 100,

              //margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 12.0),
              alignment: Alignment.center,
              //Alineación del texto dentro del botón
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color.fromARGB(255, 56, 183, 198).withAlpha(alpha),
                //Color del fondo del botón
                //Theme.of(context).primaryColor.withAlpha(alpha),
                border: Border.all(
                  color: Color.fromARGB(255, 45, 145, 155), //Color del borde

                  /*Theme
                      .of(context)
                      .primaryColor
                      .withAlpha(255 - alpha),*/

                  width: 2.0,
                ),
                borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
              ),
              /*child: Text(
                value,
                style: Theme.of(context).textTheme.body1.copyWith(
                    fontSize: 12.0,
                    color: Colors.black //isSelected['None'] ? Colors.black : Colors.red,
                    ),
              ),*/
            ),
          ],
        ),
      );
    };
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(vertical: 4),
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: state.items.length,
      itemBuilder: (context, index) {
        return InputDecorator(
          decoration: Style.inputDecorationWithoutBorder.copyWith(
            prefixIcon: Stack(
              children: <Widget>[
                GestureDetector(
                  //Funciona este ontap, saca los valores correctos al print
                  onTap: () {
                    setState(() {
                      isSelected.clear(); //Limpio el mapa
                      print(
                          'Mapa recien borrado antes de actualizar $isSelected');
                      radioValue = state.items
                          .elementAt(index)
                          .toString(); //radioValue es el elemento seleccionado

                      /* Venían en la función onChange, quizás se necesiten
                      widget.isEnabled,
                      widget.nextFocusNode,*/
                      widget.selectFieldBloc
                          .updateValue(radioValue); //Actualizo el valor

                      isSelected[radioValue] = true;

                      print('Mapa despues de actualizar $isSelected');
                    });
                  },

                  child: Stack(
                      children: <Widget>[
                        Container(
                          height: 20,
                          width: 100,
                          color: Colors.red,
                          child: CustomRadio<String, double>(
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
                        ),

                        Container(
                          color: Colors.lightBlueAccent,
                          child: Text(

                            state.items.elementAt(index).toString(),
                            style: Theme
                                .of(context)
                                .textTheme
                                .body1
                                .copyWith(
                                fontSize: 12.0,
                                color: Colors
                                    .black //isSelected['None'] ? Colors.black : Colors.red,
                            ),

                          ),
                        ),
                      ]
                  ),
                ),
                Container(

                ),

                /*Radio<Value>(
                    value: state.items.elementAt(index),
                    groupValue: state.value,
                    onChanged: onChanged,
                    activeColor: Colors.yellowAccent,
                    //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                  ),*/

                /* Solo si se puede deseleccionar, no aplica

                if (widget.canDeselect &&
                    state.items.elementAt(index) == state.value)
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Colors.transparent,
                    ),
                    child:

                    CustomRadio<String, double>(
                      value: '',
                      groupValue: '',
                      duration: Duration(milliseconds: 500),
                      animsBuilder: (AnimationController controller) => [
                        CurvedAnimation(
                            parent: controller, curve: Curves.easeInOut)
                      ],
                      builder: simpleBuilder,
                    ),

                    */ /*Radio<Value>(
                      value: null,
                      groupValue: state.value,
                      onChanged: onChanged,
                    ),*/ /*
                  )*/
              ],
            ),
          ),
          /*child: DefaultFieldBlocBuilderTextStyle(
            isEnabled: isEnabled,
            child: Text(itemBuilder(context, state.items.elementAt(index))),
          ),*/
        );
      },
    );
  }

  InputDecoration _buildDecoration(BuildContext context,
      SelectFieldBlocState<Value> state, bool isEnable) {
    InputDecoration decoration = this.widget.decoration;

    return decoration.copyWith(
      //suffix: SizedBox(width: 100,),//.shrink(),
      //prefixIcon: SizedBox.shrink(),
      //prefix: SizedBox.shrink(),
      //suffixIcon: SizedBox.shrink(),
      enabled: isEnable,
      contentPadding: Style.getGroupFieldBlocContentPadding(
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
