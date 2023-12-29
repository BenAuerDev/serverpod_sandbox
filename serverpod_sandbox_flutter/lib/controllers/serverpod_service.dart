import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_sandbox_client/serverpod_sandbox_client.dart';
import 'package:serverpod_auth_client/src/protocol/user_info.dart';

class ServerpodService {
  ServerpodService(this.ref) {
    sessionManager = SessionManager(
      caller: client.modules.auth,
    );
    sessionManager.initialize();
  }
  final Ref ref;

  final client = Client(
    'http://localhost:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  late SessionManager sessionManager;
  SessionManager get session => sessionManager;
}

final serverpodServiceProvider = Provider<ServerpodService>((ref) {
  return ServerpodService(ref);
});

final isAuthenticatedProvider = StreamProvider<UserInfo?>((ref) {
  final sessionManager = ref.watch(serverpodServiceProvider).sessionManager;

  sessionManager.addListener(() {
    ref.invalidateSelf();
  });

  return Stream.value(sessionManager.signedInUser);
});
