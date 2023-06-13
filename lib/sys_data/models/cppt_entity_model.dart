class CpptEntity {
  String? keadaanUmum;
  String? kesadaran;
  String? td1;
  String? td2;
  String? hr;
  String? rr;
  String? t;
  String? td;
  String? map;
  String? urin;
  String? wongbaker;
  String? resikoJatuh;

  CpptEntity(
      {this.keadaanUmum = "Sedang",
      this.kesadaran = "Compos mentis",
      this.td1,
      this.td2,
      this.hr,
      this.rr,
      this.td,
      this.map,
      this.urin,
      this.wongbaker = "3",
      this.resikoJatuh = "35"});

  CpptEntity.fromJson(Map<String, dynamic> json) {
    keadaanUmum = json['keadaanUmum'];
    kesadaran = json['kesadaran'];
    td1 = json['td1'];
    td2 = json['td2'];
    hr = json['hr'];
    rr = json['rr'];
    t = json['t'];
    td = json['td'];
    map = json['map'];
    urin = json['urin'];
    wongbaker = json['wongbaker'];
    resikoJatuh = json['resikoJatuh'];
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
    data['td'] = td;
    data['map'] = map;
    data['urin'] = urin;
    data['wongbaker'] = wongbaker;
    data['resikoJatuh'] = resikoJatuh;
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
    result += (map != null) ? "\nMAP: $map mmHg" : "";
    result += (urin != null) ? "\nTotal Urin: $urin cc" : "";

    return result;
  }
}
