import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/models/recipe_model.dart';
import 'package:food_recipe_app/ui/util/textStyles.dart';

class SingleRecipeScreen extends StatefulWidget {
  const SingleRecipeScreen({super.key, required this.recipeModel});

  final RecipeModel recipeModel;

  @override
  State<SingleRecipeScreen> createState() => _SingleRecipeScreenState();
}

class _SingleRecipeScreenState extends State<SingleRecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipe',
          style: CustomTextStyles.poppins,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.recipeModel.title.toString(),
                style: CustomTextStyles.titlePoppins,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Ingredients : ${widget.recipeModel.ingredients.toString().split('|').join(',\n')}',
                  style: CustomTextStyles.singleRecipePageIngredients,
                ),
              ),
              Text(
                'Instruction : ${widget.recipeModel.instructions.toString()}',
                textAlign: TextAlign.justify,
                style: CustomTextStyles.singleRecipePageInstruction,
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
