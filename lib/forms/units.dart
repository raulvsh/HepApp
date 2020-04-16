//TODO poner factores correctos

const bilirrubinFactor = 17.104;
const albuminFactor = 10;
const creatininFactor = 88.4017;


class Units {
  final List<String> bilirubinUds = ['umol/L', 'mg/dL'];
  final List<String> albuminUds = ['g/L', 'g/dL'];
  final List<String> creatininUds = ['umol/L', 'mg/dL'];

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

  double getIUCreatinin(double creatininNotIU) {
    return creatininNotIU * creatininFactor;
  }

  double getNotIUBilirrubin(double bilirrubinIU) {
    return bilirrubinIU / bilirrubinFactor;
  }

  double getNotIUAlbumin(double albuminIU) {
    return albuminIU / albuminFactor;
  }

  double getNotIUCreatinin(double creatininIU) {
    return creatininIU / creatininFactor;
  }
}
