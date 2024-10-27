import 'package:get/get.dart';
import '../controller/sub_category_controller.dart';

class SubCategoryBinding extends Bindings {
  @override
  void dependencies() {
    int? categoryId = int.tryParse(Get.parameters['categoryId'] ?? '');
    Get.lazyPut(
      () => SubCategoryController(categoryId: categoryId),
    );
  }
}
