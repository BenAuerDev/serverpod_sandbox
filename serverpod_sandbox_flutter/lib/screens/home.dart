import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_sandbox_flutter/form.dart';
import 'package:serverpod_sandbox_flutter/controllers/serverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionManager = ref.watch(serverpodServiceProvider).sessionManager;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await sessionManager.signOut();
        },
        child: const Icon(Icons.logout),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Signed in as ${sessionManager.signedInUser?.email}'),
              const ItemForm(),
              TextButton(
                  onPressed: () {
                    // for testing from other widget than form
                    // TODO: implement
                  },
                  child: const Text('Add Test item')),
            ],
          ),
        ),
      ),
    );
  }
}
