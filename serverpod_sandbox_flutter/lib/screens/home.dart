import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_sandbox_flutter/controllers/list_service/list_service.dart';
import 'package:serverpod_sandbox_flutter/edit_form.dart';
import 'package:serverpod_sandbox_flutter/controllers/serverpod_service/serverpod_service.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionManager = ref.watch(serverpodServiceProvider).sessionManager;
    final listService = ref.watch(listServiceProvider);

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
              const SizedBox(height: 20),
              TextButton(
                child: const Text('Add item'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DialogForm();
                      });
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  ref.read(listServiceProvider).addItem('Test item');
                },
                child: const Text('Add Test item'),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ref.watch(listItemStreamProvider).when(
                      data: (items) {
                        return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return ListTile(
                              title: Text(item.name),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return DialogForm(
                                              item: item,
                                            );
                                          });
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      listService.removeItem(item.id!);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      error: (error, stackTrace) => const Center(
                        child: Text('Error'),
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
