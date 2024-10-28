import 'package:get/get.dart';
import '../controller/add_category_controller.dart';

class AddCategoryBinding extends Bindings {
  @override
  void dependencies() {
    int? userId = int.tryParse(Get.parameters['userId'] ?? '');
    Get.lazyPut(
      () => AddCategoryController(userId: userId),
    );
  }
}
