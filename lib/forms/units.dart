//TODO poner factores correctos


const bilirrubinFactor = 17.104;
const albuminFactor = 10;

class Units {
  final List<String> bilirubinUds = ['umol/L', 'mg/dL'];
  final List<String> albuminUds = ['g/L', 'g/dL'];


  double getIUBilirrubin(double bilirrubinNotIU) {
    //print("bili vieja: $bilirrubinNotIU");
    //print("bili nueva:  ${bilirrubinNotIU * bilirrubinFactor}");
    return bilirrubinNotIU * bilirrubinFactor;
  }

  double getIUAlbumin(double albuminNotIU) {
    //print("bili vieja: $albuminNotIU");
    //print("bili nueva:  ${albuminNotIU * albuminFactor}");
    return albuminNotIU * albuminFactor;
  }
}
