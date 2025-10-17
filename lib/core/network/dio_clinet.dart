import 'package:dio/dio.dart';

class DioClinet {

static Dio? _Instance;
static Dio get instance {
  _Instance ??= createDio();
  return _Instance!;
}

  static Dio createDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.coincap.io/v2/',
        connectTimeout: 50000,
        receiveTimeout: 30000,
      ),
    );
  }
}
