class MeldData {
  double bilirubin;
  double inr;
  double creatinine;
  double albumin;
  double sodium;
  String dialysis;
  Map<String, String> results = {};

  MeldData({
    this.bilirubin,
    this.inr,
    this.creatinine,
    this.albumin,
    this.sodium,
    this.dialysis,
    this.results,
  });
}
