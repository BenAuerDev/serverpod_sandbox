import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_sandbox_client/serverpod_sandbox_client.dart';
import 'package:serverpod_auth_client/src/protocol/user_info.dart';

final clientProvider = Provider<Client>((ref) {
  final client = Client(
    'http://localhost:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();
  return client;
});

final sessionManagerProvider = Provider<SessionManager>((ref) {
  final client = ref.watch(clientProvider);
  final sessionManager = SessionManager(
    caller: client.modules.auth,
  );
  sessionManager.initialize().then((value) => value);

  return sessionManager;
});

final isAuthenticatedProvider = StreamProvider<UserInfo?>((ref) {
  final sessionManager = ref.watch(sessionManagerProvider);

  sessionManager.addListener(() {
    ref.invalidateSelf();
  });

  return Stream.value(sessionManager.signedInUser);
});
