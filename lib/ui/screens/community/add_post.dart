import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/core/utils/popups/loaders.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final TextEditingController _postController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  final List<File> _pickedImages = [];

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  Future<void> _pickImages() async {
    // Use pickMultiImage() for multiple images
    final List<XFile>? pickedFiles = await _picker.pickMultiImage(
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 80,
    );

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      setState(() {
        // Add newly picked images to existing list
        _pickedImages.addAll(pickedFiles.map((xfile) => File(xfile.path)));
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _pickedImages.removeAt(index);
    });
  }

  void _submitPost() {
    final content = _postController.text.trim();

    if (content.isEmpty && _pickedImages.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add text or pick at least one image'),
        ),
      );
      return;
    }

    _postController.clear();
    setState(() {
      _pickedImages.clear();
    });

    MyLoaders.customToast(message: "Post added successfully");

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Post",
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: MyColors.primaryColor),
        ),
        iconTheme: IconThemeData(color: MyColors.primaryColor),
        elevation: 1,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Display picked images horizontally with remove buttons
              GestureDetector(
                onTap: _pickImages,
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: MyColors.light.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: MyColors.primaryColor),
                  ),
                  child: _pickedImages.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Iconsax.image,
                              size: 40,
                              color: MyColors.primaryColor,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Tap to add images",
                              style: TextStyle(color: MyColors.primaryColor),
                            ),
                          ],
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _pickedImages.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      _pickedImages[index],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: GestureDetector(
                                      onTap: () => _removeImage(index),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black.withValues(
                                            alpha: 0.5,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        padding: const EdgeInsets.all(6),
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ),
              SizedBox(height: 20),
              // Post content input
              TextField(
                controller: _postController,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "What's on your mind? ....",
                  filled: true,
                  fillColor: MyColors.light,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),

              const SizedBox(height: 16),

              // Submit post button
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: _submitPost,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Post",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
