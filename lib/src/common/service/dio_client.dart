import 'package:digicoach/src/common/constants/api_link.dart';
import 'package:digicoach/src/common/service/exceptions/network_exceptions.dart';
import 'package:digicoach/src/common/service/shared_pref_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioClient {
  DioClient._() {
    _setupDio();
  }
  final Dio _dio = Dio();
  static final DioClient _instance = DioClient._();
  static DioClient get instance => _instance;

  // invironment flavour

  void _setupDio() {
    _dio.options = BaseOptions(
      baseUrl: ApiLink.base,
      headers: {
        'accept': 'application/json',
        'contentType': 'application/json',
      },
    );

    final _storage = SharedPrefProvider.instance;

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler r) async {
          // locking dio before reading token from storage
          _dio.lock();
          final token = _storage.getString('token');
          debugPrint("Bearer $token");
          _dio.unlock();
          // add authorization token if it is not null
          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }
          // continue the operation
          r.next(options);
        },
      ),
    );
  }

  /// return response body or throws [NetworkExceptions]
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (e) {
      throw e.toNetworkException();
    }
  }

  /// return response body or throws [NetworkExceptions]
  Future<dynamic> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (e) {
      throw e.toNetworkException();
    }
  }

  /// return response body or throws [NetworkExceptions]
  Future<dynamic> post(
    uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (e) {
      throw e.toNetworkException();
    }
  }

  Future<void> download(String urlPath, String filePath) async {
    try {
      await Dio().download(urlPath, filePath);
    } on DioError catch (e) {
      throw e.toNetworkException();
    }
  }
}
