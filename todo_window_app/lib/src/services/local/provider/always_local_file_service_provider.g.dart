// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'always_local_file_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$alwaysLocalFileServiceHash() =>
    r'77bd53b82a9236677a9c7f648b7a82ca0c752c4e';

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

/// See also [alwaysLocalFileService].
@ProviderFor(alwaysLocalFileService)
const alwaysLocalFileServiceProvider = AlwaysLocalFileServiceFamily();

/// See also [alwaysLocalFileService].
class AlwaysLocalFileServiceFamily extends Family<LocalFileService> {
  /// See also [alwaysLocalFileService].
  const AlwaysLocalFileServiceFamily();

  /// See also [alwaysLocalFileService].
  AlwaysLocalFileServiceProvider call(
    FileName fileName,
  ) {
    return AlwaysLocalFileServiceProvider(
      fileName,
    );
  }

  @override
  AlwaysLocalFileServiceProvider getProviderOverride(
    covariant AlwaysLocalFileServiceProvider provider,
  ) {
    return call(
      provider.fileName,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies =
      const <ProviderOrFamily>[];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      const <ProviderOrFamily>{};

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'alwaysLocalFileServiceProvider';
}

/// See also [alwaysLocalFileService].
class AlwaysLocalFileServiceProvider extends Provider<LocalFileService> {
  /// See also [alwaysLocalFileService].
  AlwaysLocalFileServiceProvider(
    FileName fileName,
  ) : this._internal(
          (ref) => alwaysLocalFileService(
            ref as AlwaysLocalFileServiceRef,
            fileName,
          ),
          from: alwaysLocalFileServiceProvider,
          name: r'alwaysLocalFileServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$alwaysLocalFileServiceHash,
          dependencies: AlwaysLocalFileServiceFamily._dependencies,
          allTransitiveDependencies:
              AlwaysLocalFileServiceFamily._allTransitiveDependencies,
          fileName: fileName,
        );

  AlwaysLocalFileServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileName,
  }) : super.internal();

  final FileName fileName;

  @override
  Override overrideWith(
    LocalFileService Function(AlwaysLocalFileServiceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AlwaysLocalFileServiceProvider._internal(
        (ref) => create(ref as AlwaysLocalFileServiceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileName: fileName,
      ),
    );
  }

  @override
  ProviderElement<LocalFileService> createElement() {
    return _AlwaysLocalFileServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AlwaysLocalFileServiceProvider &&
        other.fileName == fileName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AlwaysLocalFileServiceRef on ProviderRef<LocalFileService> {
  /// The parameter `fileName` of this provider.
  FileName get fileName;
}

class _AlwaysLocalFileServiceProviderElement
    extends ProviderElement<LocalFileService> with AlwaysLocalFileServiceRef {
  _AlwaysLocalFileServiceProviderElement(super.provider);

  @override
  FileName get fileName => (origin as AlwaysLocalFileServiceProvider).fileName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
