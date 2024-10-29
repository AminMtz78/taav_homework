import 'dart:convert';
import 'package:either_dart/either.dart';
import '../../add-home_category_page/models/category_dto.dart';
import '../models/category_view_model.dart';
import '../../../infrastructure/repository_urls/repository_urls.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  Future<Either<String, List<CategoryViewModel>>> getHomeCategories() async {
    int? statusCode;
    Uri url = Uri.http(RepositoryUrls.baseUrl, RepositoryUrls.categories);
    try {
      http.Response response = await http.get(url);
      statusCode = response.statusCode;
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<CategoryViewModel> categories = jsonData
            .map(
              (category) => CategoryViewModel.fromJson(json: category),
            )
            .toList();
        return Right(categories);
      } else {
        return Left(
            'can not fetch fetch data, status code -> ${response.statusCode}');
      }
    } catch (e) {
      return Left(
          'can not fetch data status code: $statusCode\n error: ${e.toString()}');
    }
  }

  Future<Either<String, CategoryViewModel>> editSubCategoryById(
      {required int id, required CategoryDto dto}) async {
    int? statusCode;
    Uri url = Uri.http(
        RepositoryUrls.baseUrl, RepositoryUrls.editCategoryById(id: id));
    String body = json.encode(dto.toJson());

    try {
      http.Response response = await http.patch(
        url,
        body: body,
        headers: {'Content-Type': 'application/json'},
      );
      statusCode = response.statusCode;
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return Right(CategoryViewModel.fromJson(json: jsonData));
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
