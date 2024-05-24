import 'package:cloud_firestore/cloud_firestore.dart';

class DiscussionEntity {
  final String name;
  final String? pictureUrl;
  final DateTime timestamp;
  final String message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiscussionEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          pictureUrl == other.pictureUrl &&
          timestamp == other.timestamp &&
          message == other.message;

  @override
  int get hashCode =>
      name.hashCode ^
      pictureUrl.hashCode ^
      timestamp.hashCode ^
      message.hashCode;

  DiscussionEntity({
    required this.name,
    required this.pictureUrl,
    required this.timestamp,
    required this.message,
  });

  factory DiscussionEntity.fromModel(Map<String, dynamic> map) {
    return DiscussionEntity(
      name: map['name'] as String,
      pictureUrl: map['pictureUrl'] as String?,
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      message: map['message'] as String,
    );
  }
}
