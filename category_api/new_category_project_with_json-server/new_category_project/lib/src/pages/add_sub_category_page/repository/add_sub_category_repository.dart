import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../../infrastructure/repository_urls/repository_urls.dart';
import '../models/sub_category_dto.dart';

class AddSubCategoryRepository {
  Future<Either<String, Map<String, dynamic>>> postSubCategory(
      {required SubCategoryDto dto}) async {
    int? statusCode;
    Uri url = Uri.http(RepositoryUrls.baseUrl, RepositoryUrls.subCategories);
    String body = json.encode(dto.toJson());
    try {
      final http.Response response = await http.post(
        url,
        body: body,
        headers: {'Content-Type': 'application/json'},
      );
      statusCode = response.statusCode;
      if (response.statusCode == 201) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return Right(jsonData);
      } else {
        return Left(
            'could not save data. status code => ${response.statusCode}');
      }
    } catch (e) {
      return Left('could not save data.\n'
          ' status code => $statusCode \n'
          'error message : ${e.toString()}');
    }
  }
}
