enum FileName {
  folderTodo,
  logtest,
  logdebug,
  jsontest,
  profiles,
  setting;

  String getString() {
    switch (this) {
      case FileName.folderTodo:
        return '.todo';
      case FileName.logtest:
        return 'logtest.txt';
      case FileName.logdebug:
        return 'logdebug.txt';
      case FileName.jsontest:
        return 'jsontest.json';
      case FileName.profiles:
        return "profiles.json";
      case FileName.setting:
        return "setting.json";
    }
  }
}
