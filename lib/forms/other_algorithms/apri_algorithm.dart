import 'package:hepapp/data/units.dart';

import 'apri_data.dart';

class ApriAlgorithm {
  final ApriData apriData;

  ApriAlgorithm(this.apriData);

  final units = Units();

  String obtenerResultado() {
    double resultado =
        ((apriData.ast / apriData.astUpperLimit) / apriData.platelets) * 100;
    showPts(resultado);
    return resultado.toString();
  }

  void showPts(double resultado) {
    print("\n\n*****************OBJETO APRI: "
            "\nast : ${apriData.ast}" +
        "\nast limite : ${apriData.astUpperLimit}" +
        "\nplatelets : ${apriData.platelets}" +
        "\n resultado : $resultado");
  }
}
