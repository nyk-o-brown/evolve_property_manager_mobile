import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './widgets/dashboard_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Navigate to notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Quick Access',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                DashboardCard(
                  title: 'Properties',
                  icon: Icons.house,
                  onTap: () => context.go('/dashboard/properties'),
                ),
                DashboardCard(
                  title: 'Tenant Dashboard',
                  icon: Icons.person,
                  onTap: () => context.go('/tenant/dashboard'),
                ),
                DashboardCard(
                  title: 'Maintenance',
                  icon: Icons.build,
                  onTap: () {
                    // TODO: Navigate to maintenance
                  },
                ),
                DashboardCard(
                  title: 'Payments',
                  icon: Icons.payment,
                  onTap: () {
                    // TODO: Navigate to payments
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Recent Activity',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            // TODO: Add recent activity list
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'No recent activity',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
