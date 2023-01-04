import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:untitled1/src/helpers/storage_helper.dart';
import 'package:untitled1/src/models/api_response_model.dart';

class ApiHelper {
  static final ApiHelper _instance = ApiHelper._internal();

  factory ApiHelper() {
    return _instance;
  }

  ApiHelper._internal();

  static Dio dio = Dio(BaseOptions(
    baseUrl: "http://15.206.27.26/",
    contentType: "application/json",

    connectTimeout: 30 * 1000, // 30 sec
    receiveTimeout: 30 * 1000, // 30 sec
  ));
  // Get, Post,Patch,Delete

  Future<ApiResponseModel> makeGetRequest(String route,
      {Map<String, dynamic>? mHeaders}) async {
    Map<String, dynamic> headers = await getDefaultHeader();
    if (mHeaders != null) {
      headers.addAll(mHeaders);
    }
    Response response =
        await dio.get(route, options: Options(headers: headers));
    // if (response.statusCode == 200 ||
    //     response.statusCode == 201 ||
    //     response.statusCode == 204) {
    //   return ApiResponseModel(status: true, data: response.data);
    // } else {
    //   return ApiResponseModel(status: false, error: "Internal Server Error");
    // }
    return ApiResponseModel.fromJson(response.data);
  }

  Future<ApiResponseModel> makePostRequest(
      String route, Map<String, dynamic> payload,
      {Map<String, dynamic>? mHeaders}) async {
    Map<String, dynamic> headers = await getDefaultHeader();
    if (mHeaders != null) {
      headers.addAll(mHeaders);
    }
    Response response = await dio.post(route,
        data: jsonEncode(payload), options: Options(headers: headers));
    return ApiResponseModel.fromJson(response.data);
  }

  Future<ApiResponseModel> makePatchRequest(
      String route, Map<String, dynamic> payload,
      {Map<String, dynamic>? mHeaders}) async {
    Map<String, dynamic> headers = await getDefaultHeader();
    if (mHeaders != null) {
      headers.addAll(mHeaders);
    }

    Response response = await dio.patch(route,
        data: jsonEncode(payload), options: Options(headers: headers));
    return ApiResponseModel.fromJson(response.data);
  }

  Future<ApiResponseModel> makeDeleteRequest(String route,
      {Map<String, dynamic>? mHeaders}) async {
    Map<String, dynamic> headers = await getDefaultHeader();
    if (mHeaders != null) {
      headers.addAll(mHeaders);
    }
    Response response =
        await dio.delete(route, options: Options(headers: headers));
    return ApiResponseModel.fromJson(response.data);
  }

  Future<Map<String, dynamic>> getDefaultHeader() async {
    String? token = await StorageHelper.readData(StorageKeys.token.name);
    Map<String, dynamic> headers = {
      'Authorization': 'Bearer $token',
      'accept': 'application/json'
    };
    return headers;
  }
}
