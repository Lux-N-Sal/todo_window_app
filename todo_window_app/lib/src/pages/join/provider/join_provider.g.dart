// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$joinViewmodelHash() => r'999068c619395fa921bb431e4141faf7fae14295';

/// See also [JoinViewmodel].
@ProviderFor(JoinViewmodel)
final joinViewmodelProvider =
    AutoDisposeNotifierProvider<JoinViewmodel, JoinState>.internal(
  JoinViewmodel.new,
  name: r'joinViewmodelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$joinViewmodelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$JoinViewmodel = AutoDisposeNotifier<JoinState>;
String _$asyncJoinHash() => r'822ce8eec80ffbb54764fd7d70589c2af51bc5fb';

/// See also [AsyncJoin].
@ProviderFor(AsyncJoin)
final asyncJoinProvider =
    AutoDisposeAsyncNotifierProvider<AsyncJoin, bool>.internal(
  AsyncJoin.new,
  name: r'asyncJoinProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$asyncJoinHash,
  dependencies: <ProviderOrFamily>[joinRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    joinRepositoryProvider,
    ...?joinRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$AsyncJoin = AutoDisposeAsyncNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
