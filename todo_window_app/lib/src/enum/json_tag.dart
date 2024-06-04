enum JsonTag {
  authorization,
  listName,
  ;

  String getString() {
    switch (this) {
      case JsonTag.authorization:
        return toString().split(".").last.toUpperCase();
      case JsonTag.listName:
        return toString().split(".").last;
    }
  }
}
