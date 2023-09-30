import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Provider/food_provider.dart';

class FoodScreen extends ConsumerStatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends ConsumerState<FoodScreen> {
  FoodProvider? foodProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    foodProvider = ref.watch(foodController);
    foodProvider?.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Categories'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: foodProvider?.category.data?.categories?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final category = foodProvider?.category.data?.categories?[index];
          if (category != null) {
            return Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    category.strCategoryThumb.toString(),
                    height: 100,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category.strCategory.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          } else {

            return const SizedBox(); // Placeholder widget
          }
        },
      ),
    );
  }
}
