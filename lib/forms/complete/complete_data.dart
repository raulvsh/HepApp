class CompleteData {
  //Diagnostic
  String tumourNumber;
  double tumourSize;
  String tumourExtent;
  String pvi;
  String nodes;
  String metastasis;
  String portalHypertension;
  String pvt;

  //Laboratory
  double bilirubin;
  double inr;
  double creatinine;
  double albumin;
  double sodium;
  double platelets;
  double afp;
  double ast;
  double astUpperLimit;
  double alp;
  double alpUpperLimit;
  String dialysis;

  //Clinical
  String cirrhosis;
  String encephalopaty;
  String ascites;
  String varices;
  String ecog;

  //Results
  List<String> results;

  CompleteData(
      {
      //Diagnostic
      this.tumourNumber,
      this.tumourSize,
      this.tumourExtent,
      this.pvi,
      this.nodes,
      this.metastasis,
      this.portalHypertension,
      this.pvt,
      //Laboratory
      this.bilirubin,
      this.inr,
      this.creatinine,
      this.albumin,
      this.sodium,
      this.platelets,
      this.afp,
      this.ast,
      this.astUpperLimit,
      this.alp,
      this.alpUpperLimit,
      this.dialysis,
      //Clinical
      this.cirrhosis,
      this.encephalopaty,
      this.ascites,
      this.varices,
      this.ecog,
      //Results
      this.results});
}
