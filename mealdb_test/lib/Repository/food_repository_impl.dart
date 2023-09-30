
import '../../../api/urls.dart';
import '../../../data/network/base_api_service.dart';
import '../../../data/network/network_api_service.dart';
import '../Model/food_category_model.dart';
import 'food_repository.dart';


class FoodRepositoryImpl implements FoodRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  @override
  Future<FoodCategory?> getFoodCategory() async {
    dynamic response = await _apiServices.getApi(Urls.foodCategory);
    return FoodCategory.fromMap(response);
  }



}
