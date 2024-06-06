enum Endpoint {
  join,
  login,
  getTodoLists,
  createList,
  list,
  ;

  String getPath() {
    switch (this) {
      case Endpoint.join:
        return "/v1/user/join";
      case Endpoint.login:
        return "/v1/user/login";
      case Endpoint.getTodoLists:
        return "/v1/list/lists";
      case Endpoint.createList:
        return "/v1/list/create";
      case Endpoint.list:
        return "/v1/list";
    }
  }
}
