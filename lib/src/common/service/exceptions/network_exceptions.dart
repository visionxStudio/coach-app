import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'intl_exception.dart';
part 'network_exceptions.freezed.dart';

@freezed
class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = _RequestCancelled;
  const factory NetworkExceptions.unauthorisedRequest() = _UnauthorisedRequest;
  const factory NetworkExceptions.badRequest() = _BadRequest;
  const factory NetworkExceptions.notFound() = _NotFound;
  const factory NetworkExceptions.methodNotAllowed() = _MethodNotAllowed;
  const factory NetworkExceptions.notAcceptable() = _NotAcceptable;
  const factory NetworkExceptions.connectionTimeout() = _ConnectionTimeout;
  const factory NetworkExceptions.receiveTimeout() = _ReceiveTimeout;
  const factory NetworkExceptions.sendTimeout() = _SendTimeout;
  const factory NetworkExceptions.requestTimeout() = _RequestTimeout;
  const factory NetworkExceptions.conflict() = _Conflict;
  const factory NetworkExceptions.internalServerError() = _InternalServerError;
  const factory NetworkExceptions.serviceUnavailable() = _ServiceUnavailable;
  const factory NetworkExceptions.noInternetConnection() =
      _NoInternetConnection;
  const factory NetworkExceptions.formatException() = _FormatException;
  const factory NetworkExceptions.unableToProcess() = _UnableToProcess;
  const factory NetworkExceptions.defaultError() = _DefaultError;
  const factory NetworkExceptions.unexpectedError() = _UnexpectedError;
  const factory NetworkExceptions.preconditionFailed() = _PreconditionFailed;
  const factory NetworkExceptions.forbidden() = _Forbidden;
  const factory NetworkExceptions.tooManyRequest() = _TooManyRequest;
  const factory NetworkExceptions.unprocessableEntity() = _UnprocessableEntity;
}

extension DioToNetworkException on DioError {
  NetworkExceptions toNetworkException() {
    NetworkExceptions networkExceptions;
    switch (type) {
      case DioErrorType.cancel:
        networkExceptions = const NetworkExceptions.requestCancelled();
        break;
      case DioErrorType.connectTimeout:
        networkExceptions = const NetworkExceptions.connectionTimeout();
        break;
      case DioErrorType.sendTimeout:
        networkExceptions = const NetworkExceptions.sendTimeout();
        break;
      case DioErrorType.receiveTimeout:
        networkExceptions = const NetworkExceptions.receiveTimeout();
        break;
      case DioErrorType.response:
        // we get some response from server so needed to use response here.
        switch (response!.statusCode) {
          case 400:
            networkExceptions = const NetworkExceptions.badRequest();
            break;
          case 401:
            networkExceptions = const NetworkExceptions.unauthorisedRequest();
            break;
          case 403:
            networkExceptions = const NetworkExceptions.forbidden();
            break;
          case 404:
            networkExceptions = const NetworkExceptions.notFound();
            break;
          case 408:
            networkExceptions = const NetworkExceptions.requestTimeout();
            break;
          case 409:
            networkExceptions = const NetworkExceptions.conflict();
            break;
          case 412:
            networkExceptions = const NetworkExceptions.preconditionFailed();
            break;
          case 422:
            networkExceptions = const NetworkExceptions.unprocessableEntity();
            break;
          case 429:
            networkExceptions = const NetworkExceptions.tooManyRequest();
            break;
          case 500:
            networkExceptions = const NetworkExceptions.internalServerError();
            break;
          case 503:
            networkExceptions = const NetworkExceptions.serviceUnavailable();
            break;
          default:
            networkExceptions = const NetworkExceptions.defaultError();
        }
        break;
      case DioErrorType.other:
        // we got some other kind of errors like socket exception or
        // network exception etc
        if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else if (error is FormatException) {
          networkExceptions = const NetworkExceptions.formatException();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        break;
      default:
        networkExceptions = const NetworkExceptions.unexpectedError();
    }
    return networkExceptions;
  }
}
