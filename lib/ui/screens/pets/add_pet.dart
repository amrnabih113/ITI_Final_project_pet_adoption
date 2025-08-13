import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:uuid/uuid.dart';
import 'package:pet_adoption/models/pets_model.dart';

class AddPetPage extends StatefulWidget {
  const AddPetPage({super.key});

  @override
  State<AddPetPage> createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  final List<File> _images = [];

  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();
  final _breedController = TextEditingController();
  final _genderController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final List<String> _characteristics = [];
  bool _isVaccinated = false;

  Future<void> _pickImages() async {
    final List<XFile>? pickedFiles = await _picker.pickMultiImage(
      imageQuality: 80,
    );
    if (pickedFiles != null) {
      setState(() {
        _images.addAll(pickedFiles.map((file) => File(file.path)));
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  void _savePet() {
    if (_formKey.currentState!.validate() && _images.isNotEmpty) {
      final pet = PetsModel(
        id: const Uuid().v4(),
        name: _nameController.text.trim(),
        images: _images.map((file) => file.path).toList(),
        type: _typeController.text.trim(),
        weight: double.tryParse(_weightController.text) ?? 0.0,
        age: double.tryParse(_ageController.text) ?? 0.0,
        breed: _breedController.text.trim(),
        gender: _genderController.text.trim(),
        location: _locationController.text.trim(),
        description: _descriptionController.text.trim(),
        characteristics: _characteristics,
        isVaccinated: _isVaccinated,
        isAdopted: false,
        createdBy: "currentUserId", // Replace with actual user ID
        createdAt: DateTime.now(),
      );

      Navigator.pop(context, pet);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill all fields and add at least one image"),
        ),
      );
    }
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: MyColors.primaryColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: MyColors.primaryColor, width: 2),
        ),
      ),
      keyboardType: keyboardType,
      validator: (value) => value!.isEmpty ? "Required" : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.light,
      appBar: AppBar(
        title: Text(
          "Add Pet",
          style: TextStyle(
            color: MyColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Iconsax.tick_square, color: MyColors.success),
            onPressed: _savePet,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Image picker
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
                  child: _images.isEmpty
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
                          itemCount: _images.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      _images[index],
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
              const SizedBox(height: 16),

              _buildTextField(_nameController, "Name"),
              const SizedBox(height: 12),
              _buildTextField(_typeController, "Type"),
              const SizedBox(height: 12),
              _buildTextField(
                _weightController,
                "Weight (kg)",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                _ageController,
                "Age (years)",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              _buildTextField(_breedController, "Breed"),
              const SizedBox(height: 12),
              _buildTextField(_genderController, "Gender"),
              const SizedBox(height: 12),
              _buildTextField(_locationController, "Location"),
              const SizedBox(height: 12),

              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Description",
                  labelStyle: TextStyle(color: MyColors.primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) => value!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 12),

              // Vaccination toggle
              SwitchListTile(
                value: _isVaccinated,
                onChanged: (val) => setState(() => _isVaccinated = val),
                title: Text(
                  "Vaccinated",
                  style: TextStyle(color: MyColors.primaryColor),
                ),
                activeColor: MyColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// TODO