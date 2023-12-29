/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class DeleteListItem extends _i1.SerializableEntity {
  DeleteListItem({required this.id});

  factory DeleteListItem.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return DeleteListItem(
        id: serializationManager.deserialize<int>(jsonSerialization['id']));
  }

  int id;

  @override
  Map<String, dynamic> toJson() {
    return {'id': id};
  }
}
