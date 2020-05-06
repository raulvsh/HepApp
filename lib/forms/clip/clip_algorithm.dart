import 'package:hepapp/data/units.dart';

import 'clip_data.dart';

class ClipAlgorithm {
  final ClipData clipData;

  ClipAlgorithm(this.clipData);

  final units = Units();

  String obtenerResultado() {
    showObjectCLipData();
    int ptsTumourNumber, ptsCps, ptsPvt, ptsAfp;

    ptsTumourNumber = _buildTumourPoints();
    ptsCps = _buildCpsPoints();
    ptsPvt = _buildPvtPoints();
    ptsAfp = _buildAfpPoints();

    showpts(ptsTumourNumber, ptsCps, ptsPvt, ptsAfp);
    int result = ptsTumourNumber + ptsCps + ptsPvt + ptsAfp;
    return result.toString();
  }

  int _buildTumourPoints() {
    double tumourNumber = double.parse(clipData.tumourNumber);
    /*if(tumourNumber >1 && clipData.tumourExtent == '>50%'){
      return 2;
    } else if (tumourNumber > 1 && clipData.tumourExtent == '<=50%') {
      return 1;
    } else {
      return 0;
    }*/

    if (tumourNumber == 0 ||
        (tumourNumber == 1 && clipData.tumourExtent == '<=50%')) {
      return 0;
    } else if (tumourNumber > 1 && clipData.tumourExtent == '<=50%') {
      return 1;
    } else {
      return 2;
    }
  }

  int _buildCpsPoints() {
    if (clipData.cps == 'A') {
      return 0;
    } else if (clipData.cps == 'B') {
      return 1;
    } else {
      return 2;
    }
  }

  int _buildPvtPoints() {
    if (clipData.pvt == 'no') {
      return 0;
    } else {
      return 1;
    }
  }

  int _buildAfpPoints() {
    if (clipData.afp <= 400) {
      return 0;
    } else {
      return 1;
    }
  }


  void showpts(ptsNumberTumours, ptsCPS, ptsPVT, ptsAFP) {
    print("\n\n**********PUNTOS\nPuntos numero: $ptsNumberTumours");
    print("Puntos cps: $ptsCPS");
    print("Puntos pvt: $ptsPVT");
    print("Puntos afp: $ptsAFP");
  }

  void showObjectCLipData() {
    print("\n\n*****************OBJETO clipDATA: "
        "\afp : ${clipData.afp}" +
        "\ncps : ${clipData.cps}" +
        "\ntumour number : ${clipData.tumourNumber}" +
        "\ntumourextent: ${clipData.tumourExtent}" +
        "\npvt: ${clipData.pvt}" +
        "\nresultado : ${clipData.result}" +
        "\n**************");
  }
}
