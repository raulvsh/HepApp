import 'dart:math';

import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';

import 'meld_data.dart';

class MeldAlgorithm {
  final MeldData meldData;

  MeldAlgorithm(this.meldData);

  final units = Units();

  Map<String, String> obtenerResultado() {
    final prefs = PreferenciasUsuario();
    final units = Units();
    Map<String, String> results = {
      'meld': '-',
      'meld_na': '-',
      '5v_meld': '-',
    };
    var ptsBilirubin;
    var ptsAlbumin;
    var ptsAscites;
    var ptsTumourExtent;
    //print("iunits" + prefs.getInternationalUnits().toString());
    if (prefs.getInternationalUnits()) convertToNotIU();
    showObjectMeldData();

    _adaptarVariablesMeld();
    showObjectMeldData();

    //double meldResult = _calculateMeld();
    results['meld'] = _calculateMeld().toStringAsPrecision(4);
    //double meldNaResult;
    meldData.sodium != null
        ? results['meld_na'] =
        _calculateMeldNa(results['meld']).toStringAsPrecision(4)
        : '-';

    meldData.albumin != null
        ? results['5v_meld'] =
        _calculate5vMeld(results['meld_na']).toStringAsPrecision(4)
        : '-';
    //showPts(ptsBilirubin, ptsAlbumin, ptsAscites, ptsTumourExtent);

    //int resultado = ptsBilirubin + ptsAlbumin + ptsAscites + ptsTumourExtent;

    /*if (resultado == 0) {
      return 'I ($resultado)';
    } else if (resultado == 1 || resultado == 2) {
      return 'II ($resultado)';
    } else {
      return 'III ($resultado)';
    }*/
    print(results);
    return results;
    /*{
      'meld' : meldResult.toStringAsPrecision(4),
      'meld_na' : meldNaResult.toStringAsPrecision(4),
      '5v_meld' : 'c',

    };*/

    //return 'prueba';
  }

  void convertToNotIU() {
    meldData.bilirubin = units.getNotIUBilirrubin(meldData.bilirubin);
    meldData.creatinine = units.getNotIUCreatinin(meldData.creatinine);
    meldData.albumin = units.getNotIUAlbumin(meldData.albumin);
    meldData.sodium = units.getNotIUSodium(meldData.sodium);
  }

  void _adaptarVariablesMeld() {
    if (meldData.bilirubin < 1) {
      meldData.bilirubin = 1;
    }
    if (meldData.creatinine < 1) {
      meldData.creatinine = 1;
    }
    if (meldData.creatinine > 4) {
      meldData.creatinine = 4;
    }

    if (meldData.sodium < 125) {
      meldData.sodium = 125;
    } else if (meldData.sodium > 140) {
      meldData.sodium = 140;
    }

    if (meldData.albumin < 1) {
      meldData.albumin = 1;
    } else if (meldData.albumin > 4) {
      meldData.albumin = 4;
    }
  }

  double _calculateMeld() =>
      11.2 * log(meldData.inr) +
          3.78 * log(meldData.bilirubin) +
          9.57 * log(meldData.creatinine) +
          6.43;

  double _calculateMeldNa(String meldResult) {
    double meld = double.parse(meldResult);

    return meld -
        meldData.sodium -
        (0.025 * meld * (140 - meldData.sodium)) +
        140;
  }

  double _calculate5vMeld(String meldNaResult) {
    double meldNa = double.parse(meldNaResult);

    return meldNa +
        (5.275 * (4 - meldData.albumin)) -
        (0.136 * meldNa * (4 - meldData.albumin));
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
        "\nresults: ${meldData.results.toString()}"
            "\n**************");
  }
}
