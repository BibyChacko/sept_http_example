import 'package:untitled1/src/constants/api_routes.dart';
import 'package:untitled1/src/helpers/api_helper.dart';
import 'package:untitled1/src/models/api_response_model.dart';
import 'package:untitled1/src/models/category_model.dart';

class CategoryRepository {
  Future<ApiResponseModel> addCategory(CategoryModel categoryModel) async {
    String route = ApiRoutes.categoryRoute;
    ApiResponseModel response =
        await ApiHelper().makePostRequest(route, categoryModel.toJson());
    return response;
  }

  Future<ApiResponseModel> getAllCategory() async {
    String route = ApiRoutes.categoryRoute;
    ApiResponseModel response = await ApiHelper().makeGetRequest(route);
    return response;
  }

  Future<ApiResponseModel> updateCategoryById(
      CategoryModel categoryModel) async {
    String route = ApiRoutes.categoryRoute + "${categoryModel.id}";
    ApiResponseModel response =
        await ApiHelper().makePatchRequest(route, categoryModel.toJson());
    return response;
  }

  Future<ApiResponseModel> deleteCategoryById(
      CategoryModel categoryModel) async {
    String route = ApiRoutes.categoryRoute + "${categoryModel.id}";
    ApiResponseModel response = await ApiHelper().makeDeleteRequest(
      route,
    );
    return response;
  }
}
