import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_category_project/src/infrastructure/utils.dart';
import '../controller/register_page_controller.dart';

class RegisterPage extends GetView<RegisterPageController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(controller.title),
          backgroundColor: Colors.orange,
        ),
        body: Obx(() => _scaffoldBody()),
      );

  Widget _body() => Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TabBar(
                    // onTap: (index) {
                    //   controller.changeTab(
                    //     index,
                    //   );
                    // },
                    labelColor: Colors.black,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    indicatorColor: Colors.deepOrange,
                    controller: controller.tabController,
                    tabs: controller.tabs,
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            Utils.verticalSpacer(24),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  ColoredBox(
                    color: Colors.orange.withOpacity(0.3),
                    child: TextFormField(
                      validator: Utils.validate,
                      controller: controller.usernameEditingController,
                      decoration: const InputDecoration(
                        labelText: 'please enter username',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Utils.verticalSpacer(24),
                  ColoredBox(
                    color: Colors.orange.withOpacity(0.3),
                    child: TextFormField(
                      obscureText: true,
                      validator: Utils.validate,
                      controller: controller.passwordEditingController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'please enter password',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          )),
                    ),
                  ),
                  Utils.verticalSpacer(24),
                  Row(
                    children: [
                      Expanded(
                        child: RawMaterialButton(
                          elevation: 6,
                          fillColor: Colors.orangeAccent,
                          onPressed: controller.onSubmit,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: const Text(
                            'submit',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox())
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );

  Widget _scaffoldBody() {
    if (controller.isLoading.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (controller.onSubmitLoading.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (controller.isRetry.value) {
      return Center(
        child: ElevatedButton(
          onPressed: controller.onSubmit,
          child: const Text('RETRY'),
        ),
      );
    } else {
      return _body();
    }
  }
}
