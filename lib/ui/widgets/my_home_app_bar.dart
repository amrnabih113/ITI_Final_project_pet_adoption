import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/controllers/auth/user_controller.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/models/user_model.dart';

class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = UserController.instance;

    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 30,
          foregroundImage: userController.user.value.imageUrl.contains("http")
              ? NetworkImage(userController.user.value.imageUrl)
              : AssetImage("assets/images/profile.png"),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back, ${userController.user.value != UserModel.empty() ? userController.user.value.name.split(" ")[0] : "Dear"}! 🐾",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              "Let’s find a friend today.",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.grey[700]),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Badge(
            alignment: Alignment.topRight,
            backgroundColor: MyColors.primaryColor,
            isLabelVisible: true,
            label: Text('3'),
            child: const Icon(
              Iconsax.notification5,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
