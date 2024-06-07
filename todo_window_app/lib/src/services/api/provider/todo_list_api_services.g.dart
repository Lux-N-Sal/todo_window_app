// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_api_services.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoListApiServicesHash() =>
    r'd6794fe2da9555cafc96367002d76cad0acf9a05';

/// See also [todoListApiServices].
@ProviderFor(todoListApiServices)
final todoListApiServicesProvider =
    AutoDisposeProvider<TodoListApiServices>.internal(
  todoListApiServices,
  name: r'todoListApiServicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todoListApiServicesHash,
  dependencies: <ProviderOrFamily>[dioProvider, logFileServiceProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    dioProvider,
    ...?dioProvider.allTransitiveDependencies,
    logFileServiceProvider,
    ...?logFileServiceProvider.allTransitiveDependencies
  },
);

typedef TodoListApiServicesRef = AutoDisposeProviderRef<TodoListApiServices>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
