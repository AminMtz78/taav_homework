import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../models/user_dto.dart';
import '../models/user_view_model.dart';
import 'dart:convert';
import '../../../infrastructure/repository_urls/repository_urls.dart';

class RegisterPageRepository {
  Future<Either<String, List<UserViewModel>>> getUsers() async {
    int? statusCode;
    final Uri url = Uri.http(
      RepositoryUrls.baseUrl,
      RepositoryUrls.users,
    );
    try {
      http.Response response = await http.get(url);
      statusCode = response.statusCode;
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<UserViewModel> users =
            jsonData.map((user) => UserViewModel.fromJson(json: user)).toList();
        return Right(users);
      } else {
        return Left('can not fetch data. status Code: ${response.statusCode}');
      }
    } catch (e) {
      return Left(
          "can not fetch data. error : ${e.toString()} \n status code -> $statusCode ");
    }
  }

  Future<Either<String, Map<String, dynamic>>> postUser(
      {required UserDto userDto}) async {
    int? statusCode;
    Uri url = Uri.http(
      RepositoryUrls.baseUrl,
      RepositoryUrls.users,
    );
    final String body = json.encode(userDto.toJson());

    try {
      http.Response response = await http.post(
        url,
        body: body,
        headers: {'Content-Type': 'application/json'},
      );
      statusCode = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return Right(jsonData);
      } else {
        return Left(
            'unsuccessful register , status code => ${response.statusCode}');
      }
    } catch (e) {
      return Left(
          ' error: ${e.toString()}  unsuccessful register, \n status code => $statusCode');
    }
  }
}
