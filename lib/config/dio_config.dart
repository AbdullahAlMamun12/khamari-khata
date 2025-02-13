/*
  Author: Abdullah Al Mamun
  Email: al-mamun12@hotmail.com
  LinkedIn: linkedin.com/in/al-mamun12
  Since: March 9, 2022

  This file contains the implementation of API request handling using Dio in a Flutter application.
  The code includes a custom error handling mechanism and an abstract configuration for
  making HTTP requests with authentication and base URL management.
  Also included the interceptors for handling errors and any other necessary functionality.
*/

import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../utils/utils.dart';
import 'error_entity.dart';



/// An abstract base class for configuring Dio requests with token and base URL.
abstract class RequestConfig {
  late final Dio _dio;

  /// Returns the base URL for the API requests.
  String baseURL();

  BaseOptions get _baseOptions => BaseOptions(
    baseUrl: baseURL(),
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    responseType: ResponseType.json,
  );

  RequestConfig() {
    _dio = Dio(_baseOptions)
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          // Attach cookies from local storage to the request headers
          String? cookies = Utils.localStorage.cookie;
          if (cookies != null) {
            options.headers['Cookie'] = cookies;
          }
          return handler.next(options);
          },
        onResponse: (response, handler) {
          // Save cookies from response headers
          Utils.manageCookies(response.headers);
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          var errorData = e.response?.data;

          if (errorData != null && e.response?.statusCode == 403) {
              // await Utils.logoutUser();
          } else {
            debugPrint('::: API error: $e :: ${e.response}');
          }
          debugPrint('::: API error: $e :: ${e.response}');
          return handler.resolve(e.response!);
        },
      ));
  }

  /// Returns the authorization token.
  String authorizationToken();

  /// Merges authorization token into the request headers.
  Options _mergeHeaders(Options? options) {
    final authHeaders = {'authorization': authorizationToken()};
    return (options ?? Options());
  }

  /// Handles HTTP error codes and returns corresponding error messages.
  ErrorEntity _handleHttpError(DioException error) {
    final int? errCode = error.response?.statusCode;
    if (errCode == null) {
      return ErrorEntity(code: -2, message: error.message);
    }
    switch (errCode) {
      case 400:
        return ErrorEntity(code: errCode, message: 'Bad request syntax');
      case 401:
        return ErrorEntity(code: errCode, message: 'Permission denied');
      case 403:
        return ErrorEntity(code: errCode, message: 'Forbidden request');
      case 404:
        return ErrorEntity(code: errCode, message: 'Server not found');
      case 405:
        return ErrorEntity(code: errCode, message: 'Method not allowed');
      case 500:
        return ErrorEntity(code: errCode, message: 'Internal server error');
      case 502:
        return ErrorEntity(code: errCode, message: 'Bad gateway');
      case 503:
        return ErrorEntity(code: errCode, message: 'Service unavailable');
      case 505:
        return ErrorEntity(code: errCode, message: 'HTTP version not supported');
      default:
        return ErrorEntity(code: errCode, message: error.response?.statusMessage ?? 'Unknown error');
    }
  }

  /// Handles different types of Dio exceptions and maps them to user-friendly error messages.
  ErrorEntity _createErrorEntity(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return ErrorEntity(code: -1, message: 'Request cancelled');
      case DioExceptionType.connectionTimeout:
        return ErrorEntity(code: -1, message: 'Connection timed out');
      case DioExceptionType.sendTimeout:
        return ErrorEntity(code: -1, message: 'Request timed out');
      case DioExceptionType.receiveTimeout:
        return ErrorEntity(code: -1, message: 'Response timed out');
      case DioExceptionType.unknown:
        return _handleHttpError(error);
      default:
        return ErrorEntity(code: -1, message: error.message);
    }
  }

  /// Executes the Dio request and handles errors.
  Future<dynamic> _sendRequest(Future<Response> Function() request) async {
    try {
      final response = await request();
      return response.data;
    } on DioException catch (e) {
      throw _createErrorEntity(e);
    }
  }

  /// GET request.
  Future<dynamic> get(String path, {dynamic params, Options? options}) async {
    return _sendRequest(() => _dio.get(path, queryParameters: params, options: _mergeHeaders(options)));
  }
  /// GET request.
  Future<dynamic> download(String url,String savePath, {ProgressCallback? onReceiveProgress,Options? options}) async {
    return _sendRequest(() => _dio.download(url, savePath, onReceiveProgress: onReceiveProgress, options: _mergeHeaders(options)));
  }

  /// POST request.
  Future<dynamic> post(String path, {dynamic params, Options? options}) async {
    return _sendRequest(() => _dio.post(path, data: jsonEncode(params), options: _mergeHeaders(options)));
  }

  /// PUT request.
  Future<dynamic> put(String path, {dynamic params, Options? options}) async {
    return _sendRequest(() => _dio.put(path, data: params, options: _mergeHeaders(options)));
  }

  /// PATCH request.
  Future<dynamic> patch(String path, {dynamic params, Options? options}) async {
    return _sendRequest(() => _dio.patch(path, data: params, options: _mergeHeaders(options)));
  }

  /// DELETE request.
  Future<dynamic> delete(String path, {dynamic params, Options? options}) async {
    return _sendRequest(() => _dio.delete(path, data: params, options: _mergeHeaders(options)));
  }

  /// POST form submission with progress tracking.
  Future<dynamic> postForm(
      String path, {
        Map<String, dynamic> params = const {}, // Map as parameter
        Options? options,
        Function(int, int)? onSendProgress, // Nullable progress callback
      }) async {
    // Convert Map to FormData
    FormData formData = FormData.fromMap(params);

    final formOptions = options ?? Options(method: 'POST', contentType: 'multipart/form-data');
    return _sendRequest(() => _dio.request(
      path,
      data: formData,
      options: _mergeHeaders(formOptions),
      onSendProgress: onSendProgress, // Pass the callback to Dio's request method
    ));
  }
}

