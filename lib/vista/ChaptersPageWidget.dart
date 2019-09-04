import 'package:flutter/material.dart';

class ChaptersPage extends StatefulWidget {
  @override
  _ChaptersPageState createState() => _ChaptersPageState();
}

class _ChaptersPageState extends State<ChaptersPage> {
  var _currencies = ['Rupees', 'Dollars', 'Pounds', 'Others'];
  var _currentItemSelected = '';
  String nameCity = "";

  @override
  void initState() {
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      drawer: _openDrawer(),
      appBar: _buildChaptersAppBar(),
      body: _buildChaptersBody(),
    );
  }

  _openDrawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text('raulvsh@gmail.com'),
            accountName: Text('Raúl Velasco'),
          ),
        ],
      ),
    );
  }

  _buildChaptersAppBar() {
    return AppBar(
      automaticallyImplyLeading: true,
      /* leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _openDrawer();
            //Navigator.pushNamed(context, '/');
          },
        ),*/
      title: Container(
        child: Row(
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(2),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'images/arrowthickleft.png',
                    width: 25,
                    height: 25,
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              onPressed: () => Navigator.pushNamed(context, '/'),
            ),
            IconButton(
              icon: Image.asset(
                'images/homeicon.png',
                width: 25,
                height: 25,
              ),
              onPressed: () => Navigator.pushNamed(context, '/'),
            ),
            Text(
              "Chapters",
            ),
          ],
        ),
      ),
    );
  }

  _buildChaptersBody() {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              "Chapters, prueba desplegable",
              style: TextStyle(
                fontSize: 20,
                backgroundColor: Color.fromARGB(255, 93, 188, 210),
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: DropdownButton<String>(
              items: _currencies.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String newValueSelected) {
                // Your code to execute, when a menu item is selected from drop down
                _onDropDownItemSelected(newValueSelected);
              },
              value: _currentItemSelected,
            ),
          ),
        ],
      ),
    );
  }


  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}
