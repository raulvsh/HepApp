import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/widgets/CalcBottomBar.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class AllCalcPage extends StatefulWidget {
  @override
  _AllCalcPageState createState() => _AllCalcPageState();
}

class _AllCalcPageState extends State<AllCalcPage> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        context, 'all_calc_diagnostic',
        selScreenshot: true, selFullSettings: true,),
      drawer: MenuWidget(),

      body: new Center(
        child: new Text("Some text"),
      ),
      bottomSheet: CalcBottomBar("reseteo"),

    );
  }
}
