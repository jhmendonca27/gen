import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:gen_app/pages/home/external/mocks/home_mock.dart';
import 'package:gen_app/utils/errors/errors.dart';
import 'enum/dio_method.dart';
import 'i_dio_client.dart';
import 'models/dio_response.dart';

class DioClient implements IDioClient {
  final Dio client;

  DioClient(
      this.client,
      );

  @override
  Future<DioResponse> request({
    required String url,
    required DioMethod method,
    Map<String, dynamic>? params,
    dynamic body,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {

    var data;

    if (body is FormData) {
      data = body;
      method = DioMethod.POST;
    } else {
      data = body;
    }

    var response = Response(statusCode: 500, requestOptions: RequestOptions(path: ''));

    final defaultHeaders = headers?.cast<String, dynamic>() ?? {}
      ..addAll(await _getHeaders(url));
    final defaultOptions = options ??
        Options(
          method: method.name,
          headers: defaultHeaders,
        );
    try {
      log("URL REQUEST ----> $url \nDATA: $data \nPARAMS: $params \n method: $method");
      switch (method) {
        case DioMethod.GET:
          response = await client.get(url,
              queryParameters: params,
              options: defaultOptions);
          break;
        case DioMethod.GET_MOCK:
          response = Response(statusCode: 200, requestOptions: RequestOptions(path: ''),data: home_mock) ;
          break;
        case DioMethod.POST:
          response = await client.post(url,
              data: data, options: defaultOptions);
          break;
        case DioMethod.PUT:
          response = await client.put(url,
              data: data, options: defaultOptions);
          break;
        case DioMethod.DELETE:
          response = await client.delete(url,
              data: data, options: defaultOptions);
          break;
        default:
          throw Failure();
      }
    } catch (error) {
      if (error is DioError && error.response != null) {
        _handleResponse(error.response!);
      } else {
        if (error == DioErrorType.cancel) {
          throw CanceledError();
        } else {
          throw Failure();
        }
      }
    }
    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        {
          if (response.data is String || response.data is List) {
            Map<String, dynamic> newResponse = {'data': response.data};
            response.data = newResponse;
          }

          if (response.data is! Map && response.data?.stream != null) {
            response.data = null;
          }
          return DioResponse(
            statusCode: response.statusCode!,
            body: (response.data == null)
                ? null
                : Map<String, dynamic>.from(response.data),
            header: response.headers.isEmpty
                ? null
                : Map<String, dynamic>.from(response.headers.map),
          );
        }
      case 204:
        return DioResponse(
          statusCode: response.statusCode!,
          body: null,
          header: response.headers.isEmpty
              ? null
              : Map<String, dynamic>.from(response.headers.map),
        );
      case 400:
        throw NotFoundError();
      case 401:
        throw UnauthorizedError();
      case 403:
        throw ForbiddenError();
      case 404:
        throw NotFoundError();
      case 422:
        throw UnprocessableEntityError(
            data: (response.data == null || response.data.isEmpty)
                ? null
                : Map<String, dynamic>.from(response.data));
      default:
        throw GenericError();
    }
  }

  static Future<Map<String, String>> _getHeaders(String path) async {

    Map<String, String> requestHeaders = {};
      requestHeaders = {
        "accept": "application/json, */*",
        "content-type": "application/json",
      };
    return requestHeaders;
  }
}