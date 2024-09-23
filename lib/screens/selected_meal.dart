import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class SelectedMeal extends StatelessWidget {
  const SelectedMeal(
      {super.key, required this.mealData, required this.toggleMealFavorite});

  final Meal mealData;
  final void Function(Meal meal) toggleMealFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealData.title),
        actions: [
          IconButton(
            onPressed: () {
              toggleMealFavorite(mealData);
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 6.0),
        child: Column(
          children: [
            Image.network(
              mealData.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 14.0,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8.0,
            ),
            for (final ingredient in mealData.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0),
              ),
            const SizedBox(
              height: 14.0,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8.0,
            ),
            for (final step in mealData.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
