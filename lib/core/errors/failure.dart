import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;

  const Failures(this.errorMessage);
}

class ServerFailure extends Failures {
  const ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return const ServerFailure('Connection timeout with ApiServer');
      case DioErrorType.sendTimeout:
        return const ServerFailure('Send timeout with ApiServer');

      case DioErrorType.receiveTimeout:
        return const ServerFailure('Receive timeout with ApiServer');

      case DioErrorType.badCertificate:
        return const ServerFailure('Bad certificate with ApiServer');

      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return const ServerFailure('Your request was canceled');
      case DioErrorType.connectionError:
        return const ServerFailure(
            'Your Internet connection lost, Please try again');

      case DioErrorType.unknown:
        if (dioError.message!.contains('ServerException')) {
          return const ServerFailure('No internet connection');
        }
        return const ServerFailure(
            'Unexpected error, Please try again later! ');
      default:
        return const ServerFailure(
            'Opps ,There was an error, Please try again!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['message']);
    } else if (statusCode == 404) {
      return const ServerFailure(
          'Your request not found, Please try again later!');
    } else if (statusCode == 500) {
      return const ServerFailure(
          'Internal server error, Please try again later!');
    } else {
      return const ServerFailure('Opps ,There was an error, Please try again!');
    }
  }
}