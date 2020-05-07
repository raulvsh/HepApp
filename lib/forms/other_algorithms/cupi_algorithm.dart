/*
import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

import 'cupi_data.dart';

class CupiAlgorithm {
  final CupiData cupiData;

  CupiAlgorithm(this.cupiData);

  final units = Units();

  String obtenerResultado() {
    final prefs = UserSettings();
    final units = Units();

    int ptsBilirubin, ptsAlbumin, ptsAscites, ptsTumourExtent;

    if (!prefs.getInternationalUnits()) convertToIU();
    //showObjectOkudaData();

    ptsBilirubin = _getBilirubinPoints();
    ptsAlbumin = _getAlbuminPoints();
    ptsAscites = _getAscitesPoints();
    ptsTumourExtent = _getTumourExtentPoints();

    showObjectOkudaData();
    showPts(ptsBilirubin, ptsAlbumin, ptsAscites, ptsTumourExtent);

    int resultado = ptsBilirubin + ptsAlbumin + ptsAscites + ptsTumourExtent;

    if (resultado == 0) {
      return 'I ($resultado)';
    } else if (resultado == 1 || resultado == 2) {
      return 'II ($resultado)';
    } else {
      return 'III ($resultado)';
    }

    //return 'prueba';
  }

  int _getBilirubinPoints() {
    if (cupiData.bilirubin < 51) {
      return 0;
    } else {
      return 1;
    }
  }

  int _getAlbuminPoints() {
    if (cupiData.albumin < 30) {
      return 1;
    } else {
      return 0;
    }
  }

  int _getAscitesPoints() {
    if (cupiData.ascites == 'controlled' ||
        cupiData.ascites == 'refractory') {
      return 1;
    } else {
      return 0;
    }
  }

  int _getTumourExtentPoints() {
    if (cupiData.tumourExtent == '<=50%') {
      return 0;
    } else {
      return 1;
    }
  }

  void convertToIU() {
    cupiData.bilirubin = units.getIUBilirrubin(cupiData.bilirubin);
    cupiData.albumin = units.getIUAlbumin(cupiData.albumin);
  }

  void showPts(ptsBilirubin, ptsAlbumin, ptsAscites, ptsTumourExtent) {
    print("\n\n**********PUNTOS\nPuntos bilirrubina: $ptsBilirubin");
    print("Puntos albúmina: $ptsAlbumin");
    print("Puntos ascitis: $ptsAscites");
    print("Puntos extension: $ptsTumourExtent");
  }

  void showObjectOkudaData() {
    print("\n\n*****************OBJETO OkudaDATA: "
        "\nbilirrubina : ${cupiData.bilirubin}" +
        "\nalbumina : ${cupiData.albumin}" +
        "\nascites : ${cupiData.ascites}" +
        "\n extension: ${cupiData.tumourExtent}" +
        "\nresultado : ${cupiData.result}" +
        "\n**************");
  }
}
*/
