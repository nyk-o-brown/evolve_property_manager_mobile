import 'package:flutter/material.dart';

class PropertyListScreen extends StatelessWidget {
  const PropertyListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Properties'),
      ),
      body: const Center(
        child: Text('Property List Screen'),
      ),
    );
  }
}