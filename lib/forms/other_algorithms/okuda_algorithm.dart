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
    if (okudaData.bilirubin < 51) {
      return 0;
    } else {
      return 1;
    }
  }

  int _getAlbuminPoints() {
    if (okudaData.albumin < 30) {
      return 1;
    } else {
      return 0;
    }
  }

  int _getAscitesPoints() {
    if (okudaData.ascites == 'controlled' ||
        okudaData.ascites == 'refractory') {
      return 1;
    } else {
      return 0;
    }
  }

  int _getTumourExtentPoints() {
    if (okudaData.tumourExtent == '<=50%') {
      return 0;
    } else {
      return 1;
    }
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
