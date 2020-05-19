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
    }

    //markColored([1,3,5,7,11]);

    print(coloredFields);

    //print("cps "  + albertaData.cps);
    //if (albertaData.cps[0] == 'A') coloredFields[10] = true;

    //if (albertatreatments['bclc'] == 'end_stage_d') {
    //coloredFields[5] = true;
    //coloredFields[40] = true;
    //coloredFields[46] = true;
    //treatments = ['prueba', 'prueba2'];
    //}

    /* recorrido imagen Miriam

    coloredFields[6] = true;
    coloredFields[10] = true;
    coloredFields[17] = true;
    coloredFields[18] = true;
    coloredFields[25] = true;
    coloredFields[26] = true;
    coloredFields[34] = true;
    coloredFields[41] = true;
    coloredFields[43] = true;
*/
    /*coloredFields[0] = true;
    coloredFields[1] = true;
    coloredFields[2] = true;
    coloredFields[3] = true;
    coloredFields[4] = true;
    coloredFields[5] = false;
    coloredFields[6] = true;
    coloredFields[7] = true;
    coloredFields[8] = true;
    coloredFields[9] = true;
    coloredFields[10] = true;
    coloredFields[11] = true;
    coloredFields[12] = true;
    coloredFields[13] = true;
    coloredFields[14] = true;
    coloredFields[15] = true;
    coloredFields[16] = false;
    coloredFields[17] = true;
    coloredFields[18] = true;
    coloredFields[18] = true;
    coloredFields[19] = true;
    coloredFields[20] = true;
    coloredFields[21] = true;
    coloredFields[22] = true;
    coloredFields[23] = false;
    coloredFields[24] = true;
    coloredFields[25] = true;
    coloredFields[26] = true;
    coloredFields[27] = true;
    coloredFields[28] = true;
    coloredFields[28] = true;
    coloredFields[29] = true;
    coloredFields[30] = true;
    //coloredFields[31] = true;
    //coloredFields[32] = true;
    //coloredFields[33] = true;
    coloredFields[34] = true;
    coloredFields[35] = true;
    coloredFields[36] = true;
    coloredFields[37] = true;
    coloredFields[38] = true;
    coloredFields[38] = false;
    coloredFields[39] = true;
    coloredFields[40] = true;
    coloredFields[41] = false;
    coloredFields[42] = false;
    coloredFields[43] = true;
    coloredFields[44] = true;
    coloredFields[45] = true;
    coloredFields[46] = true;*/

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

  String calculatePortalHypertension(AlbertaData data,
      double platelets,) {
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
