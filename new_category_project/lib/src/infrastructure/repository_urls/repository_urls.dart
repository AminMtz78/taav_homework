class RepositoryUrls {
  static const String baseUrl = 'localhost:3000';
  static const String users = '/users';

  static String userById({required int userId}) {
    return '/users/$userId';
  }

  static const String categories = '/categories';
  static const String subCategories = '/subCategories';

  static String getSubCategoriesById({required int categoryId}) {
    return '/subCategories?categoryId=$categoryId';
  }

  static String removeSubCategoryById({required int id}) {
    return '/subCategories/$id';
  }

  static String editCategoryById({required int id}) {
    return '/categories/$id';
  }
}
