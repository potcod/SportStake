import 'package:flutter/material.dart';

// This widget handles the display and selection logic for categories.
class StatefulCategories extends StatefulWidget {
  // Callback to notify the parent widget when a category is selected.
  final ValueChanged<String> onCategorySelected;

  const StatefulCategories({super.key, required this.onCategorySelected});

  @override
  State<StatefulCategories> createState() => _StatefulCategoriesState();
}

class _StatefulCategoriesState extends State<StatefulCategories> {

  // The actual filtering logic is handled by the parent widget.
  int _selectedIndex = 999; //So that nothing is highlighted at start

  // Define the category list
  final List<Map<String, dynamic>> _categories = [
    {'icon': Icons.sports_golf, 'name': 'Golf'},
    {'icon': Icons.sports_basketball, 'name': 'Basketball'},
    {'icon': Icons.sports_soccer, 'name': 'Soccer'},
    {'icon': Icons.sports_football, 'name': 'Football'},
    {'icon': Icons.sports_baseball, 'name': 'Baseball'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Row( //Display the textual part of category widget
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 999; //Reset so that nothing is highlighted
                  });
                  widget.onCategorySelected('All'); // Make it so that everything is Viewed
                },
                child: const Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView( //Make it scrollable if more categories were to exist
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_categories.length, (index) {
              bool isSelected = _selectedIndex == index; // Check if the current button is selected
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0), // Spacing between category buttons
                child: IconButton.filled(
                  icon: Icon(_categories[index]['icon'], size: 40),
                  onPressed: () { // Make it so that the selected button is highlighted and updates what is clicked
                    setState(() {
                      _selectedIndex = index;
                    });
                    widget.onCategorySelected(_categories[index]['name']);
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: isSelected ? Colors.blue : Colors.grey[300], //Make it blue whens selected, else it will be grey
                    foregroundColor: isSelected ? Colors.white : Colors.black, // White text when selected, else it will be black
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
