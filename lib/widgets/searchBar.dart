import 'package:flutter/material.dart';

Widget searchBar(){
  return Padding( // Search bar

    padding: const EdgeInsets.all(6.0),
    child: TextField(

      decoration: InputDecoration(
        hintText: 'Search players, teams, etc.',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Adjust text padding
      ),
      onChanged: (value) {
        // Add search logic here later

        print('Search query: $value');
      },
    ),
  );
}