import '../../pages/add_sub_category_page/commons/add_sub_category_binding.dart';

import '../../pages/add_sub_category_page/views/add_sub_category_page.dart';

import '../../pages/sub_category_page/commons/sub_category_binding.dart';
import '../../pages/sub_category_page/views/sub_category_page.dart';

import '../../pages/add-home_category_page/commons/add_category_binding.dart';
import '../../pages/add-home_category_page/views/add_category_page.dart';

import '../../pages/category_page/commons/category_binding.dart';
import '../../pages/category_page/views/category_page.dart';
import '../../pages/register_page/commons/register_page_binding.dart';
import '../../pages/register_page/views/register_page.dart';

import '../../pages/login_page/commons/login_page_binding.dart';
import '../../pages/login_page/views/login_page.dart';
import '../../pages/splash_page/commons/splash_page_binding.dart';
import '../../pages/splash_page/views/splash_page.dart';
import 'package:get/get.dart';
import 'route_paths.dart';

class RoutePages {
  static List<GetPage> pages = [
    GetPage(
      name: RoutePaths.splash,
      page: () => const SplashPage(),
      binding: SplashPageBinding(),
    ),
    GetPage(
      name: RoutePaths.login,
      page: () => const LoginPage(),
      binding: LoginPageBinding(),
      children: [
        GetPage(
          name: RoutePaths.register,
          page: () => const RegisterPage(),
          binding: RegisterPageBinding(),
        ),
      ],
    ),
    GetPage(
      name: (RoutePaths.category),
      page: () => const CategoryPage(),
      binding: CategoryBinding(),
      children: [
        GetPage(
          name: RoutePaths.addCategory,
          page: () => const AddCategoryPage(),
          binding: AddCategoryBinding(),
        ),
        GetPage(
          name: RoutePaths.subCategory,
          page: () => const SubCategoryPage(),
          binding: SubCategoryBinding(),
          children: [
            GetPage(
              name: RoutePaths.addSubCategory,
              page: () => const AddSubCategoryPage(),
              binding: AddSubCategoryBinding()
            ),
          ],
        ),
      ],
    )
  ];
}
