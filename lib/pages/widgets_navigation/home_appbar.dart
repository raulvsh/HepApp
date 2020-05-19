import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  HomeAppBar(this.context);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var aux = AppLocalizations.of(context);
    return AppBar(
      automaticallyImplyLeading: false, //Elimina el botón back
      title: Container(
        height: 30,
        child: Center(
          child: Text(
            aux.tr('app_title'), //title,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Container(
          height: 70.0,
          child: Stack(
            children: <Widget>[
              Image.asset(
                'assets/images/header4.png',
                height: 70,
                width: width,
                fit: BoxFit.fill,
              ),
              Center(
                child: Container(
                  child: Image.asset(
                    'assets/images/hepapplogo.png',
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
