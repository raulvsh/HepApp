const bilirrubinFactor = 17.104;
const albuminFactor = 10;
const creatininFactor = 88.4017;
const sodiumFactor = 1000;


class Units {
  final List<String> bilirubinUds = ['umol/L', 'mg/dL'];
  final List<String> albuminUds = ['g/L', 'g/dL'];
  final List<String> creatinineUds = ['umol/L', 'mg/dL'];
  final List<String> sodiumUds = ['umol/L', 'mEq/L'];


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

  double getIUSodium(double sodiumNotIU) {
    return sodiumNotIU * sodiumFactor;
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

  double getNotIUSodium(double sodiumIU) {
    return sodiumIU / sodiumFactor;
  }
}
