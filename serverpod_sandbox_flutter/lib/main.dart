import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:serverpod_sandbox_flutter/controllers/serverpod_service.dart';
import 'package:serverpod_sandbox_flutter/screens/auth.dart';
import 'package:serverpod_sandbox_flutter/screens/home.dart';

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
    final isAuthenticated = ref.watch(isAuthenticatedProvider);

    return MaterialApp(
      title: 'Serverpod Flutter Sandbox',
      home: isAuthenticated.when(
        data: (userInfo) {
          if (userInfo == null) {
            return const AuthScreen();
          } else {
            return const HomeScreen();
          }
        },
        error: (error, stackTrace) => const Scaffold(
          body: Center(
            child: Text('Error'),
          ),
        ),
        loading: () => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
