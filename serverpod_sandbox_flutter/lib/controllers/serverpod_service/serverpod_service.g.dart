// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serverpod_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serverpodServiceHash() => r'2f76ccb496a1c5c1ff29af555d326433ab077771';

/// See also [serverpodService].
@ProviderFor(serverpodService)
final serverpodServiceProvider = AutoDisposeProvider<ServerpodService>.internal(
  serverpodService,
  name: r'serverpodServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$serverpodServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ServerpodServiceRef = AutoDisposeProviderRef<ServerpodService>;
String _$isAuthenticatedHash() => r'5e3f2ac48d95f9d50fe91dadb569dcd1dd4a3e8c';

/// See also [isAuthenticated].
@ProviderFor(isAuthenticated)
final isAuthenticatedProvider = AutoDisposeStreamProvider<UserInfo?>.internal(
  isAuthenticated,
  name: r'isAuthenticatedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isAuthenticatedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsAuthenticatedRef = AutoDisposeStreamProviderRef<UserInfo?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
