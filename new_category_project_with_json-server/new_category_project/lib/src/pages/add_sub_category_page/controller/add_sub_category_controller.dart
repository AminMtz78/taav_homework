import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/utils.dart';
import '../models/sub_category_dto.dart';
import '../repository/add_sub_category_repository.dart';

class AddSubCategoryController extends GetxController {
  final int? categoryId;

  final AddSubCategoryRepository _repository = AddSubCategoryRepository();
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController priceEditingController = TextEditingController();
  RxBool isLoading = false.obs, isRetry = false.obs;
  GlobalKey<FormState> formKey = GlobalKey();

  AddSubCategoryController({required this.categoryId});

  @override
  void onClose() {
    titleEditingController.dispose();
    priceEditingController.dispose();
    super.onClose();
  }

  Future<void> onSubmit() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      isRetry.value = false;

      SubCategoryDto newSubCategoryDto = SubCategoryDto(
          titleEditingController.text.trim(),
          categoryId!,
          int.tryParse(priceEditingController.text.trim())!);
      print(newSubCategoryDto.toString());

      Either<String, Map<String, dynamic>> resultOrException =
          await _repository.postSubCategory(dto: newSubCategoryDto);
      isLoading.value = false;

      resultOrException.fold(
        (exception){
          Utils.mySnackBar(error: 'error', message: exception);
        },
        (jsonSubCategory){
          print('---------------');
          print(jsonSubCategory);
          Get.back(result: jsonSubCategory);
        },
      );
    }
  }
}
