import 'package:dio/dio.dart';
import '../exceptions/app_exception.dart';
import '../models/result.dart';
import '../models/opportunity.dart';
import '../models/volunteer.dart';
import '../data/mock_data.dart';

class ApiService {
  late final Dio _dio;

  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://api.example.com/v1',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));

    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (obj) {}, // Silent in production
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        // Convert Dio errors to app exceptions
        handler.next(error);
      },
    ));
  }

  /// Simulates fetching opportunities from API
  Future<Result<List<Opportunity>>> fetchOpportunities() async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));
      return Success(mockOpportunities);
    } on DioException catch (e) {
      return Failure(_mapDioException(e));
    } catch (_) {
      return const Failure(UnknownException());
    }
  }

  /// Simulates login API call
  Future<Result<Volunteer>> login(String email, String password) async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));
      if (email.contains('@') && password.length >= 8) {
        return const Success(sampleVolunteer);
      }
      return const Failure(AuthException('Invalid credentials'));
    } on DioException catch (e) {
      return Failure(_mapDioException(e));
    } catch (_) {
      return const Failure(UnknownException());
    }
  }

  AppException _mapDioException(DioException e) {
    return switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.sendTimeout =>
        const NetworkException('Connection timed out'),
      DioExceptionType.connectionError => const NetworkException(),
      DioExceptionType.badResponse => _mapStatusCode(e.response?.statusCode),
      _ => const UnknownException(),
    };
  }

  AppException _mapStatusCode(int? code) {
    if (code == null) return const UnknownException();
    return switch (code) {
      401 => const AuthException(),
      422 => const ValidationException(),
      >= 500 => const ServerException(),
      _ => const UnknownException(),
    };
  }
}
