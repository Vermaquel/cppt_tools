class CpptEntity {
  String? keadaanUmum;
  String? kesadaran;
  String? td1;
  String? td2;
  String? hr;
  String? rr;
  String? t;
  String? map;
  String? urin;
  String? wongbaker;
  String? resikoJatuh;
  String? subjektif;
  String? saturasi;

  CpptEntity(
      {this.keadaanUmum = "Sedang",
      this.kesadaran = "Compos mentis",
      this.td1 = "120",
      this.td2 = "80",
      this.hr = "87",
      this.rr = "20",
      this.t = "36",
      this.map,
      this.urin,
      this.wongbaker = "3",
      this.resikoJatuh = "35",
      this.subjektif = "Keluhan (-)",
      this.saturasi});

  CpptEntity.fromJson(Map<String, dynamic> json) {
    keadaanUmum = json['keadaanUmum'];
    kesadaran = json['kesadaran'];
    td1 = json['td1'];
    td2 = json['td2'];
    hr = json['hr'];
    rr = json['rr'];
    t = json['t'];
    map = json['map'];
    urin = json['urin'];
    wongbaker = json['wongbaker'];
    resikoJatuh = json['resikoJatuh'];
    subjektif = json['subjektif'];
    saturasi = json['saturasi'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['keadaanUmum'] = keadaanUmum;
    data['kesadaran'] = kesadaran;
    data['td1'] = td1;
    data['td2'] = td2;
    data['hr'] = hr;
    data['rr'] = rr;
    data['t'] = t;
    data['map'] = map;
    data['urin'] = urin;
    data['wongbaker'] = wongbaker;
    data['resikoJatuh'] = resikoJatuh;
    data['subjektif'] = subjektif;
    data['saturasi'] = subjektif;

    return data;
  }

  String toClipboard() {
    String result = "";
    result += "Keadaan Umum: $keadaanUmum";
    result += "\nKesadaran: $kesadaran";
    result += "\nTD: $td1/$td2 mmHg";
    result += "\nHR: $hr x/menit";
    result += "\nRR: $rr x/menit";
    result += "\nT: $t C";
    result += "\nWong Baker $wongbaker ";
    result += "\nResiko Jatuh: $resikoJatuh";
    result += (map == null || map == "") ? "" : "\nMAP: $map mmHg";
    result += (urin == null || urin == "") ? "" : "\nTotal Urin: $urin cc";
    result += (saturasi == null || saturasi == "") ? "" : "\nSpO2: $saturasi %";
    return result;
  }
}
