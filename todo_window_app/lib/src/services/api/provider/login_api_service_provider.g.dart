// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_api_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginAPIServiceHash() => r'34b0df630baecb2e32769a2a909fcdecdfe100b2';

/// See also [loginAPIService].
@ProviderFor(loginAPIService)
final loginAPIServiceProvider = AutoDisposeProvider<LoginAPIService>.internal(
  loginAPIService,
  name: r'loginAPIServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginAPIServiceHash,
  dependencies: <ProviderOrFamily>[dioProvider, logFileServiceProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    dioProvider,
    ...?dioProvider.allTransitiveDependencies,
    logFileServiceProvider,
    ...?logFileServiceProvider.allTransitiveDependencies
  },
);

typedef LoginAPIServiceRef = AutoDisposeProviderRef<LoginAPIService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
