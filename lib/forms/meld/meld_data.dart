class MeldData {
  double bilirubin;
  double inr;
  double creatinine;
  double albumin;
  double sodium;
  String dialysis;
  String result;

  MeldData(
      {double bilirubin,
      double inr,
      double creatinine,
      double albumin,
      double sodium,
      String dialysis,
      String result}) {
    this.bilirubin = bilirubin;
    this.inr = inr;
    this.creatinine = creatinine;
    this.albumin = albumin;
    this.sodium = sodium;
    this.dialysis = dialysis;
    this.result = result;
  }
}
