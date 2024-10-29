import 'package:get/get.dart';
import '../controller/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    int? userId = int.tryParse(Get.parameters['id']?? '');
    Get.lazyPut(
      () => CategoryController(userId: userId),
    );
  }
}
