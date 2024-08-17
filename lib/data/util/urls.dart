class Urls {
  static const String _apiKey = "SLyAJylyh/o3ww6K/Wp85Q==xc62IAl4ZCkw8Pks";
  static const String _baseUrl = "https://api.api-ninjas.com/v1";
  static const String recipes = "$_baseUrl/recipe?X-Api-Key=$_apiKey";
  static String quary(String? quary) =>
      "$_baseUrl/recipe?query=$quary&X-Api-Key=$_apiKey";
}
