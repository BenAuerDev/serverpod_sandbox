import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class ListItemEndpoint extends Endpoint {
  Future<List<ListItem>> getListItems(Session session) async {
    return await ListItem.find(session);
  }

  Future<void> addItem(Session session, ListItem item) async {
    await ListItem.insert(session, item);
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

    if (message is DeleteListItem) {
      await removeItem(session, message.id);
    }

    session.messages.postMessage(
      'list',
      message,
    );
  }
}
