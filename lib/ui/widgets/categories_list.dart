
import 'package:flutter/material.dart';
import 'package:pet_adoption/core/constants/colors.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
    required this.categories,
    required this.icons,
  });

  final List<String> categories;
  final List<String> icons;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                color: MyColors.white.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(20),

                //shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    icons[i],
                    width: 30,
                    color: MyColors.primaryColor,
                  ),
                  SizedBox(height: 8),
                  Text(
                    categories[i],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
