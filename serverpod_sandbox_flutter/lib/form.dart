import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemForm extends ConsumerWidget {
  const ItemForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();

    return SizedBox(
      width: 500,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          TextButton(
            onPressed: () async {
              // TODO: immplement add item

              nameController.clear();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
