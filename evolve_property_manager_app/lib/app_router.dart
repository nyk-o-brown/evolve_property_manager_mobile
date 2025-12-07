import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/auth/presentation/register_screen.dart';
import 'features/dashboard/presentation/dashboard_screen.dart';
import 'features/properties/presentation/property_list_screen.dart';
import 'features/properties/presentation/property_create_screen.dart';
import 'features/properties/presentation/property_detail_screen.dart';
import 'features/units/presentation/property_units_screen.dart';
import 'features/units/presentation/unit_create_screen.dart';
import 'features/tenants/presentation/tenant_list_screen.dart';
import 'features/tenants/presentation/tenant_create_screen.dart';
import 'features/tenants/presentation/tenant_home_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) => GoRouter(
  initialLocation: '/login',
  routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
        routes: [
          GoRoute(
            path: 'properties',
            builder: (context, state) => const PropertyListScreen(),
            routes: [
              GoRoute(
                path: 'create',
                builder: (context, state) => const PropertyCreateScreen(),
              ),
              GoRoute(
                path: ':propertyId',
                builder: (context, state) {
                  final propertyId = state.pathParameters['propertyId']!;
                  return PropertyDetailScreen(propertyId: int.parse(propertyId));
                },
              ),
              GoRoute(
                path: ':propertyId/units',
                builder: (context, state) {
                  final propertyId = state.pathParameters['propertyId']!;
                  return PropertyUnitsScreen(propertyId: propertyId);
                },
                routes: [
                  GoRoute(
                    path: 'create',
                    builder: (context, state) {
                      final propertyId = state.pathParameters['propertyId']!;
                      return UnitCreateScreen(propertyId: propertyId);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/tenants',
        builder: (context, state) => const TenantListScreen(),
        routes: [
          GoRoute(
            path: 'create',
            builder: (context, state) => const TenantCreateScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/tenant/dashboard',
        builder: (context, state) => const TenantHomeScreen(),
      ),
    ],
  ),
);
