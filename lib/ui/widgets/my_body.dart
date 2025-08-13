import 'package:flutter/material.dart';

class MyBody extends StatelessWidget {
  const MyBody({required this.child, super.key, this.image});
  final Widget child;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image == null
            ? Container()
            : Image(
                image: NetworkImage(image!),
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  "assets/images/background3.png",
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
        child,
      ],
    );
  }
}
