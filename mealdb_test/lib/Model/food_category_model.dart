// To parse this JSON data, do
//
//     final foodCategory = foodCategoryFromMap(jsonString);

import 'dart:convert';

FoodCategory foodCategoryFromMap(String str) => FoodCategory.fromMap(json.decode(str));

String foodCategoryToMap(FoodCategory data) => json.encode(data.toMap());

class FoodCategory {
  List<Category>? categories;

  FoodCategory({
    this.categories,
  });

  factory FoodCategory.fromMap(Map<String, dynamic> json) => FoodCategory(
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toMap())),
  };
}

class Category {
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;

  Category({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
    idCategory: json["idCategory"],
    strCategory: json["strCategory"],
    strCategoryThumb: json["strCategoryThumb"],
    strCategoryDescription: json["strCategoryDescription"],
  );

  Map<String, dynamic> toMap() => {
    "idCategory": idCategory,
    "strCategory": strCategory,
    "strCategoryThumb": strCategoryThumb,
    "strCategoryDescription": strCategoryDescription,
  };
}
