import 'package:flutter/material.dart';
import '../data/recipes_data.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteRecipes = sampleRecipes.where((recipe) => recipe.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favoriteRecipes.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet!\nTap the heart icon on recipes to add them here.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                final recipe = favoriteRecipes[index];
                return Card(
                  child: ListTile(
                    leading: Image.asset(recipe.imagePath, width: 56, fit: BoxFit.cover),
                    title: Text(recipe.name),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsScreen(recipe: recipe),
                        ),
                      ).then((_) => setState(() {})); // Refresh when returning
                    },
                  ),
                );
              },
            ),
    );
  }
}