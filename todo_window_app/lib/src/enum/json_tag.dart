enum JsonTag {
  authorization,
  listId,
  listName,
  changeListName,
  ;

  String getString() {
    switch (this) {
      case JsonTag.authorization:
        return toString().split(".").last.toUpperCase();
      case JsonTag.listId:
      case JsonTag.listName:
      case JsonTag.changeListName:
        return toString().split(".").last;
    }
  }
}
