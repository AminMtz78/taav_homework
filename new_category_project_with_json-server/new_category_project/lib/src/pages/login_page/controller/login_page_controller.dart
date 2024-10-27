import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_category_project/new_category_project.dart';
import '../repository/login_page_repository.dart';
import '../../../infrastructure/utils.dart';
import '../models/user_view_model.dart';

class LoginPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final LoginPageRepository _repository = LoginPageRepository();
  RxInt selectedIndex = 0.obs;
  String title = 'LOGIN PAGE';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  RxBool isLoading = false.obs, isRetry = false.obs;
  List<UserViewModel> users = [];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      length: tabs.length,
      vsync: this,
      initialIndex: selectedIndex.value,
    );
    getUsers();
  }

  @override
  void onClose() {
    tabController?.dispose();
    usernameEditingController.dispose();
    passwordEditingController.dispose();
    super.onClose();
  }

  TabController? tabController;
  List<Tab> tabs = [
    const Tab(
      text: 'LOGIN',
    ),
    const Tab(
      text: 'REGISTER',
    )
  ];

  void changeTab(int index) {
    if (index == selectedIndex.value) {
      return;
    }
    Get.toNamed(RouteNames.register);
  }

  void onLogin() {
    if (formKey.currentState!.validate()) {
      int index = users.indexWhere(
          (element) => element.username == usernameEditingController.text);
      //check username exist
      if (index == -1) {
        Utils.mySnackBar(
            error: 'error',
            message: 'this username did not exist please register first');
      } else {
        //checking username and password entered correctly
        if (users[index].username == usernameEditingController.text &&
            users[index].password == passwordEditingController.text) {
          Get.toNamed(
            RouteNames.homeCategory,
            parameters: {'id': '${users[index].id}'},
          );
        } else {
          Utils.mySnackBar(
            error: 'error',
            message: 'invalid user name or password if you'
                ' didn\'t resister yet please register first',
          );
        }
      }
    }
  }

  Future getUsers() async {
    isLoading.value = true;
    isRetry.value = false;
    Either<String, List<UserViewModel>> resultOrException =
        await _repository.getUsers();
    isLoading.value = false;
    resultOrException.fold(
      (exception) {
        isRetry.value = true;
        Utils.mySnackBar(error: 'error', message: exception);
      },
      (rightUsers) {
        isLoading.value = false;
        isRetry.value = false;
        users.addAll(rightUsers);
      },
    );
  }

  Future<void> goToRegisterPage() async {
    Map<String, dynamic> result = await Get.toNamed(RouteNames.register);
    // print(result);
     UserViewModel newUser = UserViewModel.fromJson(json: result);
    // print('---------------');
    // print('newUser => ${newUser.username}');
    users.add(newUser);
    usernameEditingController.text = newUser.username;
    passwordEditingController.text = newUser.password;
  }
}
