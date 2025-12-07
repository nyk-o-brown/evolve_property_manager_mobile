// ✅ 
import 'package:evolve_property_manager_app/app_router.dart';
import 'package:evolve_property_manager_app/config/app_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // Ensure Flutter bindings are initialized (especially if main is async)
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive for local data caching


  // The FIX is here: Wrap your root widget (MyApp) with ProviderScope.
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Now, this line will work because MyApp is inside a ProviderScope.
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Evolve Property Manager',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
        ),
      ),
      routerConfig: goRouter,
    );
  }
}