part of 'network_exceptions.dart';

extension XException on NetworkExceptions {
  /// Provides key to be used to with localization
  String getIntlException() {
    return when(
      requestCancelled: () => 'exception.request-cancelled',
      unauthorisedRequest: () => 'exception.unauthorised-request',
      badRequest: () => 'exception.something-went-wrong',
      notFound: () => 'exception.not-found',
      methodNotAllowed: () => 'exception.something-went-wrong',
      notAcceptable: () => 'exception.something-went-wrong',
      connectionTimeout: () => 'exception.connection-timeout',
      receiveTimeout: () => 'exception.connection-timeout',
      sendTimeout: () => 'exception.connection-timeout',
      requestTimeout: () => 'exception.connection-timeout',
      conflict: () => 'exception.something-went-wrong',
      internalServerError: () => 'exception.something-went-wrong',
      serviceUnavailable: () => 'exception.something-went-wrong',
      noInternetConnection: () => 'exception.no-internet-connection',
      formatException: () => 'exception.bad-format',
      unableToProcess: () => 'exception.unable-to-process',
      defaultError: () => 'exception.something-went-wrong',
      unexpectedError: () => 'exception.something-went-wrong',
      preconditionFailed: () => 'exception.something-went-wrong',
      forbidden: () => 'exception.forbidden',
      tooManyRequest: () => 'exception.too-many-request',
      unprocessableEntity: () => 'exception.invalid-data',
    );
  }
}
