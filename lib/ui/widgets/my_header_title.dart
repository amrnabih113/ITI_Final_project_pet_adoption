
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';

class MyHeaderTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool showSeeAll;

  const MyHeaderTitle({
    required this.title,
    this.onPressed,
    this.showSeeAll = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        TextButton(
          onPressed: onPressed,
          child: showSeeAll
              ? Row(
                  spacing: 5,
                  children: [
                    Text(
                      "See all",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: MyColors.primaryColor,
                      ),
                    ),
                    const Icon(
                      Iconsax.arrow_right_3,
                      color: MyColors.primaryColor,
                    ),
                  ],
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }
}