// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoListState {
  final String id;
  final String name;
  TodoListState({
    required this.id,
    required this.name,
  });

  factory TodoListState.init() => TodoListState(id: "", name: "");

  factory TodoListState.fromJson(Map<String, dynamic> json) => TodoListState(
        id: json["listId"] ?? "",
        name: json["listName"] ?? "",
      );

  TodoListState copyWith({
    String? id,
    String? name,
  }) {
    return TodoListState(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
