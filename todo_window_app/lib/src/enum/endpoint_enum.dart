enum Endpoint {
  join,
  login,
  getTodos,
  ;

  String getPath() {
    switch (this) {
      case Endpoint.join:
        return "/v1/user/join";
      case Endpoint.login:
        return "/v1/user/login";
      case Endpoint.getTodos:
        return "/v1/list/lists";
    }
  }
}
