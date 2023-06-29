class SubjectifEntity {
  String? subjektif;
  String? siapa;

  SubjectifEntity({this.subjektif = "keluhan (-)", this.siapa = "Pasien"});

  SubjectifEntity.fromJson(Map<String, dynamic> json) {
    subjektif = json['subjektif'];
    siapa = json['siapa'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['subjektif'] = subjektif;
    data['siapa'] = siapa;
    return data;
  }

  String subToClipboard() {
    String result = "";
    result += subjektif == ""
        ? '$siapa mengatakan, keluhan (-)'
        : "$siapa mengatakan, $subjektif. ";
    return result;
  }
}
