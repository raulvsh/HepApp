class DiagnosticData {
  String tumourNumber;
  List<double> tumourSize;
  String tumourExtent;
  String pvi;
  String nodes;
  String metastasis;
  String portalHypertension;
  String pvt;

  DiagnosticData(
      {
      //Diagnostic
      this.tumourNumber,
      this.tumourSize,
      this.tumourExtent,
      this.pvi,
      this.nodes,
      this.metastasis,
      this.portalHypertension,
      this.pvt});
}

class LaboratoryData {
  double bilirubin;
  double inr;
  double creatinine;
  double albumin;
  double sodium;
  double platelets;
  double afp;
  List<double> ast;
  List<double> alp;
  String dialysis;

  LaboratoryData({
    this.bilirubin,
    this.inr,
    this.creatinine,
    this.albumin,
    this.sodium,
    this.platelets,
    this.afp,
    this.ast,
    this.alp,
    this.dialysis,
  });
}

class ClinicalData {
  String cirrhosis;
  String encephalopaty;
  String ascites;
  String varices;
  String ecog;

  ClinicalData({
    this.cirrhosis,
    this.encephalopaty,
    this.ascites,
    this.varices,
    this.ecog,
  });
}

class CompleteData {
  //Diagnostic
  String tumourNumber;
  List<double> tumourSize;
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
  List<double> ast;
  List<double> alp;
  String dialysis;

  //Clinical
  String cirrhosis;
  String encephalopaty;
  String ascites;
  String varices;
  String ecog;

  //Results
  Map<String, String> results = {};

  CompleteData({
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
    this.alp,
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
