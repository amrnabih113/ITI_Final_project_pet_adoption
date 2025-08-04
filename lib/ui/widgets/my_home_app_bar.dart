
import 'package:flutter/material.dart';

class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 30,
          foregroundImage: AssetImage('assets/images/profile.png'),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back, Amr! 🐾",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Let’s find a friend today.",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
