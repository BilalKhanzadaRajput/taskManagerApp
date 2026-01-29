import 'package:dio/dio.dart';

/// Helper class to extract user-friendly error messages from exceptions
class ErrorMessageHelper {
  /// Extracts a user-friendly error message from an exception
  static String getErrorMessage(dynamic error) {
    if (error is DioException) {
      return _extractDioErrorMessage(error);
    } else if (error is Exception) {
      return _extractExceptionMessage(error);
    } else {
      return 'An unexpected error occurred. Please try again.';
    }
  }

  /// Extracts user-friendly message from DioException
  static String _extractDioErrorMessage(DioException e) {
    // Handle response errors (4xx, 5xx)
    if (e.response != null) {
      final statusCode = e.response?.statusCode;
      final responseData = e.response?.data;

      // Try to extract message from response data
      String? message;
      if (responseData is Map<String, dynamic>) {
        message =
            responseData['message'] as String? ??
            responseData['error'] as String?;
      }

      // Handle specific status codes
      switch (statusCode) {
        case 400:
          return message ??
              'Invalid request. Please check your input and try again.';
        case 401:
          return message ??
              'Invalid credentials. Please check your username and password.';
        case 403:
          return message ??
              'Access denied. You don\'t have permission to perform this action.';
        case 404:
          return message ?? 'Resource not found. Please try again.';
        case 422:
          return message ?? 'Validation error. Please check your input.';
        case 429:
          return 'Too many requests. Please wait a moment and try again.';
        case 500:
          return 'Server error. Please try again later.';
        case 502:
        case 503:
        case 504:
          return 'Service temporarily unavailable. Please try again later.';
        default:
          return message ??
              e.response?.statusMessage ??
              'Server error ($statusCode). Please try again.';
      }
    }

    // Handle network errors
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet connection and try again.';
      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network settings.';
      case DioExceptionType.badCertificate:
        return 'Security certificate error. Please try again.';
      case DioExceptionType.badResponse:
        return 'Invalid server response. Please try again.';
      case DioExceptionType.cancel:
        return 'Request cancelled. Please try again.';
      default:
        return e.message ??
            'Network error. Please check your connection and try again.';
    }
  }

  /// Extracts user-friendly message from generic Exception
  static String _extractExceptionMessage(Exception e) {
    final message = e.toString();

    // Remove common exception prefixes
    String cleanMessage = message
        .replaceAll('Exception: ', '')
        .replaceAll('Error: ', '');

    // Handle specific exception types
    if (message.contains('SocketException') || message.contains('Network')) {
      return 'No internet connection. Please check your network settings.';
    }

    if (message.contains('TimeoutException') || message.contains('timeout')) {
      return 'Request timeout. Please try again.';
    }

    // Return cleaned message or default
    return cleanMessage.isNotEmpty && cleanMessage != message
        ? cleanMessage
        : 'An error occurred. Please try again.';
  }
}
