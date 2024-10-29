import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/category_controller.dart';
import '../../models/category_view_model.dart';

class CategoryItem extends GetView<CategoryController> {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final CategoryViewModel category;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListTile(
          title: Text(
            category.title,
          ),
          subtitle: Obx(() => subTitleLoading()),
          trailing: IconButton(
            onPressed: () => controller.goToSubCategory(
              categoryId: category.id,
              title: category.title,
            ),
            icon: const Icon(Icons.navigate_next_sharp),
          ),
        ),
      );

  Widget subTitleLoading() =>
      controller.totalPriceLoadingMap[category.id] ?? false
          ? Transform.scale(
              scale: 0.4,
              child: const CircularProgressIndicator(),
            )
          : Text(
              'id : ${category.id.toString()}    |    total price : ${category.totalPrice}',
            );
}
