import 'package:get/get.dart';
import '../../../../new_category_project.dart';
import '../../../infrastructure/routes/route_names.dart';

class SplashPageController extends GetxController {
  String pageTitle = 'WELCOME';

  @override
  void onInit() {
    goToLoginPage();
    super.onInit();
  }

  Future goToLoginPage() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.toNamed(RouteNames.login);
      },
    );
  }
}
