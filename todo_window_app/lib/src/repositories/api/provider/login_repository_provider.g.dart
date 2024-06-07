// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginRepositoryHash() => r'9699af6ebccae53d839b21b132f1e8b40d46a0eb';

/// See also [loginRepository].
@ProviderFor(loginRepository)
final loginRepositoryProvider = AutoDisposeProvider<LoginRepository>.internal(
  loginRepository,
  name: r'loginRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginRepositoryHash,
  dependencies: <ProviderOrFamily>[
    loginAPIServiceProvider,
    logFileServiceProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    loginAPIServiceProvider,
    ...?loginAPIServiceProvider.allTransitiveDependencies,
    logFileServiceProvider,
    ...?logFileServiceProvider.allTransitiveDependencies
  },
);

typedef LoginRepositoryRef = AutoDisposeProviderRef<LoginRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
