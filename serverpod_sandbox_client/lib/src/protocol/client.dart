/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:serverpod_sandbox_client/src/protocol/list_item.dart' as _i3;
import 'package:serverpod_sandbox_client/src/protocol/edit_list_item.dart'
    as _i4;
import 'package:serverpod_auth_client/module.dart' as _i5;
import 'dart:io' as _i6;
import 'protocol.dart' as _i7;

class _EndpointListItem extends _i1.EndpointRef {
  _EndpointListItem(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'listItem';

  _i2.Future<List<_i3.ListItem>> getListItems() =>
      caller.callServerEndpoint<List<_i3.ListItem>>(
        'listItem',
        'getListItems',
        {},
      );

  _i2.Future<_i3.ListItem?> getItemById(int id) =>
      caller.callServerEndpoint<_i3.ListItem?>(
        'listItem',
        'getItemById',
        {'id': id},
      );

  _i2.Future<void> addItem(_i3.ListItem item) =>
      caller.callServerEndpoint<void>(
        'listItem',
        'addItem',
        {'item': item},
      );

  _i2.Future<void> editItem(_i4.EditListItem item) =>
      caller.callServerEndpoint<void>(
        'listItem',
        'editItem',
        {'item': item},
      );

  _i2.Future<void> removeItem(int id) => caller.callServerEndpoint<void>(
        'listItem',
        'removeItem',
        {'id': id},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i5.Caller(client);
  }

  late final _i5.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i6.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i7.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    listItem = _EndpointListItem(this);
    modules = _Modules(this);
  }

  late final _EndpointListItem listItem;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'listItem': listItem};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
