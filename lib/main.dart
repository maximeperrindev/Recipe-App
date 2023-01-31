import 'package:flutter/material.dart';
import 'package:recipe_app/materials/MainPage.dart';
import 'package:recipe_app/materials/RecipePage.dart';

void main() => runApp(MyApp());

Map<String, WidgetBuilder> routes = {"/viewrecipe": (context) => RecipePage()};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Maxime's Recipe Book"),
        ),
        body: BodyWidget(),
      ),
      routes: routes,
      initialRoute: "/",
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
