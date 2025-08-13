import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/controllers/pets/community_controller.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/models/post_model.dart';
import 'package:pet_adoption/ui/screens/community/add_post.dart';
import 'package:pet_adoption/ui/screens/community/comments_page.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommunityController());

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
            icon: const Icon(Iconsax.add_square, color: Colors.black),
            onPressed: () => Get.to(() => const AddPost()),
          ),
        ],
      ),
      body: Obx(() {
        return ListView.separated(
          separatorBuilder: (context, index) =>
              const Divider(indent: 20, endIndent: 20),
          itemCount: controller.posts.length,
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 80,
            left: 10,
            right: 10,
          ),
          itemBuilder: (context, index) {
            final PostModel post = controller.posts[index];
            return _buildInstagramPost(post, context);
          },
        );
      }),
    );
  }

  Widget _buildInstagramPost(PostModel post, BuildContext context) {
    final List<String> images = post.images;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post Header
        ListTile(
          leading: FutureBuilder(
            future: CommunityController.instance.getPostUser(post.userId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircleAvatar(backgroundColor: Colors.grey);
              }
              if (!snapshot.hasData) {
                return const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person),
                );
              }
              final user = snapshot.data!;
              return CircleAvatar(
                backgroundImage: NetworkImage(user.imageUrl),
                backgroundColor: MyColors.primaryColor,
              );
            },
          ),
          title: FutureBuilder(
            future: CommunityController.instance.getPostUser(post.userId),
            builder: (context, snapshot) {
              return Text(
                snapshot.data?.name ?? "Loading...",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              );
            },
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        ),

        const SizedBox(height: 8),

        // Post Images
        if (images.isNotEmpty)
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
                            color: MyColors.primaryColor,
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
              const Icon(Icons.send_outlined, size: 26),
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
            '${post.likes.length} likes',
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
                  text: post.createdAt.toLocal().toString().split(' ')[0],
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const TextSpan(text: '  '),
                TextSpan(text: post.post ?? ""),
              ],
            ),
          ),
        ),

        const SizedBox(height: 4),

        // Comments preview
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'View all ${post.comments.length} comments',
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
            _formatTimeAgo(post.createdAt),
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: Colors.grey.shade500),
          ),
        ),

        const SizedBox(height: 16),
      ],
    );
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }
}
