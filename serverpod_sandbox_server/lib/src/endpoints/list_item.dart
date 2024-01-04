import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class ListItemEndpoint extends Endpoint {
  Future<List<ListItem>> getListItems(Session session) async {
    return await ListItem.find(session);
  }

  Future<ListItem?> getItemById(Session session, int id) async {
    return await ListItem.findById(session, id);
  }

  Future<void> addItem(Session session, ListItem item) async {
    try {
      await ListItem.insert(session, item);
    } catch (e) {
      print(e);
    }
  }

  Future<void> editItem(Session session, EditListItem item) async {
    final row = await ListItem.findById(session, item.id);
    row!.name = item.data;
    await ListItem.update(session, row);
  }

  Future<void> removeItem(Session session, int id) async {
    final row = await ListItem.findById(session, id);

    await ListItem.deleteRow(session, row!);
  }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    final items = await getListItems(session);

    for (final item in items) {
      sendStreamMessage(session, item);
    }

    session.messages.addListener('list', (message) {
      sendStreamMessage(session, message);
    });
  }

  @override
  Future<void> handleStreamMessage(
    StreamingSession session,
    message,
  ) async {
    if (message is ListItem) {
      await addItem(session, message);
    }

    if (message is EditListItem) {
      await editItem(session, message);
    }

    if (message is DeleteListItem) {
      await removeItem(session, message.id);
    }

    session.messages.postMessage(
      'list',
      message,
    );
  }
}
