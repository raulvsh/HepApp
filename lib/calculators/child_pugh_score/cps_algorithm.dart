import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

import 'cps_data.dart';

class CpsAlgorithm {
  final units = Units();
  final CpsData cpsData;

  CpsAlgorithm(this.cpsData);

  String obtenerResultado() {
    final prefs = UserSettings();
    final debug = false;
    int ptsBilirubin, ptsINR, ptsAlbumin, ptsEncephalopaty, ptsAscites;

    if (!prefs.getInternationalUnits()) convertToIU();

    ptsBilirubin = _getBilirubinPoints();
    ptsINR = _getInrPoints();
    ptsAlbumin = _getAlbuminPoints();
    ptsEncephalopaty = _getEncephalopatyPoints();
    ptsAscites = _getAscitesPoints();

    if (debug) showCpsPoints();

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

  void showCpsPoints() {
    print("\n\n**********PUNTOS CPS\nPuntos bilirrubina: ${cpsData
        .bilirubin}  ${_getBilirubinPoints()}");
    print("Puntos inr: ${cpsData.inr}  ${_getInrPoints()}");
    print("Puntos albúmina: ${cpsData.albumin}  ${_getAlbuminPoints()}");
    print("Puntos encefalopatía: ${cpsData
        .encephalopaty}  ${_getEncephalopatyPoints()}");
    print("Puntos ascitis: ${cpsData.ascites}  ${_getAscitesPoints()}");
  }
}
