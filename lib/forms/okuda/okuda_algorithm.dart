import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

import 'okuda_data.dart';

class OkudaAlgorithm {
  final OkudaData okudaData;

  OkudaAlgorithm(this.okudaData);

  final units = Units();

  String obtenerResultado() {
    final prefs = UserSettings();
    final units = Units();

    var ptsBilirubin;
    var ptsAlbumin;
    var ptsAscites;
    var ptsTumourExtent;


    if (!prefs.getInternationalUnits()) convertToIU();
    //showObjectOkudaData();

    if (okudaData.bilirubin < 51) {
      ptsBilirubin = 0;
    } else {
      ptsBilirubin = 1;
    }

    if (okudaData.albumin < 30) {
      ptsAlbumin = 1;
    } else {
      ptsAlbumin = 0;
    }


    if (okudaData.ascites == 'controlled' ||
        okudaData.ascites == 'refractory') {
      ptsAscites = 1;
    } else {
      ptsAscites = 0;
    }

    /* if (okudaData.ascites == 'none_fem') {
      ptsAscites = 0;
    } else if (okudaData.ascites == 'controlled') {
      ptsAscites = 1;
    } else if (okudaData.ascites == 'refractory') {
      ptsAscites = 1;
    }*/

    if (okudaData.tumourExtent == '<=50%') {
      ptsTumourExtent = 0;
    } else {
      ptsTumourExtent = 1;
    }

    //showPts(
    //   ptsBilirubin, ptsAlbumin, ptsAscites, ptsTumourExtent);

    int resultado =
        ptsBilirubin + ptsAlbumin + ptsAscites + ptsTumourExtent;

    if (resultado == 0) {
      return 'I ($resultado)';
    } else if (resultado == 1 || resultado == 2) {
      return 'II ($resultado)';
    } else {
      return 'III ($resultado)';
    }


    //return 'prueba';
  }

  void convertToIU() {
    okudaData.bilirubin = units.getIUBilirrubin(okudaData.bilirubin);
    okudaData.albumin = units.getIUAlbumin(okudaData.albumin);

  }

  void showPts(ptsBilirubin, ptsAlbumin, ptsAscites, ptsTumourExtent) {
    print("\n\n**********PUNTOS\nPuntos bilirrubina: $ptsBilirubin");
    print("Puntos albúmina: $ptsAlbumin");
    print("Puntos ascitis: $ptsAscites");
    print("Puntos extension: $ptsTumourExtent");

  }

  void showObjectOkudaData() {
    print("\n\n*****************OBJETO OkudaDATA: "
        "\nbilirrubina : ${okudaData.bilirubin}" +
        "\nalbumina : ${okudaData.albumin}" +
        "\nascites : ${okudaData.ascites}" +
        "\n extension: ${okudaData.tumourExtent}" +
        "\nresultado : ${okudaData.result}" +
        "\n**************");
  }
}
