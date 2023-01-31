import 'package:flutter/material.dart';
import 'package:recipe_app/materials/RecipePage.dart';
import 'package:recipe_app/models/temp_recipe_list.dart';

import '../models/Recipe.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Recipe> recipes = temp_recipe_list;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: recipes.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300, childAspectRatio: 1.0),
        itemBuilder: (context, index) {
          return _buildRecipeCard(index);
        });
  }

  Widget _buildRecipeCard(int i) {
    Recipe r = recipes[i];
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RecipePage.routeName, arguments: r);
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Colors.grey[900],
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
              image: NetworkImage(r.imageUrl),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // use whichever suits your need
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // use whichever suits your need

                  children: [
                    Text(r.recipeAuthor,
                        style: const TextStyle(color: Colors.white)),
                    Icon(
                        r.isFavourite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_outlined,
                        color: Colors.pink),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            r.recipeName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          const Icon(Icons.timer_rounded, color: Colors.white),
                          Text(r.cookingTime,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10))
                        ]),
                        Row(
                          children: [
                            const Icon(Icons.shopping_bag, color: Colors.white),
                            Text(r.amountOfIngredients,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10)),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.trending_up_rounded,
                                color: Colors.white),
                            Text(r.recipeDifficulty,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
