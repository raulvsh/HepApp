import 'package:hepapp/data/units.dart';

import 'bclc_data.dart';

class BclcAlgorithm {
  final BclcData bclcData;

  BclcAlgorithm(this.bclcData);

  final units = Units();
  final debug = false;
  String obtenerResultado() {
    //final prefs = UserSettings();
    //final units = Units();

    if (debug) showPts();
    int tN = int.parse(bclcData.tumourNumber);
    bool pvi = bclcData.pvi == 'yes' ? true : false;
    bool nodes = bclcData.nodes == 'yes' ? true : false;
    bool metastasis = bclcData.metastasis == 'yes' ? true : false;

    var firstConditionEarly = tN == 1 && bclcData.tumourSize[0] > 2;
    var secondConditionEarly = upTo3Of3() && tN <= 3;
    var cpsAOrB = bclcData.cps[0] == 'A' || bclcData.cps[0] == 'B';
    var ecog1Or2 = bclcData.ecog == '1' || bclcData.ecog == '2';

    if (tN == 1 &&
        bclcData.tumourSize[0] <= 2.0 &&
        bclcData.cps[0] == 'A' &&
        bclcData.ecog == '0'
    ) {
      return 'very_early_0';
    } else if ((firstConditionEarly || secondConditionEarly) &&
        cpsAOrB &&
        bclcData.ecog == '0') {
      return 'early_a';
    } else if ((tN > 3 && !upTo3Of3()) && cpsAOrB && bclcData.ecog == '0') {
      return 'intermediate_b';
    } else if (tN >= 1 && (pvi || nodes || metastasis) && ecog1Or2 && cpsAOrB) {
      return 'advanced_c';
    } else {
      return 'end_stage_d';
    }
  }

  void showPts() {
    print("\n\n**********PUNTOS BCLC\n");
    print("Campo numero de tumores: ${bclcData.tumourNumber}");
    print("Campo tamaño de tumores: ${bclcData.tumourSize.toString()}");
    print("Campo pvi: ${bclcData.pvi}");
    print("Campo nodos: ${bclcData.nodes}");
    print("Campo metastasis: ${bclcData.metastasis}");
    print("Campo ecog: ${bclcData.ecog}");
    print("Campo cps: ${bclcData.cps[0]}");
  }

  bool upTo3Of3() {
    int tN = int.parse(bclcData.tumourNumber);
    if (tN > 3) return false;
    print("tumour number " + bclcData.tumourNumber);
    print(bclcData.tumourSize.toString());
    for (int i = 0; i < tN; i++) {
      if (bclcData.tumourSize[i] > 3) {
        print("tamaño tumor $i " + bclcData.tumourSize[i].toString());
        return false;
      }
      print("tamaño permitido tumor $i " + bclcData.tumourSize[i].toString());
    }
    return true;
  }
}
