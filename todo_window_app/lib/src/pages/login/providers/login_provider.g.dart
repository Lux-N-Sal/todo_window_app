// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginViewmodelHash() => r'6cfbe01b1e7b96be40f190e8fb7630b0b54004ff';

/// See also [LoginViewmodel].
@ProviderFor(LoginViewmodel)
final loginViewmodelProvider =
    AutoDisposeNotifierProvider<LoginViewmodel, LoginState>.internal(
  LoginViewmodel.new,
  name: r'loginViewmodelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginViewmodelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginViewmodel = AutoDisposeNotifier<LoginState>;
String _$asyncLoginHash() => r'9da05f3e627dc4bdba308dd056e860a9061401be';

/// See also [AsyncLogin].
@ProviderFor(AsyncLogin)
final asyncLoginProvider =
    AutoDisposeAsyncNotifierProvider<AsyncLogin, bool>.internal(
  AsyncLogin.new,
  name: r'asyncLoginProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$asyncLoginHash,
  dependencies: <ProviderOrFamily>[
    todoListRepositoryProvider,
    todoListProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    todoListRepositoryProvider,
    ...?todoListRepositoryProvider.allTransitiveDependencies,
    todoListProvider,
    ...?todoListProvider.allTransitiveDependencies
  },
);

typedef _$AsyncLogin = AutoDisposeAsyncNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
