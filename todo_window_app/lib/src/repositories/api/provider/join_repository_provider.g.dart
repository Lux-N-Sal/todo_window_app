// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$joinRepositoryHash() => r'51cefa2f45909fdd82592f9c7c8b8b104b04aec7';

/// See also [joinRepository].
@ProviderFor(joinRepository)
final joinRepositoryProvider = AutoDisposeProvider<JoinRepository>.internal(
  joinRepository,
  name: r'joinRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$joinRepositoryHash,
  dependencies: <ProviderOrFamily>[
    joinAPIServiceProvider,
    logFileServiceProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    joinAPIServiceProvider,
    ...?joinAPIServiceProvider.allTransitiveDependencies,
    logFileServiceProvider,
    ...?logFileServiceProvider.allTransitiveDependencies
  },
);

typedef JoinRepositoryRef = AutoDisposeProviderRef<JoinRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
