import 'dart:convert';
import 'package:either_dart/either.dart';
import '../models/category_view_model.dart';
import '../../../infrastructure/repository_urls/repository_urls.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  Future<Either<String, List<CategoryViewModel>>>
      getHomeCategories() async {
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
}
