// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_file_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveFileServiceHash() => r'3dc880c29ec11718893af5753855e774298c0f8d';

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
    settingFileServiceProvider,
    logFileServiceProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    settingFileServiceProvider,
    ...?settingFileServiceProvider.allTransitiveDependencies,
    logFileServiceProvider,
    ...?logFileServiceProvider.allTransitiveDependencies
  },
);

typedef SaveFileServiceRef = AutoDisposeProviderRef<SettingFileService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
