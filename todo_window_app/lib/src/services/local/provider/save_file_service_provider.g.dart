// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_file_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveFileServiceHash() => r'941bd920420e65825d39afd811570098ed153b64';

/// See also [saveFileService].
@ProviderFor(saveFileService)
final saveFileServiceProvider =
    AutoDisposeProvider<SettingFileService>.internal(
  saveFileService,
  name: r'saveFileServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$saveFileServiceHash,
  dependencies: <ProviderOrFamily>[
    localFileServiceProvider,
    logFileServiceProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    localFileServiceProvider,
    ...?localFileServiceProvider.allTransitiveDependencies,
    logFileServiceProvider,
    ...?logFileServiceProvider.allTransitiveDependencies
  },
);

typedef SaveFileServiceRef = AutoDisposeProviderRef<SettingFileService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
