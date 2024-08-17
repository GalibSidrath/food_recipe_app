import 'package:flutter/material.dart';
import 'package:food_recipe_app/binding_controller.dart';
import 'package:food_recipe_app/ui/screens/splash_screen.dart';
import 'package:get/get.dart';

class FoodRecipeApp extends StatelessWidget {
  const FoodRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      initialBinding: BindingController(),
    );
  }
}
