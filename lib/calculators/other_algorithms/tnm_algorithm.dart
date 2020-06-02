import 'package:hepapp/data/units.dart';

import 'tnm_data.dart';

final bool debug = false;

class TnmAlgorithm {
  final TnmData tnmData;

  TnmAlgorithm(this.tnmData);

  final units = Units();

  String obtenerResultado() {
    if (debug) showPts();

    int tN = int.parse(tnmData.tumourNumber);
    bool pvi = tnmData.pvi == 'yes' ? true : false;
    bool nodes = tnmData.nodes == 'yes' ? true : false;
    bool metastasis = tnmData.metastasis == 'yes' ? true : false;

    bool firstConditionII = tN == 1 && pvi;
    bool secondConditionII = tN > 1 && !pvi && upTo6Of5();

    if (tN == 1 && !pvi && !nodes && !metastasis) {
      return 'I';
    } else if ((firstConditionII || secondConditionII) &&
        !nodes &&
        !metastasis) {
      return 'II';
    } else if (tN > 1 && !pvi && !nodes && !metastasis) {
      return 'III A';
    } else if (tN >= 1 && pvi && !nodes && !metastasis) {
      return 'III B';
    } else if (tN >= 1 && nodes && !metastasis) {
      return 'IV A';
    } else {
      return 'IV B';
    }
  }

  void showPts() {
    print("\n\n*** Objeto tnmData: ");
    print("\nNúmero de tumores : ${tnmData.tumourNumber}");
    print("\nPvi : ${tnmData.pvi}");
    print("\nNodos : ${tnmData.nodes}");
    print("\nMetástasis: ${tnmData.metastasis}");
  }

  bool upTo6Of5() {
    int tN = int.parse(tnmData.tumourNumber);
    print(tnmData.tumourSize.toString());
    for (int i = 0; i < tN; i++) {
      if (tnmData.tumourSize[i] >= 5) {
        return false;
      }
    }
    return true;
  }
}
