import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

import 'bclc_data.dart';

class BclcAlgorithm {
  final BclcData bclcData;

  BclcAlgorithm(this.bclcData);

  final units = Units();

  String obtenerResultado() {
    final prefs = UserSettings();
    final units = Units();

    showPts();

    return 'prueba';



  }


  void showPts() {
    print("\n\n**********PUNTOS BCLC\n");
    print("Campo numero de tumores: ${bclcData.tumourNumber}");
    print("Campo tamaño de tumores: ${bclcData.tumourSize.toString()}");
    print("Campo pvi: ${bclcData.pvi}");
    print("Campo nodos: ${bclcData.nodes}");
    print("Campo metastasis: ${bclcData.metastasis}");
    print("Campo ecog: ${bclcData.ecog}");
    print("Campo cps: ${bclcData.cps}");
  }

}
