import 'package:flutter_test/flutter_test.dart';
import 'package:volunteer_connect_day5/models/result.dart';
import 'package:volunteer_connect_day5/exceptions/app_exception.dart';

void main() {
  group('Result', () {
    test('Success should hold data', () {
      const result = Success<String>('hello');
      expect(result.data, 'hello');
    });

    test('Failure should hold exception', () {
      const result = Failure<String>(NetworkException());
      expect(result.exception, isA<NetworkException>());
      expect(result.exception.message, 'Network error. Please check your connection.');
    });

    test('pattern matching with switch should work', () {
      const Result<int> result = Success(42);
      final value = switch (result) {
        Success(:final data) => data,
        Failure(:final exception) => throw exception,
      };
      expect(value, 42);
    });

    test('pattern matching failure path should work', () {
      const Result<int> result = Failure(AuthException('Unauthorized'));
      final message = switch (result) {
        Success() => 'ok',
        Failure(:final exception) => exception.message,
      };
      expect(message, 'Unauthorized');
    });
  });
}
