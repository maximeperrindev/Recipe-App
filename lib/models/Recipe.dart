class Recipe {
  String recipeName;
  String recipeAuthor;
  String amountOfIngredients;
  String recipeDifficulty;
  String cookingTime;
  int totalLikes;
  String imageUrl;
  bool isFavourite;
  String description;
  List<String> ingredients;
  List<String> directions;
  int cookTime;

  Recipe(
      {required this.recipeName,
      required this.recipeAuthor,
      required this.amountOfIngredients,
      required this.recipeDifficulty,
      required this.cookingTime,
      required this.totalLikes,
      required this.imageUrl,
      required this.isFavourite,
      required this.description,
      required this.ingredients,
      required this.directions,
      required this.cookTime});
}
