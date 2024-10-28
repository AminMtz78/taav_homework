import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_category_project/new_category_project.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.splash,
        getPages: RoutePages.pages,
      );
}
