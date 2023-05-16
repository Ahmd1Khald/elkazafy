import 'package:dio/dio.dart';

import '../../constans/strings.dart';

class PlayerWebServices {
  late Dio dio;

  PlayerWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: base_url,
      receiveDataWhenStatusError: true,
      // connectTimeout: const Duration(seconds: 20),
      // receiveTimeout: const Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllPlayer() async {
    try {
      Response response = await dio.get('/Player/GetAll');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

// try made List<Map> instad of Map<String ,dynamic>
  Future<Map<String, dynamic>> getPlayerData() async {
    try {
      Response response = await dio.get('/Player/GetPlayerData?id=2');
      return response.data;
    } catch (e) {
      print("asdasdasd ${e.toString()}");
      return {};
    }
  }
}
