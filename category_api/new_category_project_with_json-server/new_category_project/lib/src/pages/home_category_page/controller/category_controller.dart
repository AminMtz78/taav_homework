import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import '../../../../new_category_project.dart';
import '../models/category_view_model.dart';
import '../../../infrastructure/utils.dart';
import '../repository/category_repository.dart';

class CategoryController extends GetxController {
  final int? userId;

  CategoryController({required this.userId});

  final CategoryRepository _repository = CategoryRepository();
  RxList<CategoryViewModel> categories = <CategoryViewModel>[].obs;
  RxBool isLoading = false.obs, isRetry = false.obs;

  @override
  void onInit() {
    if (userId != null) {
      getCategory();
    } else {
      Utils.mySnackBar(error: 'error', message: 'login error');
    }
    super.onInit();
  }

  Future<void> getCategory() async {
    isLoading.value = true;
    isRetry.value = false;
    Either<String, List<CategoryViewModel>> resultOrException =
        await _repository.getHomeCategories();
    isLoading.value = false;

    resultOrException.fold(
      (exception) {
        Utils.mySnackBar(error: 'error', message: exception);
        isRetry.value = true;
      },
      (repositoryCategoryList) {
        isLoading.value = false;
        isRetry.value = false;
        print('user id => $userId');
        for (CategoryViewModel item in repositoryCategoryList) {
          print(item.id);
          if (item.userId == userId) {
            categories.add(item);
          }
        }
      },
    );
  }

  Future<void> goToAddCategoryPage() async {
    Map<String, dynamic> result = await Get.toNamed(RouteNames.addCategory,
        parameters: {'userId': '$userId'});
    CategoryViewModel newCategory = CategoryViewModel.fromJson(json: result);
    categories.add(newCategory);
  }

  Future<void> goToSubCategory({required int categoryId}) async {
    var result = await Get.toNamed(
      RouteNames.subCategory,
      parameters: {'categoryId': '$categoryId'},
    );
  }
}
