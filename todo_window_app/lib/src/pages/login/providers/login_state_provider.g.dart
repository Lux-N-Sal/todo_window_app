// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginStateHash() => r'2a5a95d38f20c320d317c5e8c5854b74cdef5b10';

/// See also [loginState].
@ProviderFor(loginState)
final loginStateProvider = AutoDisposeProvider<LoginState>.internal(
  loginState,
  name: r'loginStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginStateHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef LoginStateRef = AutoDisposeProviderRef<LoginState>;
String _$loginHash() => r'62167a43e245393e42fa6abba546c505f792a55d';

/// See also [Login].
@ProviderFor(Login)
final loginProvider = AutoDisposeNotifierProvider<Login, LoginState>.internal(
  Login.new,
  name: r'loginProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Login = AutoDisposeNotifier<LoginState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
