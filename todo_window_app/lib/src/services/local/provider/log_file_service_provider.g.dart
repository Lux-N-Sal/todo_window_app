// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_file_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$logFileServiceHash() => r'c33f0d7aafa2d946ca8b502f133ecda3e095e9bb';

/// See also [logFileService].
@ProviderFor(logFileService)
final logFileServiceProvider = AutoDisposeProvider<LogFileService>.internal(
  logFileService,
  name: r'logFileServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$logFileServiceHash,
  dependencies: <ProviderOrFamily>[debugFileServiceProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    debugFileServiceProvider,
    ...?debugFileServiceProvider.allTransitiveDependencies
  },
);

typedef LogFileServiceRef = AutoDisposeProviderRef<LogFileService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
