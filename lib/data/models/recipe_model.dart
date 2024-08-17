class RecipeModel {
  String? _title;
  String? _ingredients;
  String? _servings;
  String? _instructions;

  RecipeModel(
      {String? title,
      String? ingredients,
      String? servings,
      String? instructions}) {
    if (title != null) {
      _title = title;
    }
    if (ingredients != null) {
      _ingredients = ingredients;
    }
    if (servings != null) {
      _servings = servings;
    }
    if (instructions != null) {
      _instructions = instructions;
    }
  }

  String? get title => _title;
  set title(String? title) => _title = title;
  String? get ingredients => _ingredients;
  set ingredients(String? ingredients) => _ingredients = ingredients;
  String? get servings => _servings;
  set servings(String? servings) => _servings = servings;
  String? get instructions => _instructions;
  set instructions(String? instructions) => _instructions = instructions;

  RecipeModel.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _ingredients = json['ingredients'];
    _servings = json['servings'];
    _instructions = json['instructions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = _title;
    data['ingredients'] = _ingredients;
    data['servings'] = _servings;
    data['instructions'] = _instructions;
    return data;
  }
}
