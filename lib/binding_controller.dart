import 'package:food_recipe_app/ui/controllers/home_screen_default_recipe_controller.dart';
import 'package:food_recipe_app/ui/controllers/recipe_search_controller.dart';
import 'package:get/get.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenDefaultRecipeController());
    Get.put(RecipeSearchController());
    // Get.lazyPut(() => RecipeSearchController());
  }
}
