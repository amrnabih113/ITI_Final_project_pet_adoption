
import 'package:get/get.dart';
import 'package:pet_adoption/core/utils/helpers/network_manager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
   
  }
}