/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'delete_list_item.dart' as _i2;
import 'list_item.dart' as _i3;
import 'package:serverpod_sandbox_client/src/protocol/list_item.dart' as _i4;
import 'package:serverpod_auth_client/module.dart' as _i5;
export 'delete_list_item.dart';
export 'list_item.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.DeleteListItem) {
      return _i2.DeleteListItem.fromJson(data, this) as T;
    }
    if (t == _i3.ListItem) {
      return _i3.ListItem.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.DeleteListItem?>()) {
      return (data != null ? _i2.DeleteListItem.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i3.ListItem?>()) {
      return (data != null ? _i3.ListItem.fromJson(data, this) : null) as T;
    }
    if (t == List<_i4.ListItem>) {
      return (data as List).map((e) => deserialize<_i4.ListItem>(e)).toList()
          as dynamic;
    }
    try {
      return _i5.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i5.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.DeleteListItem) {
      return 'DeleteListItem';
    }
    if (data is _i3.ListItem) {
      return 'ListItem';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i5.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'DeleteListItem') {
      return deserialize<_i2.DeleteListItem>(data['data']);
    }
    if (data['className'] == 'ListItem') {
      return deserialize<_i3.ListItem>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
