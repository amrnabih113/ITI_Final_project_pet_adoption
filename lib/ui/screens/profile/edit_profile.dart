import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/controllers/auth/user_controller.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/models/user_model.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final UserController userController = UserController.instance;
  final RxBool isEditing = false.obs;
  final Rx<File?> profileImageFile = Rx<File?>(null);

  Widget _buildStat(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: MyColors.primaryColor,
          ),
        ),
        Text(label, style: TextStyle(color: MyColors.textSecondary)),
      ],
    );
  }

  Widget _buildInfoCard(
    IconData icon,
    String title,
    TextEditingController controller,
  ) {
    return Obx(
      () => Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: Icon(icon, color: MyColors.primaryColor),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: MyColors.darker,
            ),
          ),
          subtitle: isEditing.value
              ? TextField(
                  controller: controller,
                  style: TextStyle(color: MyColors.textPrimary),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                  ),
                )
              : Text(
                  controller.text,
                  style: TextStyle(color: MyColors.textPrimary),
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(
      text: userController.user.value.name,
    );
    final emailController = TextEditingController(
      text: userController.user.value.email,
    );
    final bioController = TextEditingController(
      text: "Dog lover & volunteer at Cairo Shelter",
    );
    final phoneController = TextEditingController(
      text: userController.user.value.phoneNumber,
    );
    final locationController = TextEditingController(
      text: userController.user.value.location,
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "My Profile",
              style: TextStyle(
                color: MyColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Icon(Iconsax.user, color: MyColors.textPrimary),
          ],
        ),
        centerTitle: true,
        shape: UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.primaryColor),
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        actions: [
          Obx(
            () => IconButton(
              icon: Icon(
                isEditing.value ? Iconsax.tick_square : Iconsax.edit,
                color: MyColors.textPrimary,
              ),
              onPressed: () {
                isEditing.toggle();
                if (!isEditing.value) {
                  UserModel userModel = userController.user.value.copyWith(
                    name: nameController.text,
                    email: emailController.text,
                    phoneNumber: phoneController.text,
                    location: locationController.text,
                  );
                  userController.updateUser(userModel);
                }
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Image
            Obx(
              () => Stack(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.transparent,
                    backgroundImage: profileImageFile.value != null
                        ? FileImage(profileImageFile.value!)
                        : (userController.user.value.imageUrl.isNotEmpty
                                  ? NetworkImage(
                                      userController.user.value.imageUrl,
                                    )
                                  : const AssetImage(
                                      'assets/images/profile.png',
                                    ))
                              as ImageProvider,
                  ),
                  if (isEditing.value)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MyColors.white,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Iconsax.edit_2,
                            color: MyColors.primaryColor,
                            size: 20,
                          ),
                          onPressed: () async {
                            userController.uploadUserProfilePicture();
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Name Field
            Obx(
              () => isEditing.value
                  ? TextField(
                      controller: nameController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: MyColors.primaryColor,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                    )
                  : Text(
                      nameController.text,
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(
                            fontWeight: FontWeight.bold,
                            color: MyColors.primaryColor,
                          ),
                    ),
            ),

            // Bio Field
            Obx(
              () => isEditing.value
                  ? TextField(
                      controller: bioController,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: MyColors.textSecondary),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                    )
                  : Text(
                      bioController.text,
                      style: TextStyle(color: MyColors.textSecondary),
                    ),
            ),

            const SizedBox(height: 20),

            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStat(context, "3", "Pets Adopted"),
                _buildStat(context, "12", "Favorites"),
                _buildStat(context, "8", "Posts"),
              ],
            ),
            const SizedBox(height: 20),

            // Info Cards
            _buildInfoCard(Iconsax.location, "Location", locationController),
            _buildInfoCard(Iconsax.call, "Phone", phoneController),
            _buildInfoCard(Iconsax.sms, "Email", emailController),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
