import 'package:get/get.dart';
import '../controller/add_sub_category_controller.dart';

class AddSubCategoryBinding extends Bindings {
  @override
  void dependencies() {
    int? categoryId = int.tryParse(Get.parameters['categoryId'] ?? '');
    Get.lazyPut(() => AddSubCategoryController(categoryId: categoryId));
  }
}
