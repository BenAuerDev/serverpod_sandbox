import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_sandbox_client/serverpod_sandbox_client.dart';
import 'package:flutter/material.dart';

late SessionManager sessionManager;
late Client client;

Future<void> initializeServerpodClient() async {
  late String ipAddress;

  ipAddress = 'localhost';
  // ipAddress = '10.0.2.2';

  client = Client(
    'http://$ipAddress:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  sessionManager = SessionManager(
    caller: client.modules.auth,
  );

  await sessionManager.initialize();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeServerpodClient();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                sessionManager.isSignedIn
                    ? Column(
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
                      )
                    : SignInWithEmailButton(
                        caller: client.modules.auth,
                        onSignedIn: () {
                          print('Signed in!');
                        },
                      ),
              ],
            ),
          ),
        ));
  }
}
