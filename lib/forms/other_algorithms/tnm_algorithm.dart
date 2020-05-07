import 'package:hepapp/data/units.dart';

import 'tnm_data.dart';

class TnmAlgorithm {
  final TnmData tnmData;

  TnmAlgorithm(this.tnmData);

  final units = Units();

  String obtenerResultado() {
    showPts();

    int tN = int.parse(tnmData.tumourNumber);
    bool pvi = tnmData.pvi == 'yes' ? true : false;
    bool nodes = tnmData.nodes == 'yes' ? true : false;
    bool metastasis = tnmData.metastasis == 'yes' ? true : false;

    bool firstConditionII = tN == 1 && pvi;
    bool secondConditionII = tN > 1 && !pvi && upTo6of5();

    if (tN == 1 && !pvi && !nodes && !metastasis) {
      return 'I';
    } else
    //if ((((tN == 1 && pvi) || (tN > 1 && !pvi && upTo6of5())) && !nodes &&
    //  !metastasis)) {
    if ((firstConditionII || secondConditionII) && !nodes && !metastasis) {
      return 'II';
    } else if (tN > 1 && !pvi && !nodes && !metastasis) {
      return 'IIIA';
    } else if (tN >= 1 && pvi && !nodes && !metastasis) {
      return 'IIIB';
    } else if (tN >= 1 && nodes && !metastasis) {
      return 'IVA';
    } else {
      return 'IVB';
    }
  }

  void showPts() {
    print("\n\n*****************OBJETO TnmData: "
            "\nnumero de tumores : ${tnmData.tumourNumber}" +
        "\n pvi : ${tnmData.pvi}" +
        "\n nodos : ${tnmData.nodes}" +
        "\n metastasis: ${tnmData.metastasis}" +
        "\n**************");
  }

  bool upTo6of5() {
    int tN = int.parse(tnmData.tumourNumber);

    for (int i = 0; i < tN; i++) {
      if (tnmData.tumourSize[i] >= 5) {
        print("tamaño tumor $i " + tnmData.tumourSize[i].toString());
        return false;
      }
    }
    return true;
  }
}
