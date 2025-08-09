import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String id;
  final String name;
  final String image;
  final int petsCount;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.petsCount,
  });

  @override
  List<Object?> get props => [id, name, image, petsCount];

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      petsCount: json['petsCount'] is int
          ? json['petsCount']
          : int.tryParse(json['petsCount']?.toString() ?? '') ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'petsCount': petsCount,
      };
}
