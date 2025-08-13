import 'package:pet_adoption/models/post_model.dart';

final List<PostModel> demoPosts = [
  PostModel(
    id: "post1",
    post: "My lovely dog enjoying the sunshine ☀️🐶",
    images: [
      "https://images.unsplash.com/photo-1558788353-f76d92427f16",
      "https://images.unsplash.com/photo-1601979039935-7b7b1b2a7b4f"
    ],
    userId: "0000",
    likes: [
      PostLike(userId: "0000", postId: "post1"),
    ],
    comments: [
      PostComment(
        id: "comment1",
        comment: "He looks so happy! 🐾",
        userId: "0000",
        postId: "post1",
        likes: [
          PostLike(userId: "0000", postId: "post1"),
        ],
        replies: [],
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
  ),
  PostModel(
    id: "post2",
    post: "Morning walk in Mansoura 🌳🐕",
    images: [
            'https://liwxmmxxsuilzxyvoieh.supabase.co/storage/v1/object/sign/posts/post2.jpeg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV85ZjA2NTNlOC0zZDI1LTRiNjQtYjhlYi0xMmRjNTVkYTYyYmQiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJwb3N0cy9wb3N0Mi5qcGVnIiwiaWF0IjoxNzU1MDEzNDY5LCJleHAiOjE3ODY1NDk0Njl9.gCKW2MkC8PXN-YL8aiHeWp_ctXs1GqXfv3iGh3GlzDA',

    ],
    userId: "0000",
    likes: [
      PostLike(userId: "0000", postId: "post2"),
    ],
    comments: [],
    createdAt: DateTime.now().subtract(const Duration(hours: 10)),
  ),
  PostModel(
    id: "post3",
    post: "Lazy afternoon with my cat 🐱💤",
    images: [
      "https://images.unsplash.com/photo-1592194996308-7b43878e84a6"
    ],
    userId: "0000",
    likes: [],
    comments: [],
    createdAt: DateTime.now().subtract(const Duration(hours: 5)),
  ),
];
