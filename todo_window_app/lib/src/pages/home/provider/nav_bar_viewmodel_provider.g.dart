// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav_bar_viewmodel_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$animationControllerHash() =>
    r'2ebedf72b38eed858af5879eeb923ba84c0a7294';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [animationController].
@ProviderFor(animationController)
const animationControllerProvider = AnimationControllerFamily();

/// See also [animationController].
class AnimationControllerFamily extends Family<AnimationController> {
  /// See also [animationController].
  const AnimationControllerFamily();

  /// See also [animationController].
  AnimationControllerProvider call(
    TickerProvider ticker,
  ) {
    return AnimationControllerProvider(
      ticker,
    );
  }

  @override
  AnimationControllerProvider getProviderOverride(
    covariant AnimationControllerProvider provider,
  ) {
    return call(
      provider.ticker,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'animationControllerProvider';
}

/// See also [animationController].
class AnimationControllerProvider
    extends AutoDisposeProvider<AnimationController> {
  /// See also [animationController].
  AnimationControllerProvider(
    TickerProvider ticker,
  ) : this._internal(
          (ref) => animationController(
            ref as AnimationControllerRef,
            ticker,
          ),
          from: animationControllerProvider,
          name: r'animationControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$animationControllerHash,
          dependencies: AnimationControllerFamily._dependencies,
          allTransitiveDependencies:
              AnimationControllerFamily._allTransitiveDependencies,
          ticker: ticker,
        );

  AnimationControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ticker,
  }) : super.internal();

  final TickerProvider ticker;

  @override
  Override overrideWith(
    AnimationController Function(AnimationControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AnimationControllerProvider._internal(
        (ref) => create(ref as AnimationControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ticker: ticker,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<AnimationController> createElement() {
    return _AnimationControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnimationControllerProvider && other.ticker == ticker;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ticker.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AnimationControllerRef on AutoDisposeProviderRef<AnimationController> {
  /// The parameter `ticker` of this provider.
  TickerProvider get ticker;
}

class _AnimationControllerProviderElement
    extends AutoDisposeProviderElement<AnimationController>
    with AnimationControllerRef {
  _AnimationControllerProviderElement(super.provider);

  @override
  TickerProvider get ticker => (origin as AnimationControllerProvider).ticker;
}

String _$tickerProviderHash() => r'22f8bd016beb82a27f8ddfd5816a72dc3da7ca9d';

/// See also [tickerProvider].
@ProviderFor(tickerProvider)
final tickerProviderProvider = AutoDisposeProvider<TickerProvider>.internal(
  tickerProvider,
  name: r'tickerProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tickerProviderHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef TickerProviderRef = AutoDisposeProviderRef<TickerProvider>;
String _$navBarViewmodelHash() => r'8093ae6c8c0be55f787481c571b73da5750af352';

/// See also [NavBarViewmodel].
@ProviderFor(NavBarViewmodel)
final navBarViewmodelProvider =
    AutoDisposeNotifierProvider<NavBarViewmodel, NavBarState>.internal(
  NavBarViewmodel.new,
  name: r'navBarViewmodelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$navBarViewmodelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NavBarViewmodel = AutoDisposeNotifier<NavBarState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
