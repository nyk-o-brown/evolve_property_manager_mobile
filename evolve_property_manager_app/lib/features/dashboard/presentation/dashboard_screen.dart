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
            onPressed: () => context.go('/dashboard/settings'),
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
              childAspectRatio: 1.1,
              children: [
                DashboardCard(
                  title: 'Properties',
                  icon: Icons.house,
                  //value: '12',
                  backgroundColor: Colors.blue,
                  onTap: () => context.go('/dashboard/properties'),
                ),
                DashboardCard(
                  title: 'Tenants',
                  icon: Icons.people,
                  //value: '45',
                  backgroundColor: Colors.green,
                  onTap: () => context.go('/dashboard/tenants'),
                ),
                DashboardCard(
                  title: 'Payments',
                  icon: Icons.payment,
                  //value: '\$5,230',
                  backgroundColor: Colors.orange,
                  onTap: () => context.go('/dashboard/payments'),
                ),
                DashboardCard(
                  title: 'Maintenance',
                  icon: Icons.build,
                  //value: '8',
                  backgroundColor: Colors.red,
                  onTap: () => context.go('/dashboard/maintenance'),
                ),
                DashboardCard(
                  title: 'Reports',
                  icon: Icons.analytics,
                  //value: '3',
                  backgroundColor: Colors.purple,
                  onTap: () => context.go('/dashboard/reports'),
                ),
                DashboardCard(
                  title: 'Settings',
                  icon: Icons.settings,
                  //value: '',
                  backgroundColor: Colors.grey,
                  onTap: () => context.go('/dashboard/settings'),
                ),
                DashboardCard(
                  title: 'Expenses',
                  icon: Icons.money_off,
                  //value: '\$3,450',
                  backgroundColor: Colors.teal,
                  onTap: () => context.go('/dashboard/expenses'),
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