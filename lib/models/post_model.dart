import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

/// -----------------------------
/// POST MODEL
/// -----------------------------
class PostModel extends Equatable {
  final String id;
  final String post;
  final List<String> images;
  final String userId;
  final List<PostLike> likes;
  final List<PostComment> comments;
  final DateTime createdAt;

  const PostModel({
    required this.id,
    required this.post,
    required this.images,
    required this.userId,
    this.likes = const [],
    this.comments = const [],
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    post,
    images,
    userId,
    likes,
    comments,
    createdAt,
  ];

  factory PostModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return PostModel(
      id: id ?? json['id'] ?? '',
      post: json['post'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      userId: json['userId'] ?? '',
      likes: (json['likes'] as List? ?? [])
          .map((like) => PostLike.fromJson(like))
          .toList(),
      comments: (json['comments'] as List? ?? [])
          .map((c) => PostComment.fromJson(c))
          .toList(),
      createdAt: _parseDateTime(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() => {
    'post': post,
    'images': images,
    'userId': userId,
    'likes': likes.map((like) => like.toJson()).toList(),
    'comments': comments.map((comment) => comment.toJson()).toList(),
    'createdAt': Timestamp.fromDate(createdAt),
  };

  PostModel copyWith({
    String? id,
    String? post,
    List<String>? images,
    String? userId,
    List<PostLike>? likes,
    List<PostComment>? comments,
    DateTime? createdAt,
  }) {
    return PostModel(
      id: id ?? this.id,
      post: post ?? this.post,
      images: images ?? this.images,
      userId: userId ?? this.userId,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

/// -----------------------------
/// COMMENT MODEL
/// -----------------------------
class PostComment extends Equatable {
  final String id;
  final String comment;
  final String userId;
  final List<PostComment> replies;
  final List<PostLike> likes;
  final String postId;
  final DateTime createdAt;

  const PostComment({
    required this.id,
    required this.comment,
    required this.userId,
    this.replies = const [],
    this.likes = const [],
    required this.postId,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    comment,
    userId,
    replies,
    likes,
    postId,
    createdAt,
  ];

  factory PostComment.fromJson(Map<String, dynamic> json) {
    return PostComment(
      id: json['id'] ?? '',
      comment: json['comment'] ?? '',
      userId: json['userId'] ?? '',
      replies: (json['replies'] as List? ?? [])
          .map((reply) => PostComment.fromJson(reply))
          .toList(),
      likes: (json['likes'] as List? ?? [])
          .map((like) => PostLike.fromJson(like))
          .toList(),
      postId: json['postId'] ?? '',
      createdAt: _parseDateTime(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'comment': comment,
    'userId': userId,
    'replies': replies.map((reply) => reply.toJson()).toList(),
    'postId': postId,
    'likes': likes.map((like) => like.toJson()).toList(),
    'createdAt': Timestamp.fromDate(createdAt),
  };

  PostComment copyWith({
    String? id,
    String? comment,
    String? userId,
    List<PostComment>? replies,
    List<PostLike>? likes,
    String? postId,
    DateTime? createdAt,
  }) {
    return PostComment(
      id: id ?? this.id,
      comment: comment ?? this.comment,
      userId: userId ?? this.userId,
      replies: replies ?? this.replies,
      likes: likes ?? this.likes,
      postId: postId ?? this.postId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

/// -----------------------------
/// LIKE MODEL
/// -----------------------------
class PostLike extends Equatable {
  final String userId;
  final String postId;

  const PostLike({required this.userId, required this.postId});

  @override
  List<Object?> get props => [userId, postId];

  factory PostLike.fromJson(Map<String, dynamic> json) {
    return PostLike(userId: json['userId'] ?? '', postId: json['postId'] ?? '');
  }

  Map<String, dynamic> toJson() => {'userId': userId, 'postId': postId};

  PostLike copyWith({String? userId, String? postId}) {
    return PostLike(
      userId: userId ?? this.userId,
      postId: postId ?? this.postId,
    );
  }
}

/// -----------------------------
/// DATETIME PARSER
/// -----------------------------
DateTime _parseDateTime(dynamic value) {
  if (value == null) return DateTime.now();
  if (value is Timestamp) return value.toDate();
  if (value is String) {
    final parsed = DateTime.tryParse(value);
    return parsed ?? DateTime.now();
  }
  return DateTime.now();
}
