/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/list_item.dart' as _i2;
import 'package:serverpod_sandbox_server/src/generated/list_item.dart' as _i3;
import 'package:serverpod_auth_server/module.dart' as _i4;

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
        'addItem': _i1.MethodConnector(
          name: 'addItem',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['listItem'] as _i2.ListItemEndpoint).addItem(
            session,
            params['name'],
          ),
        ),
        'removeItem': _i1.MethodConnector(
          name: 'removeItem',
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
              (endpoints['listItem'] as _i2.ListItemEndpoint).removeItem(
            session,
            params['item'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i4.Endpoints()..initializeEndpoints(server);
  }
}
