// Normalize the api response

class ApiResponseModel {
  final bool status;
  final dynamic data;
  final String? error;
  final String? token;

  ApiResponseModel({required this.status, this.data, this.error, this.token});

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      status: json["status"],
      data: json["data"],
      error: json["error"],
      token: json["token"],
    );
  }
//

}
