import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  String id;
  String name;
  String email;
  String imageUrl;
  String phoneNumber;
  String location;
  DateTime joinedAt;

  UserModel({
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

  /// From JSON / Firestore
  factory UserModel.fromJson(Map<String, dynamic> json) {
    DateTime parsedDate;

    if (json['joinedAt'] is Timestamp) {
      parsedDate = (json['joinedAt'] as Timestamp).toDate();
    } else if (json['joinedAt'] is String) {
      parsedDate = DateTime.parse(json['joinedAt']);
    } else {
      parsedDate = DateTime.now();
    }

    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      location: json['location'] ?? '',
      joinedAt: parsedDate,
    );
  }

  /// To JSON / Firestore
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'imageUrl': imageUrl,
    'phoneNumber': phoneNumber,
    'location': location,
    'joinedAt': Timestamp.fromDate(joinedAt),
  };

  /// Copy with modification
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? imageUrl,
    String? phoneNumber,
    String? location,
    DateTime? joinedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      location: location ?? this.location,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }

  factory UserModel.empty() => UserModel(
    id: '',
    name: '',
    email: '',
    imageUrl: '',
    phoneNumber: '',
    location: '',
    joinedAt: DateTime.now(),
  );
}
