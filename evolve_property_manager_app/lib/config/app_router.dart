import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:evolve_property_manager_app/screens/dashboard_screen.dart';
import 'package:evolve_property_manager_app/screens/tenant_list_screen.dart';
import 'package:evolve_property_manager_app/screens/tenant_create_screen.dart';
import 'package:evolve_property_manager_app/screens/property_list_screen.dart';
import 'package:evolve_property_manager_app/screens/unit_create_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/dashboard',
    routes: [
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/tenants',
        builder: (context, state) => const TenantListScreen(),
      ),
      GoRoute(
        path: '/tenants/create',
        builder: (context, state) => const TenantCreateScreen(),
      ),
      GoRoute(
        path: '/properties',
        builder: (context, state) => const PropertyListScreen(),
      ),
      GoRoute(
        path: '/dashboard/properties/:propertyId/units/create',
        builder: (context, state) {
          final propertyId = state.pathParameters['propertyId']!;
          return UnitCreateScreen(propertyId: propertyId);
        },
      ),
    ],
  );
});