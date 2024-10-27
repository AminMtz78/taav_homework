import 'package:flutter/material.dart';
import '../controller/splash_page_controller.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashPageController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange.shade200,
          title: Center(
            child: Text(controller.pageTitle),
          ),
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: FlutterLogo(

                size: 200,
              ),
            ),
          ],
        ),
      );
}
