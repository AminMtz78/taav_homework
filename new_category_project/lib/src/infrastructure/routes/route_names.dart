import 'route_paths.dart';

class RouteNames {
  static const String splash = RoutePaths.splash;
  static const String login = RoutePaths.login;
  static const String register = '${RoutePaths.login}${RoutePaths.register}';
  static const String homeCategory = RoutePaths.category;
  static const String addCategory =
      '${RoutePaths.category}${RoutePaths.addCategory}';

  static const String subCategory =
      '${RoutePaths.category}${RoutePaths.subCategory}';


  static const String addSubCategory =
      '${RoutePaths.category}${RoutePaths.subCategory}${RoutePaths.addSubCategory}';
}
