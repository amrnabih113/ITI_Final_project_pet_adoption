import 'package:equatable/equatable.dart';

class AdoptionRequist extends Equatable {
  final String petId;
  final String userId;
  final String status;
  final DateTime adoptedAt;

  const AdoptionRequist({
    required this.petId,
    required this.userId,
    required this.status,
    required this.adoptedAt,
  });
  
  @override
  List<Object?> get props => [petId, userId, status, adoptedAt];

  AdoptionRequist copyWith({
    String? petId,
    String? userId,
    String? status,
    DateTime? adoptedAt,
  }) {
    return AdoptionRequist(
      petId: petId ?? this.petId,
      userId: userId ?? this.userId,
      status: status ?? this.status,
      adoptedAt: adoptedAt ?? this.adoptedAt,
    ); 
  }

  factory AdoptionRequist.fromJson(Map<String, dynamic> json) => AdoptionRequist(
    petId: json['petId'],
    userId: json['userId'],
    status: json['status'],
    adoptedAt: DateTime.parse(json['adoptedAt']),
  );

  Map<String, dynamic> toJson() => {
    'petId': petId,
    'userId': userId,
    'status': status,
    'adoptedAt': adoptedAt.toIso8601String(),
  };

}
