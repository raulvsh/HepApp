import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final String url = 'assets/pdfs/about_hepapp.pdf';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        'information',
      ),
      body: Center(
        child: Text('hola'),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
/*
ANTERIOR VERSION EN LA QUE FUNCIONABA EL PDF
class _InformationPageState extends State<InformationPage> {
  PDFDocument document;
  final String url = 'assets/pdfs/about_hepapp.pdf';

  @override
  void initState() {
    _loadPDFfromAsset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        'information',
      ),
      body: Center(
        child: PDFViewer(
          document: document,
          showPicker: false,
          showIndicator: true,
          showNavigation: true,
        ),
      ),
    );
  }

  Future _loadPDFfromAsset() async {
    document = await PDFDocument.fromAsset(url);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }
}
*/
