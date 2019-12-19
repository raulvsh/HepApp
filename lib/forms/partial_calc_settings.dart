import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hepapp/forms/partial_calc_settings_bloc.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';

import 'CustomButtonGroupFieldBlocBuilder.dart';

class PartialCalcSettings extends StatefulWidget {
  @override
  _PartialCalcSettingsState createState() => _PartialCalcSettingsState();
}

class _PartialCalcSettingsState extends State<PartialCalcSettings> {
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    /*prefs.internationalUnits = true;
    _international_units = prefs.internationalUnits;*/
  }

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);

    return BlocProvider<PartialCalcSettingsBloc>(
      builder: (context) => PartialCalcSettingsBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<PartialCalcSettingsBloc>(context);

          return AlertDialog(
              content: ConstrainedBox(
                constraints: BoxConstraints.tight(Size.fromHeight(125)),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomButtonGroupFieldBlocBuilder(
                        selectFieldBloc: formBloc.iuField,
                        text: aux.tr('international_units'),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        //body: Text('CheckboxFieldBlocBuilder'),
                      ),
                      Container(
                        width: 150,
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: Color.fromARGB(255, 45, 145, 155),
                                width: 2,
                              )),
                          color: Theme
                              .of(context)
                              .primaryColor,
                          splashColor: Color.fromARGB(255, 56, 183, 198),
                          elevation: 3,
                          onPressed: () async {
                            //print('antes setstate ${prefs.internationalUnits}');

                            formBloc.submit();

                            setState(() {});
                            //Muestro si están activadas las unidades internacionales, servirá para hacer los cálculos
                            //print('despues setstate ${prefs.internationalUnits}');
                            //Hay que esperar a que se cambie la variable
                            await Future<void>.delayed(
                                Duration(milliseconds: 250));

                            //Solo salgo del AlertDialog si el usuario ha seleccionado un valor
                            //print('iufield ${formBloc.iuField.value}');
                            if (formBloc.iuField.value != null)
                              Navigator.pop(context);

                            //print('despues ${prefs.internationalUnits}');

                          },
                          child: Center(
                            child: Text(
                              aux.tr('save_settings'),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            ),
          ));
        },
      ),
    );
  }
}
