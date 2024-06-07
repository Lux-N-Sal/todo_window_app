// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_api_service_provicer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$joinAPIServiceHash() => r'ec36acbf719e9901b22c65ad37f68b8c7f168a9d';

/// See also [joinAPIService].
@ProviderFor(joinAPIService)
final joinAPIServiceProvider = AutoDisposeProvider<JoinAPIService>.internal(
  joinAPIService,
  name: r'joinAPIServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$joinAPIServiceHash,
  dependencies: <ProviderOrFamily>[dioProvider, logFileServiceProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    dioProvider,
    ...?dioProvider.allTransitiveDependencies,
    logFileServiceProvider,
    ...?logFileServiceProvider.allTransitiveDependencies
  },
);

typedef JoinAPIServiceRef = AutoDisposeProviderRef<JoinAPIService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
