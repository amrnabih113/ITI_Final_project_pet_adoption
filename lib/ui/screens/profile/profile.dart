import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/core/utils/helpers/helper_functions.dart';
import 'package:pet_adoption/services/auth_service.dart';
import 'package:pet_adoption/ui/screens/pets/add_pet.dart';
import 'package:pet_adoption/ui/screens/profile/edit_profile.dart';
import 'package:pet_adoption/ui/widgets/my_body.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool notifications = true;
  bool geolocation = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MyHelperFunctions.getScreenHeight();

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          MyBody(
            image: "assets/images/background3.png",
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: Column(
                  children: [
                    // Creative profile card with image + details + edit button
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          // Profile Image with subtle shadow & border
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: MyColors.primaryColor,
                                width: 2,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 50,
                              backgroundImage: const AssetImage(
                                'assets/images/profile.png',
                              ),
                            ),
                          ),

                          const SizedBox(width: 24),

                          // User info + edit button stacked vertically
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amr Nabih',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'amrnabih112@gmail.com',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: MyColors.textSecondary,
                                  ),
                                ),
                                const SizedBox(height: 16),

                                // Edit profile button - filled, rounded
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: ElevatedButton.icon(
                                    onPressed: () =>
                                        Get.to(() => const ProfilePage()),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: MyColors.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 12,
                                      ),
                                    ),
                                    icon: const Icon(Iconsax.edit_2, size: 18),
                                    label: const Text(
                                      'Edit Profile',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Wavy bottom sheet with settings
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: TopWaveClipper(),
              child: Container(
                height: screenHeight * 0.76,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                decoration: BoxDecoration(color: MyColors.light),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildSettingsCard([
                        _buildSettingTile(
                          Iconsax.add_circle,
                          "Add Pet",
                          onTap: () => Get.to(() => const AddPetPage()),
                        ),
                        _buildSettingTile(
                          Icons.calendar_month,
                          "My Appointments",
                        ),
                        _buildSettingTile(Icons.pets_outlined, "My Pets"),
                        _buildSwitchTile(
                          Icons.notifications_outlined,
                          "Notifications",
                          notifications,
                          (val) => setState(() => notifications = val),
                        ),
                        _buildSwitchTile(
                          Icons.location_on_outlined,
                          "Geolocation",
                          geolocation,
                          (val) => setState(() => geolocation = val),
                        ),
                      ]),
                      const SizedBox(height: 16),
                      _buildSettingsCard([
                        _buildSettingTile(
                          Icons.privacy_tip_outlined,
                          "Settings & Privacy",
                        ),
                        _buildSettingTile(Icons.info_outline, "Developer Info"),
                        _buildSettingTile(Icons.help_outline, "About Us"),
                        _buildSettingTile(
                          Icons.logout,
                          "Log Out",
                          isDestructive: true,
                          onTap: () {
                            AuthService.instance.signOut();
                          },
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSettingTile(
    IconData icon,
    String title, {
    bool isDestructive = false,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive ? Colors.red : MyColors.primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isDestructive ? Colors.red : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap ?? () {},
    );
  }

  Widget _buildSwitchTile(
    IconData icon,
    String title,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      activeColor: MyColors.primaryColor,
      title: Row(
        children: [
          Icon(icon, color: MyColors.primaryColor),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 40);
    final firstControlPoint = Offset(size.width / 4, 0);
    final firstEndPoint = Offset(size.width / 2, 30);
    final secondControlPoint = Offset(size.width * 3 / 4, 60);
    final secondEndPoint = Offset(size.width, 40);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
