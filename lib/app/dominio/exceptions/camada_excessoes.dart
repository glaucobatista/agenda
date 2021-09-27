class CamadaExcessoes implements Exception {
  String causa;

  CamadaExcessoes(this.causa);

  @override
  String toString() {
    return causa;
  }
}
