import 'package:flutter/material.dart';
import 'package:pet_adoption/core/constants/sizes.dart';
import 'package:pet_adoption/core/utils/shimmer/shimmer.dart';

class MyCategoryShimmer extends StatelessWidget {
  const MyCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
            const SizedBox(width: MySizes.spaceBetweenItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image placeholder
              MyShimmerEffect(width: 80, height: 80, radius: 10),
            ],
          );
        },
      ),
    );
  }
}
