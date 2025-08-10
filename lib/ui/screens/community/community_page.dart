import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/ui/screens/community/add_post.dart';
import 'package:pet_adoption/ui/screens/community/comments_page.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = [
      {
        'name': 'Amr Nabih',
        'avatar': 'assets/images/profile.png',
        'text': 'Charlie is the cutest dog in the world! 🐾✨',
        'images': [
          "https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg",
          "https://www.akc.org/wp-content/uploads/2017/11/Golden-Retriever-running-in-grass.jpg",
        ],
        'likes': 128,
        'comments': 12,
        'time': '2 hours ago',
      },
      {
        'name': 'Sara Ahmed',
        'avatar': 'assets/images/profile.png',
        'text': 'Luna is stealing my snacks again 😂',
        'images': [
          'https://www.comfortzone.com/-/media/Project/OneWeb/ComfortZone/Images/Blog/how-can-I-soothe-and-calm-my-cat.jpeg',
          'https://cdn2.thedogapi.com/images/r1f_ll5VX.jpg',
          'https://images.unsplash.com/photo-1517423440428-a5a00ad493e8',
        ],
        'likes': 203,
        'comments': 28,
        'time': '5 hours ago',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        shape: UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.primaryColor),
          borderRadius: BorderRadius.circular(40),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Petstagram',
              style: GoogleFonts.pacifico(
                fontSize: 26,
                color: MyColors.primaryColor,
              ),
            ),
            const SizedBox(width: 4),
            Icon(Iconsax.instagram, color: MyColors.textPrimary),
          ],
        ),
        centerTitle: true,
        actionsPadding: const EdgeInsets.only(right: 10),
        actions: [
          IconButton(
            icon: Icon(Iconsax.add_square, color: Colors.black),
            onPressed: () => Get.to(() => const AddPost()),
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

  Widget _buildInstagramPost(Map<String, dynamic> post, BuildContext context) {
    final List<String> images = List<String>.from(post['images']);

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
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        ),

        const SizedBox(height: 8),

        // Post Images: show horizontally scrollable list if more than one
        SizedBox(
          height: 280,
          child: PageView.builder(
            itemCount: images.length,
            controller: PageController(viewportFraction: 0.9),
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    images[i],
                    width: double.infinity,
                    height: 280,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: progress.expectedTotalBytes != null
                              ? progress.cumulativeBytesLoaded /
                                    progress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey.shade300,
                      alignment: Alignment.center,
                      child: const Icon(Icons.broken_image, size: 60),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 8),

        // Action buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              const Icon(Icons.favorite_border, size: 28),
              const SizedBox(width: 16),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    scrollControlDisabledMaxHeightRatio: 0.9,
                    backgroundColor: MyColors.light,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (context) => const CommentsPage(),
                  );
                },
                child: const Icon(Icons.chat_bubble_outline, size: 26),
              ),
              const SizedBox(width: 16),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: MyColors.light,
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Share Post',
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(color: MyColors.primaryColor),
                            ),
                            const SizedBox(height: 16),
                            ListTile(
                              leading: const Icon(Icons.link),
                              title: const Text('Copy Link'),
                              onTap: () {
                                Navigator.pop(context);
                                // Add your copy link logic here
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.share),
                              title: const Text('Share to...'),
                              onTap: () {
                                Navigator.pop(context);
                                // Add your share logic here
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Icon(Icons.send_outlined, size: 26),
              ),
              const Spacer(),
              const Icon(Icons.bookmark_border, size: 26),
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
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
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
