import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../../infrastructure/repository_urls/repository_urls.dart';
import '../models/category_dto.dart';
import 'dart:convert';

class AddCategoryRepository {
  Future<Either<String, Map<String, dynamic>>> postCategory(
      {required CategoryDto dto}) async {
    int? statusCode;
    Uri url = Uri.http(RepositoryUrls.baseUrl, RepositoryUrls.categories);
    String body = json.encode(dto.toJson());
    try {
      http.Response response = await http
          .post(url, body: body, headers: {'Content-Type': 'application/json'});
      statusCode = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return Right(jsonData);
      } else {
        return Left(
            'unsuccessful post. status code = > ${response.statusCode}');
      }
    } catch (e) {
      return Left(
          'unsuccessful post, status code => $statusCode\n error message => ${e.toString()}');
    }
  }
}
