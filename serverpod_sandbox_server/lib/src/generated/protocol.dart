/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/module.dart' as _i3;
import 'delete_list_item.dart' as _i4;
import 'edit_list_item.dart' as _i5;
import 'list_item.dart' as _i6;
import 'package:serverpod_sandbox_server/src/generated/list_item.dart' as _i7;
export 'delete_list_item.dart';
export 'edit_list_item.dart';
export 'list_item.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final targetDatabaseDefinition = _i2.DatabaseDefinition(tables: [
    _i2.TableDefinition(
      name: 'sandbox_list_item',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'sandbox_list_item_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'sandbox_list_item_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetDatabaseDefinition.tables,
    ..._i2.Protocol.targetDatabaseDefinition.tables,
  ]);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i4.DeleteListItem) {
      return _i4.DeleteListItem.fromJson(data, this) as T;
    }
    if (t == _i5.EditListItem) {
      return _i5.EditListItem.fromJson(data, this) as T;
    }
    if (t == _i6.ListItem) {
      return _i6.ListItem.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.DeleteListItem?>()) {
      return (data != null ? _i4.DeleteListItem.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i5.EditListItem?>()) {
      return (data != null ? _i5.EditListItem.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.ListItem?>()) {
      return (data != null ? _i6.ListItem.fromJson(data, this) : null) as T;
    }
    if (t == List<_i7.ListItem>) {
      return (data as List).map((e) => deserialize<_i7.ListItem>(e)).toList()
          as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i4.DeleteListItem) {
      return 'DeleteListItem';
    }
    if (data is _i5.EditListItem) {
      return 'EditListItem';
    }
    if (data is _i6.ListItem) {
      return 'ListItem';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'DeleteListItem') {
      return deserialize<_i4.DeleteListItem>(data['data']);
    }
    if (data['className'] == 'EditListItem') {
      return deserialize<_i5.EditListItem>(data['data']);
    }
    if (data['className'] == 'ListItem') {
      return deserialize<_i6.ListItem>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i6.ListItem:
        return _i6.ListItem.t;
    }
    return null;
  }

  @override
  _i2.DatabaseDefinition getTargetDatabaseDefinition() =>
      targetDatabaseDefinition;
}
