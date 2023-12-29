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

  // Future<ListItem> getItemById(int id) async {
  //   return await ref.read(serverpodServiceProvider).client.listItem.get;
  // }

  Future<void> addItem(String name) async {
    // await ref
    //     .read(serverpodServiceProvider)
    //     .client
    //     .listItem
    //     .addItem(ListItem(name: name));
    final client = ref.read(serverpodServiceProvider).client;

    await client.listItem.sendStreamMessage(ListItem(name: name));
  }

  Future<void> editItem(int id, String item) async {
    // await ref.read(serverpodServiceProvider).client.listItem.editItem(item);

    // final item = ref.read(serverpodServiceProvider).client.listItem.

    final client = ref.read(serverpodServiceProvider).client;

    await client.listItem.sendStreamMessage(EditListItem(id: id, data: item));
  }

  Future<void> removeItem(int id) async {
    // await ref.read(serverpodServiceProvider).client.listItem.removeItem(item);

    final client = ref.read(serverpodServiceProvider).client;

    await client.listItem.sendStreamMessage(DeleteListItem(id: id));
  }
}

final listServiceProvider = Provider<ListService>(((ref) {
  return ListService(ref);
}));

final listProvider = FutureProvider<List<ListItem>>((ref) {
  return ref.read(listServiceProvider).getAllItems();
});

final listItemStreamProvider =
    StreamProvider.autoDispose<List<ListItem>>((ref) async* {
  final client = ref.watch(serverpodServiceProvider).client;

  await client.openStreamingConnection();

  ref.onDispose(() {
    client.closeStreamingConnection();
  });

  var activeItems = <ListItem>[];

  await for (final item in client.listItem.stream) {
    if (item is ListItem) {
      activeItems.add(item);
    }

    if (item is EditListItem) {
      activeItems = activeItems.map((element) {
        if (element.id == item.id) {
          element.name = item.data;
        }
        return element;
      }).toList();
    }

    if (item is DeleteListItem) {
      activeItems =
          activeItems.where((element) => element.id != item.id).toList();
    }

    yield activeItems;
  }
});
