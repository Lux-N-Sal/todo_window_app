// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_file_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localFileServiceHash() => r'5ad35e96cab8f3fc829fbc5076044ddea12258b7';

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

/// See also [localFileService].
@ProviderFor(localFileService)
const localFileServiceProvider = LocalFileServiceFamily();

/// See also [localFileService].
class LocalFileServiceFamily extends Family<LocalFileService> {
  /// See also [localFileService].
  const LocalFileServiceFamily();

  /// See also [localFileService].
  LocalFileServiceProvider call(
    FileName fileName,
  ) {
    return LocalFileServiceProvider(
      fileName,
    );
  }

  @override
  LocalFileServiceProvider getProviderOverride(
    covariant LocalFileServiceProvider provider,
  ) {
    return call(
      provider.fileName,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    logFileServiceProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    logFileServiceProvider,
    ...?logFileServiceProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'localFileServiceProvider';
}

/// See also [localFileService].
class LocalFileServiceProvider extends AutoDisposeProvider<LocalFileService> {
  /// See also [localFileService].
  LocalFileServiceProvider(
    FileName fileName,
  ) : this._internal(
          (ref) => localFileService(
            ref as LocalFileServiceRef,
            fileName,
          ),
          from: localFileServiceProvider,
          name: r'localFileServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$localFileServiceHash,
          dependencies: LocalFileServiceFamily._dependencies,
          allTransitiveDependencies:
              LocalFileServiceFamily._allTransitiveDependencies,
          fileName: fileName,
        );

  LocalFileServiceProvider._internal(
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
    LocalFileService Function(LocalFileServiceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocalFileServiceProvider._internal(
        (ref) => create(ref as LocalFileServiceRef),
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
  AutoDisposeProviderElement<LocalFileService> createElement() {
    return _LocalFileServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocalFileServiceProvider && other.fileName == fileName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocalFileServiceRef on AutoDisposeProviderRef<LocalFileService> {
  /// The parameter `fileName` of this provider.
  FileName get fileName;
}

class _LocalFileServiceProviderElement
    extends AutoDisposeProviderElement<LocalFileService>
    with LocalFileServiceRef {
  _LocalFileServiceProviderElement(super.provider);

  @override
  FileName get fileName => (origin as LocalFileServiceProvider).fileName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
