import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/sub_category_controller.dart';
import '../../models/sub_category_view_model.dart';

class SubCategoryItem extends GetView<SubCategoryController> {
  const SubCategoryItem({super.key, required this.subCategory});

  final SubCategoryViewModel subCategory;

  @override
  Widget build(BuildContext context) =>
      ListTile(
        title: Text(subCategory.title),
        subtitle: Text('price : ${subCategory.price}'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.edit,
            color: Colors.orange,
          ),
        ),
        trailing: Obx(
              () =>
              IconButton(
                onPressed: () =>
                    controller.onRemoveSubCategory(id: subCategory.id),
                icon: controller.isRemoveSubCategoryMap[subCategory.id] ?? false
                    ? Transform.scale(
                  scale: 0.5,
                  child: const CircularProgressIndicator(),)
                    : const Icon(
              Icons.close,
              color: Colors.red,
              ),
        ),
      )

  ,

  );
}
