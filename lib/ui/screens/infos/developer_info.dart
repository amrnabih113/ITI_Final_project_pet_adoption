import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';

class DeveloperInfoController extends GetxController {
  final name = "Amr Nabih".obs;
  final role = "Flutter Developer".obs;
  final description =
      "I am a passionate Flutter developer focused on crafting clean, responsive, and engaging apps. I love working on projects that solve real-world problems and enjoy experimenting with new tech."
          .obs;

  final skills = [
    "Flutter & Dart",
    "Firebase",
    "REST APIs",
    "GetX State Management",
    "UI/UX Implementation",
    "Backend Integration",
  ].obs;

  final projects = [
    {
      "title": "Budgeting App",
      "desc": "Helps users track spending and savings.",
    },
    {
      "title": "A-Store App",
      "desc": "Enables users to buy and sell products online.",
    },
    {
      "title": "Pet Adoption Platform",
      "desc": "Enables users to adopt and manage pets online.",
    },
  ].obs;
}

class DeveloperInfoPage extends StatelessWidget {
  const DeveloperInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeveloperInfoController());

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("About Developer"),
            const SizedBox(width: 6),
            Icon(Iconsax.code, color: MyColors.primaryBorderDark),
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
            // Header with Name & Role
            Obx(
              () => Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: MyColors.primaryBorderDark,
                    child: Icon(
                      Iconsax.code,
                      color: MyColors.primaryColor,
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.name.value,
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(
                              fontWeight: FontWeight.bold,
                              color: MyColors.primaryColor,
                            ),
                      ),
                      Text(
                        controller.role.value,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(color: MyColors.textSecondary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Description
            Obx(
              () => Text(
                controller.description.value,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 20),

            // Skills Section
            Text(
              "Skills",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Obx(
              () => Wrap(
                spacing: 8,
                runSpacing: 8,
                children: controller.skills
                    .map(
                      (skill) => Chip(
                        label: Text(skill),
                        backgroundColor: MyColors.light,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),

            // Projects Section
            Text(
              "Projects",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Obx(
              () => Column(
                children: controller.projects
                    .map(
                      (project) => Card(
                        color: MyColors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          leading: Icon(
                            Iconsax.activity,
                            color: MyColors.primaryColor,
                          ),
                          title: Text(project["title"]!),
                          subtitle: Text(project["desc"]!),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
