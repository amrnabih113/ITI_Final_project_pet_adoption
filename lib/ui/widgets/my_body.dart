import 'package:flutter/material.dart';

class MyBody extends StatelessWidget {
  const MyBody({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage("assets/images/background4.png"),
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        child,
      ],
    );
  }
}
