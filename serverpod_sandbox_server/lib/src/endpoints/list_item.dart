import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class ListItemEndpoint extends Endpoint {
  Future<List<ListItem>> getListItems(Session session) async {
    return await ListItem.find(session);
  }

  Future<void> addItem(Session session, String name) async {
    await ListItem.insert(session, ListItem(name: name));
  }

  Future<void> removeItem(Session session, ListItem item) async {
    await ListItem.deleteRow(session, item);
  }
}
