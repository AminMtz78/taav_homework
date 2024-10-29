import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:new_category_project/new_category_project.dart';
import '../../../infrastructure/utils.dart';
import '../models/sub_category_view_model.dart';
import '../repository/sub_category_repository.dart';

class SubCategoryController extends GetxController {
  final int? categoryId;

  SubCategoryController({required this.categoryId});

  final SubCategoryRepository _repository = SubCategoryRepository();
  RxList<SubCategoryViewModel> subCategories = <SubCategoryViewModel>[].obs;
  RxBool isLoading = false.obs, isRetry = false.obs;

  @override
  void onInit() {
    if (categoryId != null) {
      getSubCategoriesByCategoryId();
    }
    super.onInit();
  }

  Future<void> getSubCategoriesByCategoryId() async {
    isLoading.value = true;
    isRetry.value = false;
    Either<String, List<SubCategoryViewModel>> resultOrException =
        await _repository.getSubCategories(categoryId: categoryId!);
    isLoading.value = false;

    resultOrException.fold(
      (exception) {
        Utils.mySnackBar(error: 'error', message: exception);
        isRetry.value = true;
      },
      (repositoryListSubCategories) {
        print(repositoryListSubCategories.length);
        subCategories.addAll(repositoryListSubCategories);
      },
    );
  }

  Future<void> goToAddSubCategory() async {
    Map<String, dynamic> result = await Get.toNamed(RouteNames.addSubCategory,
        parameters: {'categoryId': '$categoryId'});

    subCategories.add(
      SubCategoryViewModel.formJson(json: result),
    );
  }

  RxMap<int, bool> isRemoveSubCategoryMap = RxMap();

  Future<void> onRemoveSubCategory({required int id}) async {
    isRemoveSubCategoryMap[id] = true;
    Either<String, bool> resultOrException =
        await _repository.removeSubCategoryById(id: id);
    isRemoveSubCategoryMap[id] = false;
    resultOrException.fold(
      (exception) {
        Utils.mySnackBar(error: 'error', message: exception);
      },
      (isSuccessful) {
        subCategories.removeWhere((element) => element.id == id);
      },
    );
  }

  void onBack() {
    int totalPrice = 0;
    for(SubCategoryViewModel item in subCategories){
      totalPrice += item.price;
    }
    Get.back(result: totalPrice);
  }
}
