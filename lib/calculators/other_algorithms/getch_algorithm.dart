import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

import 'getch_data.dart';

final bool debug = false;

class GetchAlgorithm {
  final GetchData getchData;

  GetchAlgorithm(this.getchData);

  final units = Units();

  String obtenerResultado() {
    final prefs = UserSettings();

    int ptsEcog, ptsBilirubin, ptsAlp, ptsAfp, ptsPvt;

    if (!prefs.getInternationalUnits()) convertToIU();

    ptsEcog = _getEcogPoints();
    ptsBilirubin = _getBilirubinPoints();
    ptsAlp = _getAlpPoints();
    ptsAfp = _getAfpPoints();
    ptsPvt = _getPvtPoints();

    int resultado = ptsEcog + ptsBilirubin + ptsAlp + ptsAfp + ptsPvt;
    if (debug) showPts(resultado);

    if (resultado == 0) {
      return 'A ($resultado)';
    } else if (resultado >= 1 && resultado <= 5) {
      return 'B ($resultado)';
    } else {
      return 'C ($resultado)';
    }
  }

  void convertToIU() {
    getchData.bilirubin = units.getIUBilirrubin(getchData.bilirubin);
  }

  int _getEcogPoints() =>
      getchData.ecog == '0' || getchData.ecog == '1' ? 0 : 3;

  int _getBilirubinPoints() => getchData.bilirubin < 50 ? 0 : 3;

  int _getAlpPoints() =>
      getchData.alp < ((2 * getchData.alp) / (getchData.alpUpperLimit)) ? 0 : 2;

  int _getAfpPoints() => getchData.afp < 35 ? 0 : 2;

  int _getPvtPoints() => getchData.pvt == 'no' ? 0 : 2;

  void showPts(int resultado) {
    print("\n\n*** Puntos GETCH***");
    print("Puntos ecog: ${getchData.ecog} ${_getEcogPoints()}");
    print("Puntos bili: ${getchData.bilirubin}  ${_getBilirubinPoints()}");
    print(
        "Puntos alp: ${getchData.alp}  ${getchData.alpUpperLimit}  ${_getAlpPoints()}");
    print("Puntos afp: ${getchData.afp}");
    print("Puntos pvt: ${getchData.pvt}");
    print("Resultado: $resultado");
  }
}
