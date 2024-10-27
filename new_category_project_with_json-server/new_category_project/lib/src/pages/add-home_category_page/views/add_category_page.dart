import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/utils.dart';
import '../controller/add_category_controller.dart';

class AddCategoryPage extends GetView<AddCategoryController> {
  const AddCategoryPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('ADD NEW CATEGORY'),
        ),
        body: Padding(
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
                          labelText: 'please enter category title'),
                      validator: Utils.validate,
                      controller: controller.titleEditingController,
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
              )
            ],
          ),
        ),
      );
}
