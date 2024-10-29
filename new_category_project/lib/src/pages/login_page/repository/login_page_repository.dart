import 'dart:convert';
import 'package:either_dart/either.dart';
import '../../../infrastructure/repository_urls/repository_urls.dart';
import 'package:http/http.dart' as http;

import '../models/user_view_model.dart';

class LoginPageRepository {
  Future<Either<String, List<UserViewModel>>> getUsers() async {
    int? statusCode;
    Uri url = Uri.http(RepositoryUrls.baseUrl, RepositoryUrls.users);
    try {
      final http.Response response = await http.get(url);
      statusCode = response.statusCode;
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        List<UserViewModel> users = jsonData
            .map(
              (user) => UserViewModel.fromJson(json: user as Map<String, dynamic>),
            )
            .toList();
        return Right(users);
      } else {
        return Left('can not fetch data. status code -> $statusCode');
      }
    } catch (e) {
      return Left(
          'error in getUsers() : ${e.toString()}\n, can\'t fetch data. status code -> $statusCode');
    }
  }
}
