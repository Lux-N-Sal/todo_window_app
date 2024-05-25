// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginViewmodelHash() => r'210cb7800e05b0b9b08bb9118d4eaebc7978f9d7';

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
String _$asyncLoginHash() => r'40bb02dc59f637e54a6ccc35672a77fe0472a8f6';

/// See also [AsyncLogin].
@ProviderFor(AsyncLogin)
final asyncLoginProvider =
    AutoDisposeAsyncNotifierProvider<AsyncLogin, bool>.internal(
  AsyncLogin.new,
  name: r'asyncLoginProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$asyncLoginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AsyncLogin = AutoDisposeAsyncNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
