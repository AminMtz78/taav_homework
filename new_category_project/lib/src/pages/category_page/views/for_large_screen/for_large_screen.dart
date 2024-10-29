import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/category_controller.dart';
import '../for_small_screen/for_small_screen.dart';
import '../widgets/category_item.dart';

class ForLargeScreen extends GetView<CategoryController> {
  const ForLargeScreen({super.key});

  @override
  Widget build(BuildContext context) => buildRow();

  Row buildRow() {
    return Row(
      children: [
        const Expanded(
          child: Column(
            children: [Expanded(child: SizedBox())],
          ),
        ),
        Expanded(
          child: Column(
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
          ),
        ),
        const Expanded(
          child: Column(
            children: [
              Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
