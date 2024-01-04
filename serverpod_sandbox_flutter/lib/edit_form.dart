import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_sandbox_client/serverpod_sandbox_client.dart';
import 'package:serverpod_sandbox_flutter/controllers/list_service/list_service.dart';

class DialogForm extends ConsumerWidget {
  const DialogForm({super.key, this.item});

  final ListItem? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editController = TextEditingController(
      text: item?.name,
    );

    return AlertDialog(
      content: TextField(
        controller: editController,
        decoration: const InputDecoration(
          labelText: 'Name',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            item == null
                ? ref.read(listServiceProvider).addItem(editController.text)
                : ref
                    .read(listServiceProvider)
                    .editItem(item!.id!, editController.text);
            Navigator.of(context).pop();
          },
          child: item == null ? const Text('add') : const Text('edit'),
        ),
      ],
    );
  }
}
