import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';
import 'package:observable/observable.dart';

import 'complete_form_bloc.dart';

class CompleteForm extends StatefulWidget with Observable {
  CompleteForm({Key key}) : super(key: key);

  @override
  CompleteFormState createState() => CompleteFormState();
}

class CompleteFormState extends State<CompleteForm> with Observable {
  var reset = false;
  var previous = false;
  final prefs = PreferenciasUsuario();
  final units = Units();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompleteFormBloc>(
      builder: (context) => CompleteFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<CompleteFormBloc>(context);
          return FormBlocListener<CompleteFormBloc, String, String>(
            child: PageView(
              children: <Widget>[
                Scaffold(body: Text("1")),
                Scaffold(body: Text("2")),
                Scaffold(body: Text("3")),
                Scaffold(body: Text("4")),
                Scaffold(body: Text("5")),
              ],
            ),
          );
        },
      ),
    );
  }
}
