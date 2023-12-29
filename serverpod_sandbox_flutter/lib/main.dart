import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_sandbox_flutter/providers/serverpod.dart';
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
      home: isAuthenticated.hasValue ? const HomeScreen() : const AuthScreen(),
    );
  }
}
