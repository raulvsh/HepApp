import 'package:hepapp/forms/units.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';

import 'cps_data.dart';

class CpsAlgorithm {
  final CpsData cpsData;

  CpsAlgorithm(this.cpsData);

  final units = Units();

  String obtenerResultado(/*CpsData data*/ /*fieldBlocs*/) {
    final prefs = PreferenciasUsuario();
    final units = Units();

    var ptsBilirubin;
    var ptsINR;
    var ptsAlbumin;
    var ptsEncephalopaty;
    var ptsAscites;

/*if(antiguo.bilirubin<=34){
      print("yujuuu " + antiguo.bilirubin.toString());
    }*/
//TODO Aquí llamar a los métodos de convertir a unidades internacionales
/*if(prefs.internationalUnits == false){
      antiguo.bilirubin = units.getConvertedBilirrubin(antiguo.bilirubin);
      antiguo.albumin = units.getConvertedAlbumin(antiguo.albumin);
    }*/
//pasar a método externo
//compruebo que esté en unidades interanacionales, si no, convierto
    if (!prefs.getInternationalUnits()) convertToIU();
    showObjectCPSData();

    if (cpsData.bilirubin <= 34) {
      ptsBilirubin = 1;
    } else if (cpsData.bilirubin <= 50) {
      ptsBilirubin = 2;
    } else {
      ptsBilirubin = 3;
    }

    if (cpsData.inr <= 1.7) {
      ptsINR = 1;
    } else if (cpsData.inr <= 2.2) {
      ptsINR = 2;
    } else {
      ptsINR = 3;
    }

    if (cpsData.albumin <= 28) {
      ptsAlbumin = 3;
    } else if (cpsData.albumin <= 35) {
      ptsAlbumin = 2;
    } else {
      ptsAlbumin = 1;
    }

    if (cpsData.encephalopaty == 'none_fem') {
      ptsEncephalopaty = 1;
    } else if (cpsData.encephalopaty == 'grade_1_2') {
      ptsEncephalopaty = 2;
    } else if (cpsData.encephalopaty == 'grade_3_4') {
      ptsEncephalopaty = 3;
    }

    if (cpsData.ascites == 'none_fem') {
      ptsAscites = 1;
    } else if (cpsData.ascites == 'controlled') {
      ptsAscites = 2;
    } else if (cpsData.ascites == 'refractory') {
      ptsAscites = 3;
    }

    obtenerPuntos(
        ptsBilirubin, ptsINR, ptsAlbumin, ptsEncephalopaty, ptsAscites);

    int resultado =
        ptsBilirubin + ptsINR + ptsAlbumin + ptsEncephalopaty + ptsAscites;
/*print('Resultado numérico: $resultado');*/
    if (resultado == 5 || resultado == 6) {
      return 'A ($resultado)';
    } else if (resultado >= 7 && resultado <= 9) {
      return 'B ($resultado)';
    } else {
      return 'C ($resultado)';
    }
  }

  void convertToIU() {
    //if (!prefs.getIunitsPrueba()) {
    cpsData.bilirubin = units.getIUBilirrubin(cpsData.bilirubin);
    cpsData.albumin = units.getIUAlbumin(cpsData.albumin);
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
    print("\n\n*****************OBJETO CPSDATA: "
            "\nbilirrubina : ${cpsData.bilirubin}" +
        "\nalbumina : ${cpsData.inr}" +
        "\ninr : ${cpsData.albumin}" +
        "\nencefalopatia : ${cpsData.encephalopaty}" +
        "\nascitis : ${cpsData.ascites}" +
        "\nresultado: ${cpsData.result}" +
        "\n**************");
  }
}
