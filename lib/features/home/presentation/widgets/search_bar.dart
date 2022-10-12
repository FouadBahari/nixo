import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_dimensions.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSize.width8),
      child: const TextField(
        decoration: InputDecoration(prefixIcon: Icon(Icons.search_outlined)),
        
      ),
    );
  }
}
