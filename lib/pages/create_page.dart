import 'package:flutter/material.dart';
import '../Player.dart';
import '../widgets/searchBar.dart';
import '../widgets/categories.dart';
import '../widgets/create_playercard.dart';
import '../widgets/player_grid_display.dart'; // New PlayerGridDisplay widget

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});
  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState  extends State<CreatePage>{
  String? _selectedCategory; // State variable to hold the currently selected category name

  // Callback function to receive the selected category from StatefulCategories
  void _handleCategorySelected(String categoryName) {
    setState(() {
      _selectedCategory = categoryName;
      print('Selected category: $_selectedCategory'); // Debugging output
    });
  }

  // Method to filter mockPlayers based on the selected category
  List<Player> _getFilteredPlayers() {
    if (_selectedCategory == null || _selectedCategory == 'All') {
      return mockPlayers; // Show all players if no category or 'All' is selected
    } else {
      // Filter players whose category matches the selected one (case-insensitive)
      return mockPlayers
          .where((player) =>
      player.category.toLowerCase() == _selectedCategory!.toLowerCase())
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the filtered list of players before passing to playerGrid()
    final List<Player> filteredPlayers = _getFilteredPlayers();

    return SingleChildScrollView(
      child: Column(
        children: [
          searchBar(),
          // Pass the callback to StatefulCategories so it can communicate selection
          StatefulCategories(onCategorySelected: _handleCategorySelected),
          events(),
          // Pass the filtered list of players to PlayerGridDisplay
          PlayerGridDisplay(players: filteredPlayers),
        ],
      ),
    );
  }

  Widget events() {
    List<String> mockEvents = [
      "LAL vs GSW",
      "DEN vs DAL",
      "PHO vs MIL",
      "OKC vs BKN",
      "POR vs CHI",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            "Events",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Row(
              children: mockEvents.map((event) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.5),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Event selected: $event');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      elevation: 0,
                    ),
                    child: Text(
                      event,
                      style: const TextStyle(fontSize: 8),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
class PlayerDetailModal extends StatelessWidget {
  final Player player;

  const PlayerDetailModal({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 120,
            height: 120,
            child: Image.network(
              player.jerseyImg,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  'https://placehold.co/120x120/cccccc/000000?text=Jersey',
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Text(
            player.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'vs ${player.opponent ?? 'Opponent'} ${player.eventDate ?? 'Date'}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_downward)),
                  Text(
                      '${player.pointsWager ?? 0} pts'
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_upward)),
                ],
              ),
            ],
          ),
          ElevatedButton(onPressed: (){}, //Slider button didn't work, just using elevated button
            child: Text("SUBMIT LINE",
              style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[300],

            ),)

        ],
      ),
    );
  }
}



