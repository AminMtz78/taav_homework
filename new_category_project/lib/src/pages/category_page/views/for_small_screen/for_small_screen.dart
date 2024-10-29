import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/category_controller.dart';
import '../widgets/category_item.dart';

class ForSmallScreen extends GetView<CategoryController> {
  const ForSmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.isRetry.value) {
        return Center(
          child: ElevatedButton(
            onPressed: controller.getCategory,
            child: const Text('retry'),
          ),
        );
      } else {
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (_, index) {
                    return CategoryItem(
                      category: controller.categories[index],
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Divider(
                        color: Colors.orange,
                        thickness: 2,
                      ),
                    );
                  },
                  itemCount: controller.categories.length),
            ),
          ],
        );
      }
    });
  }
}
