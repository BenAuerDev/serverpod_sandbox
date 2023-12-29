import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_sandbox_client/serverpod_sandbox_client.dart';
import 'package:serverpod_sandbox_flutter/controllers/serverpod_service.dart';

class ListService {
  ListService(this.ref);
  final Ref ref;

  Future<List<ListItem>> getAllItems() async {
    return await ref
        .read(serverpodServiceProvider)
        .client
        .listItem
        .getListItems();
  }

  Future<void> addItem(String name) async {
    await ref.read(serverpodServiceProvider).client.listItem.addItem(name);
  }

  Future<void> removeItem(ListItem item) async {
    await ref.read(serverpodServiceProvider).client.listItem.removeItem(item);
  }
}

final listServiceProvider = Provider<ListService>(((ref) {
  return ListService(ref);
}));

final listProvider = FutureProvider<List<ListItem>>((ref) {
  return ref.read(listServiceProvider).getAllItems();
});
