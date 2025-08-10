import 'package:equatable/equatable.dart';

class Appointment extends Equatable {
  final String petId;
  final String userId;
  final DateTime appointmentDateTime;
  final String notes;

  const Appointment({
    required this.petId,
    required this.userId,
    required this.appointmentDateTime,
    this.notes = '',
  });

  @override
  List<Object?> get props => [petId, userId, appointmentDateTime, notes];

  Appointment copyWith({
    String? petId,
    String? userId,
    DateTime? appointmentDateTime,
    String? notes,
  }) {
    return Appointment(
      petId: petId ?? this.petId,
      userId: userId ?? this.userId,
      appointmentDateTime: appointmentDateTime ?? this.appointmentDateTime,
      notes: notes ?? this.notes,
    );
  }

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
    petId: json['petId'],
    userId: json['userId'],
    appointmentDateTime: DateTime.parse(json['appointmentDateTime']),
    notes: json['notes'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'petId': petId,
    'userId': userId,
    'appointmentDateTime': appointmentDateTime.toIso8601String(),
    'notes': notes,
  };
}
