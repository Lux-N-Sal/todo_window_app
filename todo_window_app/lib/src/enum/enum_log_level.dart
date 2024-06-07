enum LogLevel {
  debug,
  info,
  warn,
  error,
  fatal;

  String getString() {
    switch (this) {
      case LogLevel.debug:
        return "DEBUG";
      case LogLevel.info:
        return "INFO";
      case LogLevel.warn:
        return "WARN";
      case LogLevel.error:
        return "ERROR";
      case LogLevel.fatal:
        return "FATAL";
    }
  }
}
