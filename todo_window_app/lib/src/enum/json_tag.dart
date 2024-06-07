enum JsonTag {
  authorization,
  listId,
  listName,
  changeListName,
  theme,
  language,
  ;

  String getString() {
    switch (this) {
      case JsonTag.authorization:
        return toString().split(".").last.toUpperCase();
      case JsonTag.listId:
      case JsonTag.listName:
      case JsonTag.changeListName:
      case JsonTag.theme:
      case JsonTag.language:
        return toString().split(".").last;
    }
  }
}
