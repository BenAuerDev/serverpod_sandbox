import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_sandbox_client/serverpod_sandbox_client.dart';
import 'package:serverpod_auth_client/src/protocol/user_info.dart';

part 'serverpod_service.g.dart';

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

@riverpod
ServerpodService serverpodService(ServerpodServiceRef ref) =>
    ServerpodService(ref);

@riverpod
Stream<UserInfo?> isAuthenticated(IsAuthenticatedRef ref) async* {
  final sessionManager = ref.read(serverpodServiceProvider).sessionManager;

  sessionManager.addListener(() {
    ref.invalidateSelf();
  });

  yield sessionManager.signedInUser;
}
