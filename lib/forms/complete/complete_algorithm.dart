import 'package:hepapp/data/units.dart';

import 'complete_data.dart';

class CompleteAlgorithm {
  final CompleteData completeData;

  CompleteAlgorithm(this.completeData);

  final units = Units();

  /* seguramente no se use, borrar
  String obtenerResultado(*/ /*CpsData data*/ /* */ /*fieldBlocs*/ /*) {
    final prefs = UserSettings();
    final units = Units();
  }*/

  void convertToIU() {
    //if (!prefs.getIunitsPrueba()) {
    //clipData.bilirubin = units.getIUBilirrubin(clipData.bilirubin);
    //clipData.albumin = units.getIUAlbumin(clipData.albumin);
    //}
  }

/* void obtenerPuntos(
      ptsBilirubin, ptsINR, ptsAlbumin, ptsEncephalopaty, ptsAscites) {
    print(
        "\n\n**********PUNTOS\nPuntos bilirrubina: ${completeData.bilirubin}  $ptsBilirubin");
    print("Puntos inr: ${completeData.inr}  $ptsINR");
    print("Puntos albúmina: ${completeData.albumin}  $ptsAlbumin");
    print("Puntos encefalopatía: $ptsEncephalopaty");
    print("Puntos extension: ${completeData.tumourExtent} ");
    print("Puntos ascitis: $ptsAscites");
    print("\nresultado : ${completeData.results.toString()}");
  }*/


}
