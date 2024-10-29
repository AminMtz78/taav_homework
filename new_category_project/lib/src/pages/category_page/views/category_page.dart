import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'for_large_screen/for_large_screen.dart';
import '../controller/category_controller.dart';
import 'for_small_screen/for_small_screen.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(

        appBar: AppBar(
          leading: IconButton(
            onPressed: controller.goBackToLoginPage,
            icon: const Icon(Icons.navigate_before),
          ),
          title: const Text('CATEGORY PAGE'),
          backgroundColor: Colors.orange,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.goToAddCategoryPage,
          child: const Icon(Icons.add),
        ),
        body: _body(),
      );

  Widget _body() {
    return Obx(() {
      if (controller.pageWidth.value < controller.small()) {
        return const ForSmallScreen();
      } else {
        return const ForLargeScreen();
      }
    });
  }
}
