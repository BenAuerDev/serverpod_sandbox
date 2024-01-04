// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listServiceHash() => r'c9af35eeb107adeda6e0bf107ced9ac5f482a406';

/// See also [listService].
@ProviderFor(listService)
final listServiceProvider = AutoDisposeProvider<ListService>.internal(
  listService,
  name: r'listServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$listServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ListServiceRef = AutoDisposeProviderRef<ListService>;
String _$listItemsHash() => r'87ba794474d7fa6cb7bffe1b82344f2e17acc339';

/// See also [listItems].
@ProviderFor(listItems)
final listItemsProvider = AutoDisposeFutureProvider<List<ListItem>>.internal(
  listItems,
  name: r'listItemsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$listItemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ListItemsRef = AutoDisposeFutureProviderRef<List<ListItem>>;
String _$listItemStreamHash() => r'3bd18cd902c1d73586c60b8406d626f4f34f99be';

/// See also [listItemStream].
@ProviderFor(listItemStream)
final listItemStreamProvider =
    AutoDisposeStreamProvider<List<ListItem>>.internal(
  listItemStream,
  name: r'listItemStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listItemStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ListItemStreamRef = AutoDisposeStreamProviderRef<List<ListItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
