class MeldData {
  double bilirubin;
  double inr;
  double creatinine;
  double albumin;
  double sodium;
  String dialysis;
  List<String> results;

  //borrar estos 3, ya tengo los resultados en la List<String> results
  String meldResult;
  String meldNaResult;
  String meld5vResult;

  MeldData({this.bilirubin,
    this.inr,
    this.creatinine,
    this.albumin,
    this.sodium,
    this.dialysis,
    this.results,
    //borrar estos 3, ya tengo los resultados en la List<String> results
    this.meldResult,
    this.meldNaResult,
    this.meld5vResult});
}
