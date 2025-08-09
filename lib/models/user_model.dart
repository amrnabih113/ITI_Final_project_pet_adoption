import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String imageUrl;
  final String phoneNumber;
  final String location;
  final DateTime joinedAt;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.phoneNumber,
    required this.location,
    required this.joinedAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    imageUrl,
    phoneNumber,
    location,
    joinedAt,
  ];

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    imageUrl: json['imageUrl'],
    phoneNumber: json['phoneNumber'],
    location: json['location'],
    joinedAt: DateTime.parse(json['joinedAt']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'imageUrl': imageUrl,
    'phoneNumber': phoneNumber,
    'location': location,
    'joinedAt': joinedAt.toIso8601String(),
  };

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? imageUrl,
    String? phoneNumber,
    String? location,
    DateTime? joinedAt,
  }) => UserModel(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    imageUrl: imageUrl ?? this.imageUrl,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    location: location ?? this.location,
    joinedAt: joinedAt ?? this.joinedAt,
  );
}
