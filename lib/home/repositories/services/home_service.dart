import 'package:dio/dio.dart';

class HomeService {
  Future<bool> submit(dynamic data, [bool isSuccess = false]) async {
    try {
      final dio = Dio();
      Response response = await dio.post(
        'https://reqres.in',
        data: data,
      );

      if (response.statusCode == 200 || isSuccess) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
