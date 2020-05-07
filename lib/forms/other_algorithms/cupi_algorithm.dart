import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

import 'cupi_data.dart';

class CupiAlgorithm {
  final CupiData cupiData;

  CupiAlgorithm(this.cupiData);

  final units = Units();

  String obtenerResultado() {
    final prefs = UserSettings();

    int ptsTnm, ptsAscites, ptsAfp, ptsBilirubin, ptsAlp, ptsEcog;

    if (!prefs.getInternationalUnits()) convertToIU();
    //showObjectOkudaData();
    ptsTnm = _getTnmPoints();
    ptsAscites = _getAscitesPoints();
    ptsAfp = _getAfpPoints();
    ptsBilirubin = _getBilirubinPoints();
    ptsAlp = _getAlpPoints();
    ptsEcog = _getEcogPoints();


    int result = ptsTnm + ptsAscites + ptsAfp + ptsBilirubin + ptsAlp + ptsEcog;
    showPts(result);

    return result.toString();
  }

  void convertToIU() {
    cupiData.bilirubin = units.getIUBilirrubin(cupiData.bilirubin);
  }

  int _getTnmPoints() {
    if (cupiData.tnm == 'I' || cupiData.tnm == 'II') {
      return -3;
    } else if (cupiData.tnm == 'IIIA' || cupiData.tnm == 'IIIB') {
      return -1;
    } else {
      return 0;
    }

  }

  int _getAscitesPoints() =>
      cupiData.ascites == 'controlled' || cupiData.ascites == 'refractory'
          ? 3
          : 0;

  /*if (cupiData.ascites == 'controlled' || cupiData.ascites == 'refractory') {
      return 3;
    } else {
      return 0;
    }
  }*/

  int _getAfpPoints() => cupiData.afp >= 500 ? 2 : 0;

  int _getBilirubinPoints() {
    if (cupiData.bilirubin <= 34) {
      return 0;
    } else if (cupiData.bilirubin <= 51) {
      return 3;
    } else {
      return 4;
    }
  }

  int _getAlpPoints() => cupiData.alp >= 200 ? 3 : 0;

  int _getEcogPoints() => cupiData.ecog == '0' ? -4 : 0;

  void showPts(resultado) {
    print("\n\n**********PUNTOS CUPI");
    print("\nPuntos tnm: ${cupiData.tnm} ${_getTnmPoints()}");
    print("Puntos ascitis: ${cupiData.ascites} ${_getAscitesPoints()}");
    print("Puntos afp: ${cupiData.afp} ${_getAfpPoints()}");
    print("Puntos bilirrubina: ${cupiData.bilirubin} ${_getBilirubinPoints()}");
    print("Puntos alp: ${cupiData.alp} ${_getAlpPoints()}");
    print("Puntos ecog: ${cupiData.ecog} ${_getEcogPoints()}");
    print("Resultado: $resultado");
  }
}
