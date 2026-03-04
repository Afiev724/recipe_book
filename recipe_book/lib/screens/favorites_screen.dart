import 'package:flutter/material.dart';
import '../models/recipe.dart';


// In DetailsScreen (StatefulWidget)
IconButton(
  icon: Icon(
    recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
    color: Colors.red,
  ),
  onPressed: () => setState(() {
    recipe.isFavorite = !recipe.isFavorite;
  }),
)