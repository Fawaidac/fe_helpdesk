import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:helpdesk/utils/api_config.dart';
import 'package:helpdesk/utils/api_response.dart';

class HttpUtil {
  late final Dio _dio;

  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() => _instance;

  HttpUtil._internal() {
    final options = BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      contentType: "application/json;charset=utf-8",
      responseType: ResponseType.plain,
    );

    _dio = Dio(options);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          final eInfo = _createErrorEntity(error);
          _handleError(eInfo);
          return handler.next(error);
        },
      ),
    );
  }

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    final response = await _dio.get(
      path,
      queryParameters: query,
      options: options,
    );

    return _handleResponse(response, options);
  }

  Future<dynamic> post(
    String path, {
    Object? data,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    final response = await _dio.post(
      path,
      data: data,
      queryParameters: query,
      options: options,
    );

    return _handleResponse(response, options);
  }

  Future<dynamic> put(
    String path, {
    Object? data,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    final response = await _dio.put(
      path,
      data: data,
      queryParameters: query,
      options: options,
    );

    return _handleResponse(response, options);
  }

  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    final response = await _dio.delete(
      path,
      queryParameters: query,
      options: options,
    );

    return _handleResponse(response, options);
  }

  ApiResponse _handleResponse(Response response, Options? options) {
    if (options?.responseType == ResponseType.stream) {
      return response.data;
    }

    try {
      final jsonMap = json.decode(response.data);
      final apiResponse = ApiResponse.fromJson(jsonMap);

      if (!apiResponse.success) {
        Fluttertoast.showToast(msg: apiResponse.message);
      }

      return apiResponse;
    } catch (e) {
      return ApiResponse(
        success: false,
        message: "Invalid response format",
        code: -1,
        data: null,
      );
    }
  }
}

class ErrorEntity implements Exception {
  final int code;
  final String message;
  final DioException error;

  ErrorEntity({required this.code, required this.message, required this.error});
}

ErrorEntity _createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: "Connection timeout", error: error);

    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: "Receive timeout", error: error);

    case DioExceptionType.badResponse:
      final status = error.response?.statusCode ?? -1;
      return ErrorEntity(
        code: status,
        message: "HTTP error $status",
        error: error,
      );

    default:
      return ErrorEntity(code: -1, message: "Unknown error", error: error);
  }
}

void _handleError(ErrorEntity e) {
  if (kDebugMode) {
    print("❌ ${e.code} - ${e.message}");
  }

  try {
    final data = json.decode(e.error.response?.data ?? "{}");
    final message = data['message'] ?? e.message;

    Fluttertoast.showToast(msg: message);
  } catch (_) {
    Fluttertoast.showToast(msg: e.message);
  }
}
