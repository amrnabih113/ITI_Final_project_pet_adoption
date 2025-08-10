import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_adoption/core/constants/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;
  File? _profileImageFile;

  final _nameController = TextEditingController(text: "Amr Nabih");
  final _bioController = TextEditingController(
    text: "Dog lover & volunteer at Cairo Shelter",
  );
  final _emailController = TextEditingController(text: "amrNabih@email.com");
  final _phoneController = TextEditingController(text: "+20 123 456 7890");
  final _locationController = TextEditingController(text: "Cairo, Egypt");

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (pickedFile != null) {
      setState(() {
        _profileImageFile = File(pickedFile.path);
      });
    }
  }

  Widget _buildStat(String value, String label) {
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
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: MyColors.primaryColor),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: MyColors.darker),
        ),
        subtitle: isEditing
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
    );
  }

  @override
  Widget build(BuildContext context) {
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
          IconButton(
            icon: Icon(
              isEditing ? Iconsax.tick_square : Iconsax.edit,
              color: MyColors.textPrimary,
            ),
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Image
            Stack(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.transparent,
                  backgroundImage: _profileImageFile != null
                      ? FileImage(_profileImageFile!)
                      : const AssetImage('assets/images/profile.png')
                            as ImageProvider,
                ),
                isEditing
                    ? Positioned(
                        bottom: 0,
                        right: 0,

                        child: Container(
                          width: 35,
                          alignment: Alignment.center,
                          padding: EdgeInsets.zero,
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
                            onPressed: _pickImage,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            const SizedBox(height: 12),

            // Name Field
            isEditing
                ? TextField(
                    controller: _nameController,
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
                    _nameController.text,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: MyColors.primaryColor,
                    ),
                  ),

            // Bio Field
            isEditing
                ? TextField(
                    controller: _bioController,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: MyColors.textSecondary),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  )
                : Text(
                    _bioController.text,
                    style: TextStyle(color: MyColors.textSecondary),
                  ),

            const SizedBox(height: 20),

            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStat("3", "Pets Adopted"),
                _buildStat("12", "Favorites"),
                _buildStat("8", "Posts"),
              ],
            ),
            const SizedBox(height: 20),

            // Info Cards
            _buildInfoCard(Iconsax.location, "Location", _locationController),
            _buildInfoCard(Iconsax.call, "Phone", _phoneController),
            _buildInfoCard(Iconsax.sms, "Email", _emailController),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
