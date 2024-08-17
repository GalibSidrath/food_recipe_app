import 'package:food_recipe_app/data/models/network_response.dart';
import 'package:food_recipe_app/data/models/recipe_model.dart';
import 'package:food_recipe_app/data/network_caller/network_caller.dart';
import 'package:food_recipe_app/data/util/urls.dart';
import 'package:get/get.dart';

class HomeScreenDefaultRecipeController extends GetxController {
  bool _taskInProcess = false;
  String _errorMessege = '';
  final List<RecipeModel> _recipeList = [];

  bool get taskInProcess => _taskInProcess;
  String get errorMessege => _errorMessege;
  List<RecipeModel> get recipeList => _recipeList;

  Future<bool> getDefaultRecipe() async {
    bool result = false;
    _recipeList.clear();
    _taskInProcess = true;
    update();

    NetworkResponse response = await NetworkCaller.getRequest(Urls.recipes);

    if (response.isSuccess) {
      for (dynamic data in response.responseData) {
        _recipeList.add(
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
