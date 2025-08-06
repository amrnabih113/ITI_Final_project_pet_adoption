import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_adoption/core/constants/colors.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = [
      {
        'name': 'Amr Nabih',
        'avatar': 'assets/images/profile.png',
        'text': 'Charlie is the cutest dog in the world! 🐾✨',
        'image':
            "https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg",
        'likes': 128,
        'comments': 12,
        'time': '2 hours ago',
      },
      {
        'name': 'Sara Ahmed',
        'avatar': 'assets/images/profile.png',
        'text': 'Luna is stealing my snacks again 😂',
        'image':
            'https://www.comfortzone.com/-/media/Project/OneWeb/ComfortZone/Images/Blog/how-can-I-soothe-and-calm-my-cat.jpeg',
        'likes': 203,
        'comments': 28,
        'time': '5 hours ago',
      },
    ];

    return Scaffold(
      backgroundColor: MyColors.light,
      appBar: AppBar(
        toolbarHeight: 70,
        shape: UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.primaryColor),
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: MyColors.light,
        elevation: 0.5,
        title: Text(
          'Petstagram',
          style: GoogleFonts.pacifico(
            fontSize: 26,
            color: MyColors.primaryColor,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(Icons.send_outlined, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) =>
            const Divider(indent: 20, endIndent: 20),
        itemCount: posts.length,
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 80,
          left: 10,
          right: 10,
        ),
        itemBuilder: (context, index) {
          return _buildInstagramPost(posts[index], context);
        },
      ),
    );
  }

  Widget _buildInstagramPost(Map<String, dynamic> post, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post Header
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(post['avatar']),
            backgroundColor: MyColors.primaryColor,
          ),
          title: Text(
            post['name'],
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          trailing: const Icon(Icons.more_vert),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        ),

        // Post Image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            post['image'],
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 8),

        // Action buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: const [
              Icon(Icons.favorite_border, size: 28),
              SizedBox(width: 16),
              Icon(Icons.chat_bubble_outline, size: 26),
              SizedBox(width: 16),
              Icon(Icons.send_outlined, size: 26),
              Spacer(),
              Icon(Icons.bookmark_border, size: 26),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // Likes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '${post['likes']} likes',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
          ),
        ),

        const SizedBox(height: 4),

        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: post['name'],
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const TextSpan(text: '  '),
                TextSpan(text: post['text']),
              ],
            ),
          ),
        ),

        const SizedBox(height: 4),

        // Comments preview
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'View all ${post['comments']} comments',
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: Colors.grey.shade500),
          ),
        ),

        const SizedBox(height: 4),

        // Time
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            post['time'],
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: Colors.grey.shade500),
          ),
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}
