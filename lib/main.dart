import 'package:flutter/material.dart';
import 'package:recipe_app/materials/FavouriteRecipes.dart';
import 'package:recipe_app/materials/MainPage.dart';
import 'package:recipe_app/materials/RecipePage.dart';
import 'package:recipe_app/materials/Settings.dart';

void main() => runApp(MyApp());

Map<String, WidgetBuilder> routes = {
  "/viewrecipe": (context) => const RecipePage()
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
      routes: routes,
      initialRoute: "/",
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maxime's Recipe Book"),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("Maxime's Recipe Book",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: const Icon(
                Icons.list_alt_rounded,
              ),
              title: const Text('Recipes'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite,
                color: Colors.pink,
              ),
              title: const Text('Favourite Recipes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavouriteRecipes()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
              ),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            ),
          ],
        ),
      ),
      body: BodyWidget(),
    );
  }
}

class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MainPage(),
    );
  }
}
