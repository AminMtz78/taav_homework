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
          subtitle: Text(
            'id : ${category.id.toString()}',
          ),
          trailing: IconButton(
            onPressed: () =>
                controller.goToSubCategory(categoryId: category.id),
            icon: const Icon(Icons.navigate_next_sharp),
          ),
        ),
      );
}
