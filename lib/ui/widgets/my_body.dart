import 'package:flutter/material.dart';

class MyBody extends StatelessWidget {
  const MyBody({
    required this.child,
    super.key,
    this.image = "assets/images/background4.png",
  });
  final Widget child;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage(image),
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        child,
      ],
    );
  }
}
