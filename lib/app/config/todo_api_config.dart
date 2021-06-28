import 'package:dio/dio.dart';

final _options = BaseOptions(
  baseUrl: 'https://jsonplaceholder.typicode.com',
);

final todoApi = Dio(_options);
