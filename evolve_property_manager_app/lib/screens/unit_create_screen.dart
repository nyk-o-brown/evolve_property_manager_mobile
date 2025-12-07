import 'package:flutter/material.dart';

class UnitCreateScreen extends StatelessWidget {
  final String propertyId;

  const UnitCreateScreen({
    Key? key,
    required this.propertyId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Unit'),
      ),
      body: Center(
        child: Text('Create Unit for Property: $propertyId'),
      ),
    );
  }
}