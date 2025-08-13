import 'package:flutter/material.dart';
import 'package:pet_adoption/core/utils/shimmer/shimmer.dart';

class GridShimmer extends StatelessWidget {
  const GridShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      scrollDirection: Axis.vertical,
      itemBuilder: (_, __) {
        return MyShimmerEffect(width: 100, height: 80, radius: 10);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 270,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
    );
  }
}
