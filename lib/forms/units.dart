//TODO poner factores correctos

const bilirrubinFactor = 3.42;
const albuminFactor = 3.42;

class Units {
  final List<String> bilirubinUds = ['umol/l', 'umol/l2'];
  final List<String> albuminUds = ['umol/l', 'umol/l2'];

  double getConvertedBilirrubin(double bilirrubinNotIU) {
    print("bili vieja: $bilirrubinNotIU");
    print("bili nueva:  ${bilirrubinNotIU * bilirrubinFactor}");
    return bilirrubinNotIU * bilirrubinFactor;
  }

  double getConvertedAlbumin(double albuminNotIU) {
    print("bili vieja: $albuminNotIU");
    print("bili nueva:  ${albuminNotIU * albuminFactor}");
    return albuminNotIU * albuminFactor;
  }
}
