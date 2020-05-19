import 'dart:math';

import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

import 'alberta_data.dart';

class AlbertaAlgorithm {
  final units = Units();
  final prefs = UserSettings();
  List<String> treatments = ['', ''];
  List<bool> coloredFields = [];

  initList() {
    for (int i = 0; i <= 46; i++) {
      coloredFields.add(false);
    }
  }

  obtenerRecorrido(AlbertaData data) {
    initList();
    var portalHT = data.portalHypertension;
    var platelets = double.parse(data.platelets);
    var ltCandidate = calculateLtCandidate(data);
    //No se ha seleccionado la hipertensión portal, la calculamos con los datos que tenemos
    if (portalHT == '-') {
      portalHT = calculatePortalHypertension(data, platelets);
    }
    var bilirubin = prefs.getInternationalUnits()
        ? data.bilirubin
        : units.getIUBilirrubin(data.bilirubin);
    bool highBilirubin = bilirubin > 17.104;
    bool portalHtOrHighBilirubin = portalHT == 'yes' || highBilirubin;
    bool cpsB89C =
        data.cps == 'B (8)' || data.cps == 'B (9)' || data.cps[0] == 'C';
    bool cpsAB7 = data.cps[0] == 'A' || data.cps == 'B (7)';
    bool ecog01 = data.ecog == '0' || data.ecog == '1';
    bool ecog2;
    data.ecog != '-' ? ecog2 = int.parse(data.ecog) >= 2 : ecog2 = false;

    printAlbertaObject(data);

    if (data.bclc == 'very_early_0' &&
        data.cps[0] == 'A' &&
        !portalHtOrHighBilirubin) {
      markColored([1, 6, 10, 17, 24, 33, 41, 43]);
      treatments[0] = 'resection';
    } else if (data.bclc == 'very_early_0' &&
        data.cps[0] == 'A' &&
        portalHtOrHighBilirubin &&
        !ltCandidate) {
      markColored([1, 6, 10, 17, 25, 18, 26, 34, 41, 43]);
      treatments[0] = 'rfa';
    } else if (data.bclc == 'very_early_0' &&
        data.cps[0] == 'A' &&
        portalHtOrHighBilirubin &&
        ltCandidate) {
      markColored([1, 6, 10, 17, 25, 18, 27, 35, 41, 43]);
      treatments[0] = 'lt_long';
    } else if (data.bclc == 'early_a' &&
        data.cps[0] == 'A' &&
        !portalHtOrHighBilirubin) {
      markColored([2, 7, 10, 17, 24, 33, 41, 43]);
      treatments[0] = 'resection';
    } else if (data.bclc == 'early_a' &&
        data.cps[0] == 'A' &&
        portalHtOrHighBilirubin &&
        !ltCandidate) {
      markColored([2, 7, 10, 17, 25, 18, 26, 34, 41, 43]);
      treatments[0] = 'rfa';
    } else if (data.bclc == 'early_a' &&
        data.cps[0] == 'A' &&
        portalHtOrHighBilirubin &&
        ltCandidate) {
      markColored([2, 7, 10, 17, 25, 18, 27, 35, 41, 43]);
      treatments[0] = 'lt_long';
    } else if (data.bclc == 'early_a' && data.cps[0] == 'B' && !ltCandidate) {
      markColored([2, 7, 11, 18, 26, 34, 41, 43]);
      treatments[0] = 'rfa';
    } else if (data.bclc == 'early_a' && data.cps[0] == 'B' && ltCandidate) {
      markColored([2, 7, 11, 18, 27, 35, 41, 43]);
      treatments[0] = 'lt_long';
    } else if (data.bclc == 'early_a' && data.cps[0] == 'C' && ltCandidate) {
      markColored([2, 7, 12, 19, 27, 35, 41, 43]);
      treatments[0] = 'rfa';
    } else if (data.bclc == 'early_a' && data.cps[0] == 'C' && !ltCandidate) {
      markColored([2, 7, 12, 19, 28, 40, 46]);
      treatments[0] = 'best_supportive_care';
    } else if (data.bclc == 'intermediate_b' && cpsB89C && ltCandidate) {
      markColored([3, 8, 13, 19, 27, 35, 41, 43]);
      treatments[0] = 'lt_long';
    } else if (data.bclc == 'intermediate_b' && cpsB89C && !ltCandidate) {
      markColored([3, 8, 13, 19, 28, 40, 46]);
      treatments[0] = 'best_supportive_care';
    } else if (data.bclc == 'intermediate_b' &&
        cpsAB7 &&
        ecog01 &&
        data.pvt == 'no') {
      markColored([3, 8, 14, 20, 22, 29, 31, 37, 37, 42, 44]);
      treatments[0] = 'tare';
      treatments[1] = 'tace';
    } else if (data.bclc == 'intermediate_b' &&
        cpsAB7 &&
        ecog01 &&
        data.pvt == 'yes') {
      markColored([3, 8, 14, 20, 22, 29, 32, 38, 42, 44]);
      treatments[0] = 'tare';
    } else if (data.bclc == 'intermediate_b' && cpsAB7 && ecog2) {
      markColored([3, 8, 14, 20, 23, 40, 46]);
      treatments[0] = 'best_supportive_care';
    } else if (data.bclc == 'advanced_c' && data.cps[0] == 'A' && ecog2) {
      markColored([4, 9, 15, 21, 23, 40, 46]);
      treatments[0] = 'best_supportive_care';
    } else if (data.bclc == 'advanced_c' && data.cps[0] == 'A' && ecog01) {
      markColored([4, 9, 15, 21, 30, 39, 42, 45]);
      treatments[0] = 'sorafenib';
    } else if (data.bclc == 'advanced_c' &&
        (data.cps[0] == 'B' || data.cps[0] == 'C')) {
      markColored([4, 9, 16, 40, 46]);
      treatments[0] = 'best_supportive_care';
    } else if (data.bclc == 'end_stage_d') {
      markColored([5, 40, 46]);
      treatments[0] = 'best_supportive_care';
    }

    // print(coloredFields);

    return coloredFields;
  }

