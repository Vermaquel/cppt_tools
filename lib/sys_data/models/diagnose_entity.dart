class DiagnoseEntity {
  String? diagnose;
  String? planning;

  DiagnoseEntity({
    this.diagnose,
    this.planning,
  });

  String diagnoseCopy() {
    return diagnose ?? "";
  }

  String planningCopy() {
    return planning ?? "";
  }
}
