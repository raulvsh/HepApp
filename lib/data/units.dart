const bilirrubinFactor = 17.104;
const albuminFactor = 10;
const creatininFactor = 88.4017;
const sodiumFactor = 1000;

class Units {
  final List<String> bilirubinUds = ['umol/L', 'mg/dL'];
  final List<String> albuminUds = ['g/L', 'g/dL'];
  final List<String> creatinineUds = ['umol/L', 'mg/dL'];
  final List<String> sodiumUds = ['umol/L', 'mEq/L'];

  getIUBilirrubin(double bilirrubinNotIU) => bilirrubinNotIU * bilirrubinFactor;

  getIUAlbumin(double albuminNotIU) => albuminNotIU * albuminFactor;

  getIUCreatinin(double creatininNotIU) => creatininNotIU * creatininFactor;

  getIUSodium(double sodiumNotIU) => sodiumNotIU * sodiumFactor;

  double getNotIUBilirrubin(double bilirrubinIU) =>
      bilirrubinIU / bilirrubinFactor;

  getNotIUAlbumin(double albuminIU) => albuminIU / albuminFactor;

  getNotIUCreatinin(double creatininIU) => creatininIU / creatininFactor;

  getNotIUSodium(double sodiumIU) => sodiumIU / sodiumFactor;
}