  void markColored(List<int> lista) {
    for (int i in lista) {
      coloredFields[i] = true;
    }
  }

  void printAlbertaObject(AlbertaData data) {
    print("\n\n*****************OBJETO albertaDATA: "
            "\nbclc : ${data.bclc}" +
        "\ncps : ${data.cps}" +
        "\nportal ht : ${data.portalHypertension}" +
        "\npvt : ${data.pvt}" +
        "\nplatelets : ${data.platelets}" +
        "\nvarices: ${data.varices}" +
        "\nbilirrubina : ${data.bilirubin}");
    print("Encefalopatía: " + data.encephalopaty);
    print("Ascitis: " + data.ascites);
    print("Tamaño de tumor: " + data.tumourSize.toString());
    print("AFP: " + data.afp.toString());
    print("\nresultados : ${treatments}" + "\n**************");
  }

  String calculatePortalHypertension(
    AlbertaData data,
    double platelets,
  ) {
    if (data.pvt == 'yes' ||
        platelets < 100 ||
        ((data.encephalopaty == 'grade_1_2' ||
            data.encephalopaty == 'grade_3_4') ||
            (data.ascites == 'controlled' || data.ascites == 'refractory') ||
            data.varices == 'yes')) {
      return 'yes';
    } else {
      return 'no';
    }
  }

  calculateLtCandidate(AlbertaData data) {
    bool ltCandidate;
    switch (prefs.getLtCriteria()) {
      case 'milan_criteria':
        ltCandidate = criterioMilan(data);
        break;
      case 'ttv_afp':
        ltCandidate = criterioTtvAfp(data);
        break;
      case 'ucfs':
        ltCandidate = criterioUcfs(data);
        break;
      case 'up_to_seven':
        ltCandidate = criterioUpToSeven(data);
        break;
    }
    return ltCandidate;
  }

  bool criterioMilan(AlbertaData data) {
    bool upTo1Of5 = data.tumourNumber == '1' && data.tumourSize[0] <= 5;
    bool criterioMilan;
    if (upTo1Of5 || upTo3Of3(data)) {
      criterioMilan = true;
    } else
      criterioMilan = false;

    return criterioMilan;
  }

  bool upTo3Of3(AlbertaData data) {
    int tN = prefs.getTumourNumber(); //int.parse(data.tumourNumber);
    bool upTo3Of3 = true;
    if (tN > 3) upTo3Of3 = false;
    for (int i = 0; i < tN; i++) {
      if (data.tumourSize[i] > 3) {
        upTo3Of3 = false;
      }
    }
    return upTo3Of3;
  }

  bool criterioTtvAfp(AlbertaData data) {
    double ttv = calculateTTV(data);
    bool criterioTtvAfp;
    if (ttv < 115 && data.afp < 400 && prefs.getAgeCutoff() < 70) {
      criterioTtvAfp = true;
    } else
      criterioTtvAfp = false;
    return criterioTtvAfp;
  }

  bool criterioUcfs(AlbertaData data) {
    int tN = int.parse(data.tumourNumber);
    bool upTo1Of65 = data.tumourNumber == '1' && data.tumourSize[0] <= 6.5;
    bool ucfs;
    double totalDiameter = 0;
    for (int i = 0; i < tN; i++) {
      totalDiameter += data.tumourSize[i];
    }

    if ((upTo1Of65 || upTo3Of45(data)) && totalDiameter <= 8) {
      ucfs = true;
    } else
      ucfs = false;

    return ucfs;
  }

  bool upTo3Of45(AlbertaData data) {
    int tN = int.parse(data.tumourNumber);
    bool upTo3Of45 = true;
    if (tN > 3) upTo3Of45 = false;
    for (int i = 0; i < tN; i++) {
      if (data.tumourSize[i] > 4.5) {
        upTo3Of45 = false;
      }
    }
    return upTo3Of45;
  }

  bool criterioUpToSeven(AlbertaData data) {
    int tN = prefs.getTumourNumber(); //int.parse(data.tumourNumber);
    bool upToSeven = false;
    /*bool firstCondition = data.tumourSize[0] < 6;
    bool secondCondition = data.tumourSize[1]<5;
    bool thirdCondition = data.tumourSize[2]<4;
    bool fourthCondition = data.tumourSize[3]<3;
    bool fifthCondition = data.tumourSize[4]<2;
    bool sixthCondition = data.tumourSize[5]<1;*/

    print(data.tumourSize);
    for (int i = 1; i < tN; i++) {
      if (data.tumourSize[i - 1] > 6 - i) {
        upToSeven = false;
      } else
        upToSeven = true;
    }
    print("uptoseven $upToSeven");

    /*switch (tN) {
      case 0:
        upToSeven = true;
        break;
      case 1:
        if (data.tumourSize[0] < 6) upToSeven = true;
      case 2:*/
    return upToSeven;
    //}
  }

  calculateTTV(AlbertaData data) {
    double ttv = 0.0;
    for (int i = 0; i < data.tumourSize.length; i++) {
      ttv += 1 / 6 * pi * pow(data.tumourSize[i], 3);
    }
    return ttv;
  }
}
