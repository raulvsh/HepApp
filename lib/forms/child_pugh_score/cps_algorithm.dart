import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

import 'cps_data.dart';

class CpsAlgorithm {
  final CpsData cpsData;

  CpsAlgorithm(this.cpsData);

  final units = Units();

  String obtenerResultado(/*CpsData data*/ /*fieldBlocs*/) {
    final prefs = UserSettings();
    final units = Units();

    int ptsBilirubin, ptsINR, ptsAlbumin, ptsEncephalopaty, ptsAscites;

    if (!prefs.getInternationalUnits()) convertToIU();
    showObjectCPSData();

    ptsBilirubin = _getBilirubinPoints();
    ptsINR = _getInrPoints();
    ptsAlbumin = _getAlbuminPoints();
    ptsEncephalopaty = _getEncephalopatyPoints();
    ptsAscites = _getAscitesPoints();

    showPts(ptsBilirubin, ptsINR, ptsAlbumin, ptsEncephalopaty, ptsAscites);

    int resultado =
        ptsBilirubin + ptsINR + ptsAlbumin + ptsEncephalopaty + ptsAscites;
    if (resultado == 5 || resultado == 6) {
      return 'A ($resultado)';
    } else if (resultado >= 7 && resultado <= 9) {
      return 'B ($resultado)';
    } else {
      return 'C ($resultado)';
    }
  }

  int _getBilirubinPoints() {
    if (cpsData.bilirubin <= 34) {
      return 1;
    } else if (cpsData.bilirubin <= 50) {
      return 2;
    } else {
      return 3;
    }
  }

  int _getInrPoints() {
    if (cpsData.inr <= 1.7) {
      return 1;
    } else if (cpsData.inr <= 2.2) {
      return 2;
    } else {
      return 3;
    }
  }

  int _getAlbuminPoints() {
    if (cpsData.albumin <= 28) {
      return 3;
    } else if (cpsData.albumin <= 35) {
      return 2;
    } else {
      return 1;
    }
  }

  int _getEncephalopatyPoints() {
    if (cpsData.encephalopaty == 'grade_3_4') {
      return 3;
    } else if (cpsData.encephalopaty == 'grade_1_2') {
      return 2;
    } else {
      return 1;
    }
  }

  int _getAscitesPoints() {
    if (cpsData.ascites == 'refractory') {
      return 3;
    } else if (cpsData.ascites == 'controlled') {
      return 2;
    } else
      return 1;
  }

  void convertToIU() {
    cpsData.bilirubin = units.getIUBilirrubin(cpsData.bilirubin);
    cpsData.albumin = units.getIUAlbumin(cpsData.albumin);
  }

  void showPts(ptsBilirubin, ptsINR, ptsAlbumin, ptsEncephalopaty, ptsAscites) {
    print("\n\n**********PUNTOS\nPuntos bilirrubina: $ptsBilirubin");
    print("Puntos inr: $ptsINR");
    print("Puntos albúmina: $ptsAlbumin");
    print("Puntos encefalopatía: $ptsEncephalopaty");
    print("Puntos ascitis: $ptsAscites");
  }

  void showObjectCPSData() {
    print("\n\n*****************OBJETO CPSDATA: "
            "\nbilirrubina : ${cpsData.bilirubin}" +
        "\nalbumina : ${cpsData.inr}" +
        "\ninr : ${cpsData.albumin}" +
        "\nencefalopatia : ${cpsData.encephalopaty}" +
        "\nascitis : ${cpsData.ascites}" +
        "\nresultado: ${cpsData.result}" +
        "\n**************");
  }
}
