import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_category_project/src/pages/sub_category_page/views/widgets/sub_category_item.dart';
import '../controller/sub_category_controller.dart';

class SubCategoryPage extends GetView<SubCategoryController> {
  const SubCategoryPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: controller.onBack,
            icon: const Icon(Icons.navigate_before),
          ),
          backgroundColor: Colors.orange,
          title: const Text('SUB CATEGORY PAGE'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.goToAddSubCategory,
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() => _body()),
        ),
      );

  Widget _body() {
    if (controller.isLoading.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (controller.isRetry.value) {
      return Center(
        child: ElevatedButton(
            onPressed: controller.getSubCategoriesByCategoryId,
            child: const Text('retry')),
      );
    } else {
      return ListView.separated(
          itemBuilder: (_, index) {
            return SubCategoryItem(
                subCategory: controller.subCategories[index]);
          },
          separatorBuilder: (context, index) => const Divider(color: Colors.orange,),
          itemCount: controller.subCategories.length);
    }
  }
}
