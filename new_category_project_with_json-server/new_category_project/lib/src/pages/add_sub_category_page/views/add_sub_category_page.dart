import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../infrastructure/utils.dart';
import '../controller/add_sub_category_controller.dart';

class AddSubCategoryPage extends GetView<AddSubCategoryController> {
  const AddSubCategoryPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('ADD NEW SUB CATEGORY'),
          backgroundColor: Colors.orange,
        ),
        body: Obx(() => _body()),
      );

  Widget _body() {
    if (controller.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    } else if (controller.isRetry.value) {
      return ElevatedButton(
        onPressed: controller.onSubmit,
        child: const Text('retry'),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'enter title', border: OutlineInputBorder()),
                    validator: Utils.validate,
                    controller: controller.titleEditingController,
                  ),
                  Utils.verticalSpacer(32),
                  TextFormField(
                    validator: Utils.validate,
                    decoration: const InputDecoration(
                        labelText: 'enter price', border: OutlineInputBorder()),
                    controller: controller.priceEditingController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                  ),
                ],
              ),
            ),
            Utils.verticalSpacer(32),
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 2,
                  child: RawMaterialButton(
                    fillColor: Colors.orange,
                    onPressed: controller.onSubmit,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: const Text('submit'),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                )
              ],
            )

          ],
        ),
      );
    }
  }
}
