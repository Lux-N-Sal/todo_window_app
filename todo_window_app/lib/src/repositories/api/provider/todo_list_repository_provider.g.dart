// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoListRepositoryHash() =>
    r'fe0437cda6a2629561bdeee0f6c24f6d10884ef5';

/// See also [todoListRepository].
@ProviderFor(todoListRepository)
final todoListRepositoryProvider =
    AutoDisposeProvider<TodoListRepository>.internal(
  todoListRepository,
  name: r'todoListRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todoListRepositoryHash,
  dependencies: <ProviderOrFamily>[
    todoListApiServicesProvider,
    logFileServiceProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    todoListApiServicesProvider,
    ...?todoListApiServicesProvider.allTransitiveDependencies,
    logFileServiceProvider,
    ...?logFileServiceProvider.allTransitiveDependencies
  },
);

typedef TodoListRepositoryRef = AutoDisposeProviderRef<TodoListRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
