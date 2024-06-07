// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'always_log_file_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$alwaysLogFileServiceHash() =>
    r'eff541b151343967e1bb44db714f9f4420c27589';

/// See also [alwaysLogFileService].
@ProviderFor(alwaysLogFileService)
final alwaysLogFileServiceProvider = Provider<LogFileService>.internal(
  alwaysLogFileService,
  name: r'alwaysLogFileServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$alwaysLogFileServiceHash,
  dependencies: <ProviderOrFamily>[alwaysLocalFileServiceProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    alwaysLocalFileServiceProvider,
    ...?alwaysLocalFileServiceProvider.allTransitiveDependencies
  },
);

typedef AlwaysLogFileServiceRef = ProviderRef<LogFileService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
