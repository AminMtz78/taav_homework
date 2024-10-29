import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/utils.dart';
import '../controller/login_page_controller.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: null,
        // bottom: ,
        backgroundColor: Colors.orange,
        title: Center(child: Text(controller.title)),
      ),
      body: Obx(() => isLoadingAndRetry()));

  Widget isLoadingAndRetry() {
    if (controller.isLoading.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (controller.isRetry.value) {
      return Center(
        child: ElevatedButton(
          onPressed: controller.getUsers,
          child: const Text('RETRY'),
        ),
      );
    }
    return _body();
  }

  Widget _body() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TabBar(
                    // onTap: (value) => controller.changeTab(value),
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
                  TextFormField(
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
                  Utils.verticalSpacer(24),
                  TextFormField(
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
                  Utils.verticalSpacer(24),
                  Row(
                    children: [
                      Expanded(
                        child: RawMaterialButton(
                          elevation: 6,
                          fillColor: Colors.orangeAccent,
                          onPressed: controller.onLogin,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: const Text(
                            'login',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: RawMaterialButton(
                          elevation: 6,
                          fillColor: Colors.orangeAccent,
                          onPressed: controller.goToRegisterPage,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: const Text(
                            'register',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Utils.verticalSpacer(24),
            // Obx(
            //   () => Center(
            //     child: isLoadingAndRetry(),
            //   ),
            // ),
          ],
        ),
      );
}
