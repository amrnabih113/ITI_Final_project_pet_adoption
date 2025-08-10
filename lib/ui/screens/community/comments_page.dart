import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/core/constants/colors.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final Set<int> _expandedComments = {};
  final TextEditingController _commentController = TextEditingController();

  // Just a dummy function for sending a comment
  void _sendComment() {
    final text = _commentController.text.trim();
    if (text.isNotEmpty) {
      // Here you would handle sending the comment, e.g. call API or update state
      print('Send comment: $text');
      _commentController.clear();
      FocusScope.of(context).unfocus(); // close keyboard
      // Optionally show a toast/snackbar or update UI
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: MyColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Row with title and close button
          Row(
            children: [
              Text(
                "Comments",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: MyColors.primaryColor,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.close, size: 28),
                splashRadius: 24,
                tooltip: 'Close',
              ),
            ],
          ),

          Divider(color: Colors.grey.shade300, thickness: 1),

          const SizedBox(height: 8),

          // Comment list takes remaining space but leaves room for input field
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              separatorBuilder: (_, __) => Divider(
                color: Colors.grey.shade200,
                thickness: 1,
                indent: 72,
                endIndent: 16,
              ),
              itemBuilder: (context, index) {
                final isExpanded = _expandedComments.contains(index);
                final likesCount = 5 + index;
                final repliesCount = 2 + (index % 3);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: MyColors.primaryColor.withOpacity(0.1),
                        backgroundImage: const AssetImage(
                          'assets/images/profile.png',
                        ),
                      ),
                      title: Row(
                        children: [
                          Text(
                            'User ${index + 1}',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Text(
                            '2h ago',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        'This is a sample comment number ${index + 1}.',
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.favorite_border,
                                color: Colors.grey.shade400,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                likesCount.toString(),
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Icon(
                                Icons.comment_outlined,
                                color: Colors.grey.shade400,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                repliesCount.toString(),
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isExpanded) {
                                  _expandedComments.remove(index);
                                } else {
                                  _expandedComments.add(index);
                                }
                              });
                            },
                            child: Text(
                              isExpanded ? "Hide replies" : "View replies",
                              style: TextStyle(
                                color: MyColors.primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Replies section (expandable)
                    if (isExpanded)
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 72,
                          top: 8,
                          bottom: 12,
                        ),
                        child: Column(
                          children: List.generate(
                            repliesCount,
                            (replyIndex) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundColor: MyColors.primaryColor
                                        .withOpacity(0.1),
                                    backgroundImage: const AssetImage(
                                      'assets/images/profile.png',
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: MyColors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade200,
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            color: Colors.grey.shade800,
                                            fontSize: 13,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  'User ${index + 1}.${replyIndex + 1} ',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'This is a reply to comment ${index + 1}.',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),

          // New comment input field with send button
          const SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      minLines: 1,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Add a comment...",
                        filled: true,
                        fillColor: MyColors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Material(
                    color: MyColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: _sendComment,
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Icon(Icons.send, color: Colors.white, size: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
