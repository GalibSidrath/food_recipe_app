import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/controllers/recipe_search_controller.dart';
import 'package:food_recipe_app/ui/screens/single_recipe_screen.dart';
import 'package:food_recipe_app/ui/util/textStyles.dart';
import 'package:food_recipe_app/ui/widgets/progress_loader.dart';
import 'package:food_recipe_app/ui/widgets/snack_bar.dart';
import 'package:get/get.dart';

class RecipeSearchResultScreen extends StatefulWidget {
  const RecipeSearchResultScreen({super.key, required this.query});
  final String query;

  @override
  State<RecipeSearchResultScreen> createState() =>
      _RecipeSearchResultScreenState();
}

class _RecipeSearchResultScreenState extends State<RecipeSearchResultScreen> {
  Future<void> _getRecipes() async {
    bool result =
        await Get.find<RecipeSearchController>().getSearchRecipe(widget.query);

    result ? null : toastMessege(context, 'Failed to load recipes');
  }

  @override
  void initState() {
    super.initState();
    _getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Results',
          style: CustomTextStyles.poppins,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Search Results',
              style: CustomTextStyles.titlePoppins,
            ),
          ),
          Expanded(
            child: GetBuilder<RecipeSearchController>(
              builder: (recipeSearchController) {
                if (recipeSearchController.taskInProcess) {
                  return progressLoader();
                }

                if (recipeSearchController.searchRecipeList.isEmpty) {
                  return Center(
                    child: Text(
                      'No result found',
                      style: CustomTextStyles.titlePoppins,
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: recipeSearchController.searchRecipeList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: InkWell(
                        onTap: () {
                          Get.to(SingleRecipeScreen(
                            recipeModel:
                                recipeSearchController.searchRecipeList[index],
                          ));
                        },
                        child: Card(
                          elevation: 4,
                          surfaceTintColor: Colors.blue,
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                recipeSearchController
                                        .searchRecipeList[index].title
                                        .toString() ??
                                    '',
                                style: CustomTextStyles.recipeTitle,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ingredients : ${recipeSearchController.searchRecipeList[index].ingredients.toString() ?? ''}",
                                  style: CustomTextStyles.poppins,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Instructions : ${recipeSearchController.searchRecipeList[index].instructions.toString() ?? ''}",
                                  style: CustomTextStyles.poppins,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
