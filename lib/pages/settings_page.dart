import 'package:flutter/material.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;

  //String _nombre = 'Pedro';

  TextEditingController _textController;
  TextEditingController _textController2;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    prefs.ultimaPagina = '/settings';
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;

    _textController = new TextEditingController(text: prefs.nombreUsuario);
    _textController2 = TextEditingController(text: prefs.bilirubin.toString());
  }

  _setSelectedRadio(int valor) {
    prefs.genero = valor;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text('Settings',
                  style:
                      TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: Text('Color secundario'),
              onChanged: (value) {
                setState(() {
                  _colorSecundario = value;
                  prefs.colorSecundario = value;
                });
              },
            ),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
                value: 2,
                title: Text('Femenino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona usando el teléfono',
                ),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              ),
            ), Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController2,
                decoration: InputDecoration(
                  labelText: 'bilirubin',
                  helperText: 'Nombre de la persona usando el teléfono',
                ),
                onChanged: (value) {
                  prefs.bilirubin = double.parse(value);
                },
              ),
            )
          ],
        ));
  }
}
