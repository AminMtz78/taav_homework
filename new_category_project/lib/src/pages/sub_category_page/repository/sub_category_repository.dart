import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../add-home_category_page/models/category_dto.dart';
import '../models/sub_category_view_model.dart';
import '../../../infrastructure/repository_urls/repository_urls.dart';

class SubCategoryRepository {
  Future<Either<String, List<SubCategoryViewModel>>> getSubCategories(
      {required int categoryId}) async {
    int? statusCode;
    Uri url = Uri.parse(
        'http://${RepositoryUrls.baseUrl}${RepositoryUrls.getSubCategoriesById(
      categoryId: categoryId,
    )}');
    try {
      http.Response response = await http.get(url);
      statusCode = response.statusCode;
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        List<SubCategoryViewModel> subCategories = jsonData
            .map((subCategory) =>
                SubCategoryViewModel.formJson(json: subCategory))
            .toList();
        return Right(subCategories);
      } else {
        return Left(
            'can not fetch data . status code => ${response.statusCode}');
      }
    } catch (e) {
      return Left('can not fetch data, status code => $statusCode \n '
          'error : ${e.toString()}');
    }
  }

  Future<Either<String, bool>> removeSubCategoryById({required int id}) async {
    int? statusCode;
    Uri url = Uri.http(
        RepositoryUrls.baseUrl, RepositoryUrls.removeSubCategoryById(id: id));

    try {
      http.Response response = await http.delete(url);
      statusCode = response.statusCode;
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left('unsuccessful remove,\n'
            'status code => $statusCode\n');
      }
    } catch (e) {
      return Left('unsuccessful remove,\n'
          'status code => $statusCode\n'
          'Error : ${e.toString()} ');
    }
  }

}
