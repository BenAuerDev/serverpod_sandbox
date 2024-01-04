import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_sandbox_client/serverpod_sandbox_client.dart';
import 'package:serverpod_sandbox_flutter/controllers/serverpod_service.dart';

part 'list_service.g.dart';

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
    final client = ref.read(serverpodServiceProvider).client;

    await client.listItem.sendStreamMessage(ListItem(name: name));
  }

  Future<void> editItem(int id, String item) async {
    final client = ref.read(serverpodServiceProvider).client;

    await client.listItem.sendStreamMessage(EditListItem(id: id, data: item));
  }

  Future<void> removeItem(int id) async {
    final client = ref.read(serverpodServiceProvider).client;

    await client.listItem.sendStreamMessage(DeleteListItem(id: id));
  }
}

@riverpod
ListService listService(Ref ref) => ListService(ref);

@riverpod
Future<List<ListItem>> listItems(Ref ref) =>
    ref.read(listServiceProvider).getAllItems();

@riverpod
Stream<List<ListItem>> listItemStream(ListItemStreamRef ref) async* {
  final client = ref.read(serverpodServiceProvider).client;

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
}
