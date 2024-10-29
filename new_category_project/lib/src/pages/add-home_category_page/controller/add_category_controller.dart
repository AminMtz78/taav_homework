import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/utils.dart';
import '../models/category_dto.dart';
import '../repository/add_category_repository.dart';

class AddCategoryController extends GetxController {
  AddCategoryController({required this.userId});

  final int? userId;
  TextEditingController titleEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  final AddCategoryRepository _repository = AddCategoryRepository();

  @override
  void onClose() {
    titleEditingController.dispose();
  }

  @override
  void onInit() {
    if (userId == null) {
      Get.back();
    }
    super.onInit();
  }

  Future<void> onSubmit() async {
    if (formKey.currentState!.validate()) {
      CategoryDto newDto = CategoryDto(
        0,
        userId!,
        titleEditingController.text.trim(),
      );

      Either<String, Map<String, dynamic>> resultOrException =
          await _repository.postCategory(dto: newDto);

      resultOrException.fold(
        (exception) {
          Utils.mySnackBar(error: 'error', message: exception);
        },
        (newCategory) {
          Get.back(result: newCategory);
        },
      );
    }
  }
}
