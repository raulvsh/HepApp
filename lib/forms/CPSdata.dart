class CPSdata {
  double bilirubin;
  double inr;
  double albumin;
  String encephalopaty;
  String ascites;
  String result;

  CPSdata(
      {double bilirubin,
      double inr,
      double albumin,
      String encephalopaty,
      String ascites,
      String result}) {
    this.bilirubin = bilirubin;
    this.albumin = albumin;
    this.inr = inr;
    this.ascites = ascites;
    this.encephalopaty = encephalopaty;
    this.result = result;
  }
}
