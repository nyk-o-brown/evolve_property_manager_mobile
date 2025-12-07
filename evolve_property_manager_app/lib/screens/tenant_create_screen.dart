import 'package:flutter/material.dart';

class TenantCreateScreen extends StatelessWidget {
  const TenantCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Tenant'),
      ),
      body: const Center(
        child: Text('Tenant Create Screen'),
      ),
    );
  }
}