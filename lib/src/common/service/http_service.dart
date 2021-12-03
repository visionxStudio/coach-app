// import 'dart:io';
// import 'package:digicoach/src/common/constants/api_link.dart';
// import 'package:digicoach/src/common/utils/storage/base_storage.dart';
// import 'package:dio/dio.dart';

// /// http mentods
// enum Method { post, get, put, delete, patch }

// HttpService httpService = HttpService();

// class HttpService {
//   late Dio _dio;

//   Dio get dio => _dio;

//   Future<HttpService> init() async {
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: ApiLink.base,
//         followRedirects: false,
//         // validateStatus: (status) {
//         //   return status! <= 500;
//         // },
//         headers: {"Content-Type": "application/json"},
//       ),
//     );
//     initializeInterceptors();
//     return this;
//   }

//   /// intercept the http request
//   initializeInterceptors() {
//     _dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) async {
//           final String token = await shareprefrence.read("token");
//           if (token.isNotEmpty) {
//             options.headers.addAll({
//               "Authorization": token,
//             });
//           }
//           print("=========== REQUEST INFO ===========");
//           print("${options.data}");

//           return handler.next(options);
//         },
//         onResponse: (response, handler) {
//           print("=========== RESPONSE INFO ===========");
//           print(
//               "${response.statusCode} | ${response.statusMessage} | ${response.realUri}");
//           if (response.statusCode! < 200 || response.statusCode! >= 300) {
//             print("=========== ERROR RESPONSE INFO ===========");
//             print(response);
//           }
//           return handler.next(response);
//         },
//         onError: (DioError e, handler) {
//           print("=========== DIO INTERCEPTOR ERROR =========== ");
//           print(e.message);

//           return handler.next(e);
//         },
//       ),
//     );
//   }

//   /// Generic request method. Default method to Method.GET
//   /// params is used for Method.Get
//   /// data is used for other methods
//   Future<dynamic> request(
//     String url, {
//     Method? method,
//     Map<String, dynamic>? params,
//     dynamic data,
//     dynamic onReceiveProgress,
//     dynamic headers,
//   }) async {
//     Response response;

//     try {
//       if (method == Method.post) {
//         response = await _dio.post(url,
//             data: data, options: Options(headers: headers));
//       } else if (method == Method.delete) {
//         response = await _dio.delete(url, data: data);
//       } else if (method == Method.patch) {
//         response = await _dio.patch(url, data: data);
//       } else if (method == Method.put) {
//         response = await _dio.put(url, data: data);
//       } else {
//         response = await _dio.get(url, queryParameters: params);
//       }

//       if (response.statusCode! >= 200 && response.statusCode! < 300) {
//         return response;
//       } else if (response.statusCode == 401) {
//         throw Exception("Unauthorized");
//       } else if (response.statusCode == 500) {
//         throw Exception("Server Error");
//       } else {
//         throw Exception("Something Went Wrong");
//       }
//     } on SocketException catch (e) {
//       print(e);
//       throw Exception("No Internet Connection");
//     } on DioError catch (e) {
//       print(e);
//       throw Exception("Error connecting to server");
//     } catch (e) {
//       throw Exception("Something Went Wrong!!!");
//     }
//   }
// }
