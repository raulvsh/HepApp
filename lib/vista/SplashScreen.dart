//
//import 'dart:async';
//import 'package:splashscreen/splashscreen.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
//import 'HomePage.dart';
//
//class SplashScreen extends StatefulWidget {
//  @override
//  _SplashScreenState createState() => _SplashScreenState();
//}
//
//class _SplashScreenState extends State<SplashScreen> {
//  @override
//  void initState() {
//    super.initState();
//    Timer(
//        Duration(seconds: 2),
//        () => Navigator.of(context).pushReplacement(
//            MaterialPageRoute(builder: (BuildContext context) => HomePage())));
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Image.asset(
//              'images/hepapplogo.png',
//              width: 120,
//              height: 120,
//            ),
//            SizedBox(height: 20,),
//            Text(
//              'HepApp',
//              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
//*/
