/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/list_item.dart' as _i2;
import 'package:serverpod_sandbox_server/src/generated/list_item.dart' as _i3;
import 'package:serverpod_sandbox_server/src/generated/edit_list_item.dart'
    as _i4;
import 'package:serverpod_auth_server/module.dart' as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'listItem': _i2.ListItemEndpoint()
        ..initialize(
          server,
          'listItem',
          null,
        )
    };
    connectors['listItem'] = _i1.EndpointConnector(
      name: 'listItem',
      endpoint: endpoints['listItem']!,
      methodConnectors: {
        'getListItems': _i1.MethodConnector(
          name: 'getListItems',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['listItem'] as _i2.ListItemEndpoint)
                  .getListItems(session),
        ),
        'getItemById': _i1.MethodConnector(
          name: 'getItemById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['listItem'] as _i2.ListItemEndpoint).getItemById(
            session,
            params['id'],
          ),
        ),
        'addItem': _i1.MethodConnector(
          name: 'addItem',
          params: {
            'item': _i1.ParameterDescription(
              name: 'item',
              type: _i1.getType<_i3.ListItem>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['listItem'] as _i2.ListItemEndpoint).addItem(
            session,
            params['item'],
          ),
        ),
        'editItem': _i1.MethodConnector(
          name: 'editItem',
          params: {
            'item': _i1.ParameterDescription(
              name: 'item',
              type: _i1.getType<_i4.EditListItem>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['listItem'] as _i2.ListItemEndpoint).editItem(
            session,
            params['item'],
          ),
        ),
        'removeItem': _i1.MethodConnector(
          name: 'removeItem',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['listItem'] as _i2.ListItemEndpoint).removeItem(
            session,
            params['id'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i5.Endpoints()..initializeEndpoints(server);
  }
}
