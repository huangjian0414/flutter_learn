


class HJMealModel {
  List<Meal> meal = [];

  HJMealModel.fromJson(Map<String, dynamic> json) {
    if (json['meal'] != null) {
      json['meal'].forEach((v) {
        meal.add(new Meal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meal != null) {
      data['meal'] = this.meal.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
List<String> complexes = ["简单", "中等", "困难"];

class Meal {
  String id = '';
  List<String> categories = [];
  String title = '';
  int affordability = 0;
  int complexity = 0;
  String imageUrl = '';
  int duration = 0;
  List<String> ingredients = [];
  List<String> steps = [];
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  String complexityStr = '';


  Meal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categories = json['categories'].cast<String>();
    title = json['title'];
    affordability = json['affordability'];
    complexity = json['complexity'];
    imageUrl = json['imageUrl'];
    duration = json['duration'];
    ingredients = json['ingredients'].cast<String>();
    steps = json['steps'].cast<String>();
    isGlutenFree = json['isGlutenFree'];
    isVegan = json['isVegan'];
    isVegetarian = json['isVegetarian'];
    isLactoseFree = json['isLactoseFree'];

    complexityStr = complexes[json['complexity']];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categories'] = this.categories;
    data['title'] = this.title;
    data['affordability'] = this.affordability;
    data['complexity'] = this.complexity;
    data['imageUrl'] = this.imageUrl;
    data['duration'] = this.duration;
    data['ingredients'] = this.ingredients;
    data['steps'] = this.steps;
    data['isGlutenFree'] = this.isGlutenFree;
    data['isVegan'] = this.isVegan;
    data['isVegetarian'] = this.isVegetarian;
    data['isLactoseFree'] = this.isLactoseFree;
    return data;
  }
}
