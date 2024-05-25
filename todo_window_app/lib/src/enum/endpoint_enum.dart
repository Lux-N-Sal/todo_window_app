enum Endpoint {
  join,
  login;

  String getPath() {
    switch (this) {
      case Endpoint.join:
        return "/v1/user/join";
      case Endpoint.login:
        return "/v1/user/login";
    }
  }
}
