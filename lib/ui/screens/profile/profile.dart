import 'package:flutter/material.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/core/utils/helpers/helper_functions.dart';
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
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          MyBody(
            image: "assets/images/background3.png",
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_buildUserHeader()],
                ),
              ),
            ),
          ),
          _buildBottomSheet(), // Wavy bottom sheet here
        ],
      ),
    );
  }

  Widget _buildUserHeader() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Amr Nabih',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'amrnabih112@gmail.com',
            style: TextStyle(fontSize: 14, color: MyColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ClipPath(
        clipper: TopWaveClipper(),
        child: Container(
          height: MyHelperFunctions.getScreenHeight() * 0.76,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 250, 240),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _settingsCard([
                  _settingTile(Icons.edit_outlined, "Edit Profile"),
                  _settingTile(Icons.calendar_month, "My Appointments"),
                  _settingTile(Icons.pets_outlined, "My pets"),
                  _switchTile(
                    Icons.notifications_outlined,
                    "Notifications",
                    notifications,
                    (val) {
                      setState(() => notifications = val);
                    },
                  ),
                  _switchTile(
                    Icons.location_on_outlined,
                    "Geolocation",
                    geolocation,
                    (val) {
                      setState(() => geolocation = val);
                    },
                  ),
                ]),
                const SizedBox(height: 16),
                _settingsCard([
                  _settingTile(
                    Icons.privacy_tip_outlined,
                    "Settings & Privacy",
                  ),
                  _settingTile(Icons.info_outline, "Developer Info"),
                  _settingTile(Icons.help_outline, "About Us"),
                  _settingTile(Icons.logout, "Log Out", isDestructive: true),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _settingTile(
    IconData icon,
    String title, {
    bool isDestructive = false,
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
      onTap: () {
        // handle navigation here
      },
    );
  }

  Widget _switchTile(
    IconData icon,
    String title,
    bool value,
    void Function(bool) onChanged,
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

  Widget _settingsCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(children: children),
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 40);
    final firstControlPoint = Offset(size.width / 4, 0); // Y=0
    final firstEndPoint = Offset(size.width / 2, 30); // Y=30

    final secondControlPoint = Offset(size.width * 3 / 4, 60); // Y=60
    final secondEndPoint = Offset(size.width, 40); // Y=40

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
