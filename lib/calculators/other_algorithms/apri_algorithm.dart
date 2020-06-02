import 'package:hepapp/data/units.dart';

import 'apri_data.dart';

final bool debug = false;

class ApriAlgorithm {
  final ApriData apriData;

  ApriAlgorithm(this.apriData);

  final units = Units();

  String obtenerResultado() {
    double resultado =
        ((apriData.ast / apriData.astUpperLimit) / apriData.platelets) * 100;
    if (debug) showPts(resultado);
    return resultado.toStringAsFixed(2);
  }

  void showPts(double resultado) {
    print("\n\n*** Objeto APRI: ");
    print("ast : ${apriData.ast}");
    print("\nast limite : ${apriData.astUpperLimit}");
    print("\nplatelets : ${apriData.platelets}");
    print("\n resultado : $resultado");
  }
}
