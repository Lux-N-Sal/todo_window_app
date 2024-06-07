// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_file_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$logFileServiceHash() => r'62130babae104fd9b7dbcfb37087a3405436a55e';

/// See also [logFileService].
@ProviderFor(logFileService)
final logFileServiceProvider = AutoDisposeProvider<LogFileService>.internal(
  logFileService,
  name: r'logFileServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$logFileServiceHash,
  dependencies: <ProviderOrFamily>[localFileServiceProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    localFileServiceProvider,
    ...?localFileServiceProvider.allTransitiveDependencies
  },
);

typedef LogFileServiceRef = AutoDisposeProviderRef<LogFileService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
