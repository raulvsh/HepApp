import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';

import 'meld_data.dart';

class MeldAlgorithm {
  final MeldData meldData;

  MeldAlgorithm(this.meldData);

  final units = Units();

  List<String> obtenerResultado() {
    final prefs = PreferenciasUsuario();
    final units = Units();

    var ptsBilirubin;
    var ptsAlbumin;
    var ptsAscites;
    var ptsTumourExtent;
    print("iunits" + prefs.getInternationalUnits().toString());
    if (!prefs.getInternationalUnits()) convertToIU();
    showObjectMeldData();

    if (meldData.bilirubin < 51) {
      ptsBilirubin = 0;
    } else {
      ptsBilirubin = 1;
    }

    if (meldData.albumin < 30) {
      ptsAlbumin = 1;
    } else {
      ptsAlbumin = 0;
    }

    /*if (meldData.ascites == 'none_fem') {
      ptsAscites = 0;
    } else if (meldData.ascites == 'controlled') {
      ptsAscites = 1;
    } else if (meldData.ascites == 'refractory') {
      ptsAscites = 1;
    }

    if(meldData.tumourExtent == '<=50%'){
      ptsTumourExtent = 0;
    } else{
      ptsTumourExtent = 1;
    }*/

    showPts(ptsBilirubin, ptsAlbumin, ptsAscites, ptsTumourExtent);

    int resultado = ptsBilirubin + ptsAlbumin + ptsAscites + ptsTumourExtent;

    /*if (resultado == 0) {
      return 'I ($resultado)';
    } else if (resultado == 1 || resultado == 2) {
      return 'II ($resultado)';
    } else {
      return 'III ($resultado)';
    }*/
    return ['a', 'b', 'c'];

    //return 'prueba';
  }

  void convertToIU() {
    meldData.bilirubin = units.getIUBilirrubin(meldData.bilirubin);
    meldData.creatinine = units.getIUCreatinin(meldData.creatinine);
    meldData.albumin = units.getIUAlbumin(meldData.albumin);
    meldData.sodium = units.getIUSodium(meldData.sodium);
  }

  void showPts(ptsBilirubin, ptsAlbumin, ptsAscites, ptsTumourExtent) {
    print("\n\n**********PUNTOS\nPuntos bilirrubina: $ptsBilirubin");
    print("Puntos albúmina: $ptsAlbumin");
    print("Puntos ascitis: $ptsAscites");
    print("Puntos extension: $ptsTumourExtent");
  }

  void showObjectMeldData() {
    print("\n\n*****************OBJETO MeldDATA: "
            "\nbilirrubina : ${meldData.bilirubin}" +
        "\ninr : ${meldData.inr}" +
        "\ncreatinina : ${meldData.creatinine}" +
        "\nalbumina : ${meldData.albumin}" +
        "\nsodio : ${meldData.sodium}" +
        "\ndialisis : ${meldData.dialysis}" +
        "\n**************");
  }
}
