enum APIResult {
  s,
  f;

  String getString() {
    return toString().split(".").last.toUpperCase();
  }
}
