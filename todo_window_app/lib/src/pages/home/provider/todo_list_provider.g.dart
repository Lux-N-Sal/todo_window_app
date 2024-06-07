// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoListHash() => r'87215b655a121245667337693318d4a70bdc1eb2';

/// See also [TodoList].
@ProviderFor(TodoList)
final todoListProvider =
    NotifierProvider<TodoList, List<TodoListState>>.internal(
  TodoList.new,
  name: r'todoListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todoListHash,
  dependencies: <ProviderOrFamily>[alwaysLogFileServiceProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    alwaysLogFileServiceProvider,
    ...?alwaysLogFileServiceProvider.allTransitiveDependencies
  },
);

typedef _$TodoList = Notifier<List<TodoListState>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
