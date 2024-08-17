import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/controllers/home_screen_default_recipe_controller.dart';
import 'package:food_recipe_app/ui/screens/recipe_search_result_screen.dart';
import 'package:food_recipe_app/ui/screens/single_recipe_screen.dart';
import 'package:food_recipe_app/ui/util/textStyles.dart';
import 'package:food_recipe_app/ui/widgets/progress_loader.dart';
import 'package:food_recipe_app/ui/widgets/snack_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _getRecipes() async {
    bool result =
        await Get.find<HomeScreenDefaultRecipeController>().getDefaultRecipe();

    result
        ? toastMessege(context, 'All recipes loded')
        : toastMessege(context, 'Faild to load recipes');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Food Recipes',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _getRecipes,
        child: SizedBox(
          width: Get.width * 1,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'You need to enter a recipe name or title';
                      }
                      return null;
                    },
                    controller: _searchTEController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => RecipeSearchResultScreen(
                            //       query: _searchTEController.text.trim(),
                            //     ),
                            //   ),
                            // );
                            final query = _searchTEController.text;
                            Get.to(() => RecipeSearchResultScreen(
                                  query: query,
                                ));
                          }
                        },
                        icon: const Icon(Icons.search_rounded),
                      ),
                      filled: true,
                      hintText: 'Search Recipe',
                      hintStyle: CustomTextStyles.poppins,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              _titleText('Lets Cook Something New Today!'),
              _buildRecipeList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: CustomTextStyles.titlePoppins,
      ),
    );
  }

  Widget _buildRecipeList() {
    return Expanded(
      child: GetBuilder<HomeScreenDefaultRecipeController>(
          builder: (homeScreenDefaultRecipeController) {
        return Visibility(
          visible: homeScreenDefaultRecipeController.taskInProcess == false,
          replacement: progressLoader(),
          child: ListView.builder(
            itemCount: homeScreenDefaultRecipeController.recipeList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: InkWell(
                  onTap: () {
                    Get.to(() => SingleRecipeScreen(
                          recipeModel: homeScreenDefaultRecipeController
                              .recipeList[index],
                        ));
                  },
                  child: Card(
                    elevation: 4,
                    surfaceTintColor: Colors.blue,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          homeScreenDefaultRecipeController
                              .recipeList[index].title
                              .toString(),
                          style: CustomTextStyles.recipeTitle,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ingredients : ${homeScreenDefaultRecipeController.recipeList[index].ingredients.toString()}",
                            style: CustomTextStyles.poppins,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Instructions : ${homeScreenDefaultRecipeController.recipeList[index].instructions.toString()}",
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
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchTEController.dispose();
  }
}
