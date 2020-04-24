import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';

import 'all_data.dart';

class AllAlgorithm {
  final AllData allData;

  AllAlgorithm(this.allData);

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
    /*if (!prefs.getInternationalUnits()) convertToIU();
    showObjectCPSData();

    if (meldData.bilirubin <= 34) {
      ptsBilirubin = 1;
    } else if (meldData.bilirubin <= 50) {
      ptsBilirubin = 2;
    } else {
      ptsBilirubin = 3;
    }

    if (meldData.inr <= 1.7) {
      ptsINR = 1;
    } else if (meldData.inr <= 2.2) {
      ptsINR = 2;
    } else {
      ptsINR = 3;
    }

    if (meldData.albumin <= 28) {
      ptsAlbumin = 3;
    } else if (meldData.albumin <= 35) {
      ptsAlbumin = 2;
    } else {
      ptsAlbumin = 1;
    }

    if (meldData.encephalopaty == 'none_fem') {
      ptsEncephalopaty = 1;
    } else if (meldData.encephalopaty == 'grade_1_2') {
      ptsEncephalopaty = 2;
    } else if (meldData.encephalopaty == 'grade_3_4') {
      ptsEncephalopaty = 3;
    }

    if (meldData.ascites == 'none_fem') {
      ptsAscites = 1;
    } else if (meldData.ascites == 'controlled') {
      ptsAscites = 2;
    } else if (meldData.ascites == 'refractory') {
      ptsAscites = 3;
    }

    obtenerPuntos(
        ptsBilirubin, ptsINR, ptsAlbumin, ptsEncephalopaty, ptsAscites);

    int resultado =
        ptsBilirubin + ptsINR + ptsAlbumin + ptsEncephalopaty + ptsAscites;
*/ /*print('Resultado numérico: $resultado');*/ /*
    if (resultado == 5 || resultado == 6) {
      return 'A ($resultado)';
    } else if (resultado >= 7 && resultado <= 9) {
      return 'B ($resultado)';
    } else {
      return 'C ($resultado)';
    }*/
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
