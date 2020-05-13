import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

import 'okuda_data.dart';

class OkudaAlgorithm {
  final OkudaData okudaData;

  OkudaAlgorithm(this.okudaData);

  final units = Units();

  String obtenerResultado() {
    final prefs = UserSettings();
    int ptsBilirubin, ptsAlbumin, ptsAscites, ptsTumourExtent;

    if (!prefs.getInternationalUnits()) convertToIU();
    //showObjectOkudaData();

    ptsBilirubin = _getBilirubinPoints();
    ptsAlbumin = _getAlbuminPoints();
    ptsAscites = _getAscitesPoints();
    ptsTumourExtent = _getTumourExtentPoints();

    // showObjectOkudaData();

    int resultado = ptsBilirubin + ptsAlbumin + ptsAscites + ptsTumourExtent;
    showPts(resultado);

    if (resultado == 0) {
      return 'I ($resultado)';
    } else if (resultado == 1 || resultado == 2) {
      return 'II ($resultado)';
    } else {
      return 'III ($resultado)';
    }
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

  void showPts(int resultado) {
    print("\n\n**********PUNTOS OKUDA\nPuntos bilirrubina: ${okudaData
        .bilirubin}  ${_getBilirubinPoints()}");
    print("Puntos albúmina: ${okudaData.albumin}  ${_getAlbuminPoints()}");
    print("Puntos ascitis: ${okudaData.ascites}  ${_getAscitesPoints()}");
    print("Puntos extension: ${okudaData
        .tumourExtent}  ${_getTumourExtentPoints()}");
    print("Resultado: $resultado");
  }


}
