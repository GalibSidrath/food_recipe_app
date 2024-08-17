import 'package:food_recipe_app/data/models/network_response.dart';
import 'package:food_recipe_app/data/models/recipe_model.dart';
import 'package:food_recipe_app/data/network_caller/network_caller.dart';
import 'package:food_recipe_app/data/util/urls.dart';
import 'package:get/get.dart';

class RecipeSearchController extends GetxController {
  bool _taskInProcess = false;
  String _errorMessege = '';
  final List<RecipeModel> _searchRecipeList = [];

  bool get taskInProcess => _taskInProcess;
  String get errorMessege => _errorMessege;
  List<RecipeModel> get searchRecipeList => _searchRecipeList;

  Future<bool> getSearchRecipe(String? quary) async {
    bool result = false;
    _searchRecipeList.clear();
    _taskInProcess = true;
    update();

    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.quary(quary));

    if (response.isSuccess) {
      for (dynamic data in response.responseData) {
        _searchRecipeList.add(
          RecipeModel.fromJson(data),
        );
      }
      result = true;
    } else {
      _errorMessege = response.errorMsg ?? 'Failed to get recipes';
    }
    _taskInProcess = false;
    update();

    return result;
  }
}
