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

    var ptsBilirubin;
    var ptsINR;
    var ptsAlbumin;
    var ptsEncephalopaty;
    var ptsAscites;

    if (!prefs.getInternationalUnits()) convertToIU();
    showObjectCPSData();

    if (cpsData.bilirubin <= 34) {
      ptsBilirubin = 1;
    } else if (cpsData.bilirubin <= 50) {
      ptsBilirubin = 2;
    } else {
      ptsBilirubin = 3;
    }

    if (cpsData.inr <= 1.7) {
      ptsINR = 1;
    } else if (cpsData.inr <= 2.2) {
      ptsINR = 2;
    } else {
      ptsINR = 3;
    }

    if (cpsData.albumin <= 28) {
      ptsAlbumin = 3;
    } else if (cpsData.albumin <= 35) {
      ptsAlbumin = 2;
    } else {
      ptsAlbumin = 1;
    }

    if (cpsData.encephalopaty == 'grade_3_4') {
      ptsEncephalopaty = 3;
    } else if (cpsData.encephalopaty == 'grade_1_2') {
      ptsEncephalopaty = 2;
    } else
      ptsEncephalopaty = 1;

    /*if (cpsData.encephalopaty == 'none_fem') {
      ptsEncephalopaty = 1;
    } else if (cpsData.encephalopaty == 'grade_1_2') {
      ptsEncephalopaty = 2;
    } else if (cpsData.encephalopaty == 'grade_3_4') {
      ptsEncephalopaty = 3;
    }*/
    if (cpsData.ascites == 'refractory') {
      ptsAscites = 3;
    } else if (cpsData.ascites == 'controlled') {
      ptsAscites = 2;
    } else
      ptsAscites = 1;

    /* if (cpsData.ascites == 'none_fem') {
      ptsAscites = 1;
    } else if (cpsData.ascites == 'controlled') {
      ptsAscites = 2;
    } else if (cpsData.ascites == 'refractory') {
      ptsAscites = 3;
    }*/

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
