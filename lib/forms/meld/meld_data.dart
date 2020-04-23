class MeldData {
  double bilirubin;
  double inr;
  double creatinine;
  double albumin;
  double sodium;
  String dialysis;
  String meldResult;
  String meldNaResult;
  String meld5vResult;

  MeldData(
      {double bilirubin,
      double inr,
      double creatinine,
      double albumin,
      double sodium,
      String dialysis,
        String meldResult,
        String meldNaResult,
        String meld5vResult}) {
    this.bilirubin = bilirubin;
    this.inr = inr;
    this.creatinine = creatinine;
    this.albumin = albumin;
    this.sodium = sodium;
    this.dialysis = dialysis;
    this.meldResult = meldResult;
    this.meldNaResult = meldNaResult;
    this.meld5vResult = meld5vResult;
  }
}
