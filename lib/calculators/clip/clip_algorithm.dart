import 'package:hepapp/data/units.dart';

import 'clip_data.dart';

final bool debug = false;

class ClipAlgorithm {
  final ClipData clipData;

  ClipAlgorithm(this.clipData);

  final units = Units();

  String obtenerResultado() {
    int ptsTumourNumber, ptsCps, ptsPvt, ptsAfp;

    ptsTumourNumber = _getTumourPoints();
    ptsCps = _getCpsPoints();
    ptsPvt = _getPvtPoints();
    ptsAfp = _getAfpPoints();

    int result = ptsTumourNumber + ptsCps + ptsPvt + ptsAfp;
    if (debug) showpts(result);

    return result.toString();
  }

  int _getTumourPoints() {
    double tumourNumber = double.parse(clipData.tumourNumber);

    if (tumourNumber == 0 ||
        (tumourNumber == 1 && clipData.tumourExtent == '<=50%')) {
      return 0;
    } else if (tumourNumber > 1 && clipData.tumourExtent == '<=50%') {
      return 1;
    } else {
      return 2;
    }
  }

  int _getCpsPoints() {
    if (clipData.cps == 'A') {
      return 0;
    } else if (clipData.cps == 'B') {
      return 1;
    } else {
      return 2;
    }
  }

  int _getPvtPoints() {
    if (clipData.pvt == 'no') {
      return 0;
    } else {
      return 1;
    }
  }

  int _getAfpPoints() {
    if (clipData.afp <= 400) {
      return 0;
    } else {
      return 1;
    }
  }

  void showpts(int result) {
    print("\n\n*** Puntos CLIP");
    print("Puntos numero: ${clipData.tumourNumber}  ${_getTumourPoints()}");
    print("Extension: ${clipData.tumourExtent}  ${_getTumourPoints()}");
    print("Puntos cps: ${clipData.cps}  ${_getCpsPoints()}");
    print("Puntos pvt: ${clipData.pvt}  ${_getPvtPoints()}");
    print("Puntos afp: ${clipData.afp}  ${_getAfpPoints()}");
    print("Resultado: $result");
  }
}
