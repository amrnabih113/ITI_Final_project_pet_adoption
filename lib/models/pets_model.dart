import 'package:equatable/equatable.dart';

class PetsModel extends Equatable {
  final String id;
  final String name;
  final List<String> images;
  final String type;
  final double weight;
  final double age;
  final String breed;
  final String gender;
  final String location;
  final String description;
  final List<String> characteristics;
  final bool isVaccinated;
  final bool isAdopted;
  final String? createdBy;
  final DateTime createdAt;

  const PetsModel({
    required this.id,
    required this.name,
    required this.images,
    required this.type,
    required this.weight,
    required this.age,
    required this.breed,
    required this.gender,
    required this.location,
    required this.description,
    required this.characteristics,
    required this.isVaccinated,
    this.isAdopted = false,
    this.createdBy,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        images,
        type,
        weight,
        age,
        breed,
        gender,
        location,
        description,
        characteristics,
        isVaccinated,
        createdBy,
        createdAt,
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'images': images,
      'type': type,
      'weight': weight,
      'age': age,
      'breed': breed,
      'gender': gender,
      'location': location,
      'description': description,
      'characteristics': characteristics,
      'isVaccinated': isVaccinated,
      'isAdopted': isAdopted,
      'createdBy': createdBy,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory PetsModel.fromJson(Map<String, dynamic> json) {
    return PetsModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      type: json['type'] ?? '',
      weight: (json['weight'] is num)
          ? (json['weight'] as num).toDouble()
          : double.tryParse(json['weight']?.toString() ?? '0') ?? 0.0,
      age: (json['age'] is num)
          ? (json['age'] as num).toDouble()
          : double.tryParse(json['age']?.toString() ?? '0') ?? 0.0,
      breed: json['breed'] ?? '',
      gender: json['gender'] ?? '',
      location: json['location'] ?? '',
      description: json['description'] ?? '',
      characteristics: List<String>.from(json['characteristics'] ?? []),
      isVaccinated: json['isVaccinated'] is bool
          ? json['isVaccinated']
          : json['isVaccinated'].toString().toLowerCase() == 'true',
      isAdopted: json['isAdopted'] is bool ? json['isAdopted'] : false,
      createdBy: json['createdBy'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
    );
  }


  PetsModel copyWith({
    String? id,
    String? name,
    List<String>? images,
    String? type,
    double? weight,
    double? age,
    String? breed,
    String? gender,
    String? location,
    String? description,
    List<String>? characteristics,
    bool? isVaccinated,
    bool? isAdopted,
    String? createdBy,
    DateTime? createdAt,
  }) {
    return PetsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      images: images ?? this.images,
      type: type ?? this.type,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      breed: breed ?? this.breed,
      gender: gender ?? this.gender,
      location: location ?? this.location,
      description: description ?? this.description,
      characteristics: characteristics ?? this.characteristics,
      isVaccinated: isVaccinated ?? this.isVaccinated,
      isAdopted: isAdopted ?? this.isAdopted,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
    );
  }

}
