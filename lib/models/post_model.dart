import 'package:equatable/equatable.dart';

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
    required this.likes,
    required this.comments,
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
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
    'post': post,
    'images': images,
    'userId': userId,
    'likes': likes.map((like) => like.toJson()).toList(),
    'comments': comments.map((comment) => comment.toJson()).toList(),
    'createdAt': createdAt,
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

class PostComment extends Equatable {
  final String id;
  final String comment;
  final String userId;
  final List<PostComment> replies;
  final String postId;
  final DateTime createdAt;

  const PostComment({
    required this.id,
    required this.comment,
    required this.userId,
    required this.replies,
    required this.postId,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, comment, userId, replies, postId, createdAt];

  factory PostComment.fromJson(Map<String, dynamic> json) {
    return PostComment(
      id: json['id'],
      comment: json['comment'],
      userId: json['userId'],
      replies: List<PostComment>.from(
        json['replies'].map((reply) => PostComment.fromJson(reply)),
      ),
      postId: json['postId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'comment': comment,
    'userId': userId,
    'replies': replies.map((reply) => reply.toJson()).toList(),
    'postId': postId,
    'createdAt': createdAt.toIso8601String(),
  };

  PostComment copyWith({
    String? id,
    String? comment,
    String? userId,
    List<PostComment>? replies,
    String? postId,
    DateTime? createdAt,
  }) {
    return PostComment(
      id: id ?? this.id,
      comment: comment ?? this.comment,
      userId: userId ?? this.userId,
      replies: replies ?? this.replies,
      postId: postId ?? this.postId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class PostLike extends Equatable {
  
  final String userId;
  final String postId;

  const PostLike({
  
    required this.userId,
    required this.postId,
  });

  @override
  List<Object?> get props => [ userId, postId];

  factory PostLike.fromJson(Map<String, dynamic> json) {
    return PostLike(
      userId: json['userId'],
      postId: json['postId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'postId': postId,
  };

  PostLike copyWith({String? id, String? userId, String? postId}) {
    return PostLike(
      userId: userId ?? this.userId,
      postId: postId ?? this.postId,
    );
  }
}
