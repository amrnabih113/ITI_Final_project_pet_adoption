import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("About Us"),
            const SizedBox(width: 6),
            Icon(Iconsax.pet, color: MyColors.primaryBorderDark),
          ],
        ),
        centerTitle: true,
        shape: const UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.primaryColor),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        titleTextStyle: Theme.of(
          context,
        ).textTheme.headlineMedium!.copyWith(color: MyColors.primaryColor),
        toolbarHeight: 70,

        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Icon / Header
            Center(
              child: Column(
                children: [
                  Icon(Icons.pets, size: 80, color: MyColors.primaryColor),
                  const SizedBox(height: 8),
                  Text(
                    "Pet Adoption App",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: MyColors.darker,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Find your furry friend and join a loving pet community",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: MyColors.darker.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // What you can do
            Text(
              "✨ What You Can Do",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: MyColors.primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            _buildFeatureItem(
              Icons.search,
              "Browse Pets",
              "See real pet listings with images, breeds, and details.",
            ),
            _buildFeatureItem(
              Icons.volunteer_activism,
              "Adopt Easily",
              "Contact shelters and arrange adoptions directly.",
            ),
            _buildFeatureItem(
              Icons.favorite,
              "Save Favorites",
              "Keep track of pets you love.",
            ),
            _buildFeatureItem(
              Icons.add_a_photo,
              "Post Your Pet",
              "Help pets find homes by posting adoption ads.",
            ),
            _buildFeatureItem(
              Icons.people,
              "Community Hub",
              "Share stories, photos, and connect with pet lovers.",
            ),
            _buildFeatureItem(
              Icons.notifications,
              "Push Notifications",
              "Stay updated on new pets and community activity.",
            ),

            const SizedBox(height: 24),

            // Powered By
            Text(
              "🧱 Powered By",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: MyColors.primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            _buildFeatureItem(
              Icons.flutter_dash,
              "Flutter + GetX",
              "Smooth, fast, and reactive experience.",
            ),
            _buildFeatureItem(
              Icons.cloud,
              "Firebase",
              "Auth, real-time data, and media storage.",
            ),
            _buildFeatureItem(
              Icons.design_services,
              "Modern UI",
              "Clean design with animations and icons.",
            ),

            const SizedBox(height: 24),

            // Perfect For
            Text(
              "📱 Perfect For",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: MyColors.primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            _buildFeatureItem(
              Icons.pets,
              "Pet Lovers",
              "Searching for a companion to adopt.",
            ),
            _buildFeatureItem(
              Icons.home,
              "Shelters",
              "Showcasing adoptable pets easily.",
            ),
            _buildFeatureItem(
              Icons.favorite,
              "Animal Advocates",
              "Sharing and enjoying heartwarming pet stories.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: MyColors.primaryColor, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: MyColors.darker,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: MyColors.darker.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
