
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealdb_test/Model/food_category_model.dart';

import '../Repository/food_repository_impl.dart';
import '../data/response/api_response.dart';

final foodController =
ChangeNotifierProvider((ref) => FoodProvider());

class FoodProvider extends ChangeNotifier {
  final _foodRepositoryImpl = FoodRepositoryImpl();

  ApiResponse<FoodCategory> category = ApiResponse.loading();




  void _setCategory(ApiResponse<FoodCategory> response) {
    category = response;
    print(category.data?.categories![0].strCategory);

  }

  void getCategory() async {
    _setCategory(ApiResponse.loading());
    await _foodRepositoryImpl.getFoodCategory().then((value) {
      _setCategory(ApiResponse.completed(value));
    }).onError((error, stackTrace) {

    });

  }
}
