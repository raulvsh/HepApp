import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

import 'complete_data.dart';

class CompleteAlgorithm {
  final CompleteData allData;

  CompleteAlgorithm(this.allData);

  final units = Units();

  String obtenerResultado(/*CpsData data*/ /*fieldBlocs*/) {
    final prefs = UserSettings();
    final units = Units();



  }

  void convertToIU() {
    //if (!prefs.getIunitsPrueba()) {
    //clipData.bilirubin = units.getIUBilirrubin(clipData.bilirubin);
    //clipData.albumin = units.getIUAlbumin(clipData.albumin);
    //}
  }

  void obtenerPuntos(
      ptsBilirubin, ptsINR, ptsAlbumin, ptsEncephalopaty, ptsAscites) {
    print("\n\n**********PUNTOS\nPuntos bilirrubina: $ptsBilirubin");
    print("Puntos inr: $ptsINR");
    print("Puntos albúmina: $ptsAlbumin");
    print("Puntos encefalopatía: $ptsEncephalopaty");
    print("Puntos ascitis: $ptsAscites");
  }

  void showObjectCPSData() {
    print("\n\n*****************OBJETO clipDATA: "
            "\nbilirrubina : ${allData.bilirubin}" +
        "\nalbumina : ${allData.albumin}" +
        "\nascites : ${allData.ascites}" +
        "\n extension: ${allData.tumourExtent}" +
        "\nresultado : ${allData.results.toString()}" +
        "\n**************");
  }
}
