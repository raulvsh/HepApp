import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final String title;

  CustomAppBar(this.context, this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0.0,
      //centerTitle: false,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => Navigator.pushNamed(context, '/'),
      ),
      title: Container(
        //margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        padding: EdgeInsets.all(0),
        width: double.infinity,
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'images/arrowthickleft.png',
                          width: 22,
                          height: 22,
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
                    onTap: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: Image.asset(
                      'images/homeicon.png',
                      width: 22,
                      height: 22,
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  //color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CustomButton extends StatelessWidget {
  final BuildContext context;
  final List<String> type;

  CustomButton(this.context, this.type);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(1.5),

      child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Image.asset(
                'images/${type[1]}',
              ),
              Align(
                alignment: Alignment(0, 0.7),
                child: Text(
                  type[0],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 93, 188, 210),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          onTap: () => Navigator.pushNamed(context, type[2]),
        ),

    );
  }
}

