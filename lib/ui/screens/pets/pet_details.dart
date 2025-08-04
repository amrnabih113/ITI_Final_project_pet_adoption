import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/ui/widgets/Pet_section_title.dart';
import 'package:pet_adoption/ui/widgets/pet_info_ship.dart';

class PetDetails extends StatelessWidget {
  const PetDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomSheet(
        backgroundColor: Colors.white70,
        onClosing: () {},
        enableDrag: false,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        builder: (context) => Container(
          height: 500,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name + Gender
                Row(
                  spacing: 8,
                  children: const [
                    Text(
                      'Rocky',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Icon(Icons.male, color: MyColors.accent, size: 25),
                  ],
                ),
                const SizedBox(height: 5),

                // Location
                Row(
                  children: const [
                    Icon(Iconsax.location, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      "Berlin (25 km away)",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Info Chips
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    InfoChip(label: "Samoyed", sub: "Breed"),
                    InfoChip(label: "Golden", sub: "Color"),
                    InfoChip(label: "20 Kg", sub: "Weight"),
                    InfoChip(label: "3 y/o", sub: "Age"),
                  ],
                ),
                const SizedBox(height: 20),

                // Health
                SectionTitle(title: "Health", icon: Iconsax.health),
                const SizedBox(height: 6),
                const Text("• Fully vaccinated"),
                const Text("• Neutered"),

                const SizedBox(height: 20),
                const CharacteristicsSection(
                  traits: [
                    "Good with kids",
                    "Playful and athletic",
                    "Requires daily outdoor activity",
                    "Very empathetic",
                    "Good with other dogs",
                  ],
                ),

                const SizedBox(height: 30),

                // Adopt Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Adopt Me",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          // Background Image
          Image.network(
            "https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg",
            width: double.infinity,
            height: 500,
            fit: BoxFit.cover,
          ),

          // Top buttons
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _iconButton(
                    iconColor: MyColors.primaryColor,
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                  _iconButton(
                    icon: Iconsax.heart,
                    iconColor: MyColors.primaryColor,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable Icon Button
Widget _iconButton({
  required IconData icon,
  Color iconColor = Colors.black,
  required VoidCallback onTap,
}) {
  return CircleAvatar(
    backgroundColor: Colors.white,
    child: IconButton(
      icon: Icon(icon, color: iconColor),
      onPressed: onTap,
    ),
  );
}

class CharacteristicsSection extends StatelessWidget {
  final List<String> traits;

  const CharacteristicsSection({super.key, required this.traits});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: "Characteristics", icon: Iconsax.designtools),
        const SizedBox(height: 6),
        ...traits.map((trait) => Text("• $trait")),
      ],
    );
  }
}
