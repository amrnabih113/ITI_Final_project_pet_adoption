import 'package:get/get.dart';
import 'package:pet_adoption/core/utils/popups/loaders.dart';
import 'package:pet_adoption/models/post_model.dart';
import 'package:pet_adoption/models/user_model.dart';
import 'package:pet_adoption/services/posts_service.dart';
import 'package:pet_adoption/services/user_service.dart';

class CommunityController extends GetxController {
  static CommunityController get instance => Get.find();

  final PostService postService = Get.put(PostService());
  final UserService userService = Get.put(UserService());

  RxList<PostModel> posts = <PostModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    posts.bindStream(getAllPosts());
  }

  Stream<List<PostModel>> getAllPosts() {
    return postService.getAllPosts();
  }

  Future<UserModel> getPostUser(String userId) async {
    try {
      return await userService.getUserById(userId);
    } catch (e) {
      MyLoaders.errorSnackBar(title: "Error", message: "Something went wrong");
      rethrow;
    }
  }
}
