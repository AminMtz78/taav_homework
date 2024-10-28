// import 'dart:convert';
// import 'package:either_dart/either.dart';
// import '../models/user_view_model.dart';
// import '../../../infrastructure/repository_urls/repository_urls.dart';
// import 'package:http/http.dart' as http;
//
// class SplashRepository {
//   Future<Either<String, List<User>>> getUsers() async {
//     int? statusCode;
//     Uri url = Uri.http(RepositoryUrls.baseUrl, RepositoryUrls.users);
//     try {
//       final http.Response response = await http.get(url);
//       statusCode = response.statusCode;
//       if (response.statusCode == 200) {
//         final String body = response.body;
//         final List<dynamic> jsonData = json.decode(body);
//         List<User> users = jsonData
//             .map(
//               (user) => User.fromJson(json: user as Map<String, dynamic>),
//             )
//             .toList();
//         return Right(users);
//       } else {
//         return Left('can not fetch data. status code -> $statusCode');
//       }
//     } catch (e) {
//       return Left(
//           'error : ${e.toString()}\n, can\'t fetch data. status code -> $statusCode');
//     }
//   }
// }
