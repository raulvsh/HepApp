import 'package:hepapp/data/units.dart';

import 'alberta_data.dart';

class AlbertaAlgorithm {
  final units = Units();
  final AlbertaData albertaData;

  AlbertaAlgorithm(this.albertaData);

  List<bool> coloredFields = [];

  initList() {
    for (int i = 0; i <= 46; i++) {
      coloredFields.add(false);
    }
  }

  obtenerRecorrido() {
    initList();
    //print("cps "  + albertaData.cps);
    //if (albertaData.cps[0] == 'A') coloredFields[10] = true;

    if (albertaData.results['bclc'] == 'end_stage_d') {
      coloredFields[5] = true;

      coloredFields[40] = true;
      coloredFields[46] = true;
    }

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
}
