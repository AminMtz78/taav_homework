import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_category_project/new_category_project.dart';
import '../models/user_dto.dart';
import '../models/user_view_model.dart';
import '../repository/register_page_repository.dart';
import '../../../infrastructure/utils.dart';

class RegisterPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RegisterPageRepository _repository = RegisterPageRepository();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  RxBool isLoading = false.obs,
      isRetry = false.obs,
      onSubmitLoading = false.obs;

  RxInt selectedIndex = 1.obs;
  bool isUsersGet = false;
  List<UserViewModel> users = [];
  String title = 'REGISTER PAGE';
  TabController? tabController;
  List<Tab> tabs = [
    const Tab(
      text: 'LOGIN',
    ),
    const Tab(
      text: 'REGISTER',
    )
  ];

  @override
  void onInit() {
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: selectedIndex.value,
    );
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    usernameEditingController.dispose();
    passwordEditingController.dispose();
  }

  void changeTab(
    int index,
  ) {
    switch (index) {
      case 0:
        Get.back();
      case 1:
        Get.toNamed(RouteNames.register);
    }
  }

  Future<void> onSubmit() async {
    if (formKey.currentState!.validate()) {
      if (!isUsersGet) {
        isLoading.value = true;
        isRetry.value = false;
        Either<String, List<UserViewModel>> resultOrException =
            await _repository.getUsers();
        isLoading.value = false;
        resultOrException.fold(
          (exception) {
            Utils.mySnackBar(error: 'error', message: exception);
            isRetry.value = true;
          },
          (rightUsers) {
            users.addAll(rightUsers);
            isUsersGet = true;
          },
        );
      }
      int index = users.indexWhere(
          (element) => element.username == usernameEditingController.text);
      bool isUserExist = index != -1;
      if (isUserExist) {
        Utils.mySnackBar(
            error: '',
            message:
                'the entered username is already exist, please enter different username');
      } else {
        onSubmitLoading.value = true;
        final Either<String, Map<String, dynamic>> resulOrException =
            await _repository.postUser(
          userDto: UserDto(
            usernameEditingController.text.trim(),
            passwordEditingController.text.trim(),
          ),
        );
        onSubmitLoading.value = false;
        resulOrException.fold(
          (exception) {
            isRetry.value = true;
            Utils.mySnackBar(error: 'error', message: exception);
          },
          (registeredUser) {
            // print(registeredUser);
            Get.back(result: registeredUser);
          },
        );
      }
    }
  }
}
