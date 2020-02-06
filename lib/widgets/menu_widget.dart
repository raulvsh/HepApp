import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          /*UserAccountsDrawerHeader(
            accountEmail: Text('raulvsh@gmail.com'),
            accountName: Text('Raúl Velasco'),
          ),*/
          DrawerHeader(
            child: Container(
              /*height: double.infinity,
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Text(
                    'HepAPP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ),*/

            ), //color: Colors.red,),
            decoration: BoxDecoration(
              image: DecorationImage(

                image: AssetImage(
                    'assets/images/hepapplogo.png'),
                fit: BoxFit.scaleDown,


              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue),
            title: Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          ListTile(
            leading: Icon(Icons.party_mode, color: Colors.blue),
            title: Text('Party Mode'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue),
            title: Text('People'),
            onTap: () {},
          ),
          ListTile(
              leading: Icon(Icons.settings, color: Colors.blue),
              title: Text('Settings'),
              onTap: () {
                //Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/settings');
              }),
        ],
      ),
    );
  }
}
