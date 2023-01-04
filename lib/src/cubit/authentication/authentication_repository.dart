import 'package:untitled1/src/constants/api_routes.dart';
import 'package:untitled1/src/helpers/api_helper.dart';
import 'package:untitled1/src/models/api_response_model.dart';

class AuthenticationRepository {
  Future<ApiResponseModel> login(String email, String password) async {
    Map<String, dynamic> payload = {"email": email, "password": password};
    ApiHelper apiHelper = ApiHelper();
    ApiResponseModel apiResponseModel =
        await apiHelper.makePostRequest(ApiRoutes.loginRoute, payload);
    return apiResponseModel;
  }
}
