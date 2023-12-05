import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_sandbox_flutter/providers/serverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionManager = ref.watch(sessionManagerProvider);
    final client = ref.watch(clientProvider);

    final isAuthenticated = ref.watch(isAuthenticatedProvider);

    return MaterialApp(
        title: 'Serverpod Flutter Sandbox',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Serverpod Flutter Sandbox'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Serverpod Flutter Sandbox',
                ),
                isAuthenticated.when(
                  data: (data) {
                    if (data == null) {
                      return SignInWithEmailButton(
                        caller: client.modules.auth,
                        onSignedIn: () {
                          print('Signed in!');
                        },
                      );
                    } else {
                      return Column(
                        children: [
                          Text(
                              'Signed in as ${sessionManager.signedInUser!.email}'),
                          ElevatedButton(
                            onPressed: () async {
                              await sessionManager.signOut();
                            },
                            child: const Text('Sign out'),
                          ),
                        ],
                      );
                    }
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stackTrace) => Text('Error: $error'),
                ),
              ],
            ),
          ),
        ));
  }
}
