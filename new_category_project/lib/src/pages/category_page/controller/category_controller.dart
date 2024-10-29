import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_category_project/src/shared/enum_break_points.dart';
import '../../add-home_category_page/models/category_dto.dart';
import '../../../../new_category_project.dart';
import '../models/category_view_model.dart';
import '../../../infrastructure/utils.dart';
import '../repository/category_repository.dart';

class CategoryController extends GetxController with WidgetsBindingObserver {
  final int? userId;

  CategoryController({required this.userId});

  final CategoryRepository _repository = CategoryRepository();
  RxList<CategoryViewModel> categories = <CategoryViewModel>[].obs;
  RxBool isLoading = false.obs, isRetry = false.obs;
  RxDouble pageWidth = 0.0.obs;

  double small() => BreakPoints.small.width;

  double medium() => BreakPoints.medium.width;

  double large() => BreakPoints.large.width;

  RxMap<int, bool> totalPriceLoadingMap = RxMap();

  @override
  void onInit() {
    if (userId != null) {
      getCategory();
    } else {
      Utils.mySnackBar(
        error: 'error',
        message: 'login error',
      );
    }
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void didChangeMetrics() {
    updatePageWidth();
    super.didChangeMetrics();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addObserver(this);
    super.dispose();
  }

  void updatePageWidth() {
    // update width with media query
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageWidth.value = Get.context?.size?.width ?? 0.0;
    });
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
        // print('user id => $userId');
        for (CategoryViewModel item in repositoryCategoryList) {
          // print(item.id);
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

  Future<void> goToSubCategory(
      {required int categoryId, required String title}) async {
    int totalPrice = await Get.toNamed(
      RouteNames.subCategory,
      parameters: {'categoryId': '$categoryId'},
    );

    CategoryDto newDto = CategoryDto(totalPrice, userId!, title);
    totalPriceLoadingMap[categoryId] = true;
    // edit total price of category
    Either<String, CategoryViewModel> resultOrException =
        await _repository.editSubCategoryById(id: categoryId, dto: newDto);
    totalPriceLoadingMap[categoryId] = false;

    resultOrException.fold(
      (exception) {
        Utils.mySnackBar(error: 'error', message: exception);
      },
      (rightCategoryViewModel) {
        int index =
            categories.indexWhere((element) => element.id == categoryId);
        if (index != -1) {
          categories[index] = rightCategoryViewModel;
        }
      },
    );
  }

  void goBackToLoginPage() {
    Get.offNamed(RouteNames.login);
  }
}
