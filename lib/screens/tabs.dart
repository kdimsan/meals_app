import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabsScreenState extends StatefulWidget {
  const TabsScreenState({super.key});

  @override
  State<TabsScreenState> createState() => _TabsScreenStateState();
}

class _TabsScreenStateState extends State<TabsScreenState> {
  int _tabPageIndex = 0;
  List<Meal> favoriteMealsList = [];

  void _selectPage(int index) {
    setState(() {
      _tabPageIndex = index;
    });
  }

  void _handleSnackBarMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(message),
      ),
    );
  }

  void _toggleFavoriteMealsList(Meal meal) {
    final containMeal = favoriteMealsList.contains(meal);

    if (containMeal) {
      setState(() {
        favoriteMealsList.remove(meal);
        _handleSnackBarMessage('Meal removed from favorites.');
      });
    } else {
      setState(() {
        favoriteMealsList.add(meal);
        _handleSnackBarMessage('Meal added in favorites.');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      toggleMealFavorite: _toggleFavoriteMealsList,
    );
    var activePageTitle = 'Categories';

    if (_tabPageIndex == 1) {
      activePage = MealsScreen(
        meals: favoriteMealsList,
        toggleMealFavorite: _toggleFavoriteMealsList,
      );
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tabPageIndex,
          onTap: _selectPage,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
          ]),
    );
  }
}
