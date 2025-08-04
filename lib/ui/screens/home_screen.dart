import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_adoption/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AuthService.instance;
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => controller.signOut(),
          child: const Text("Go back"),
        ),
      ),
    );
  }
}
