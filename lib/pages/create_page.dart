import 'package:flutter/material.dart';
import '../Player.dart';
import '../widgets/searchBar.dart';
import '../widgets/categories.dart';
import '../widgets/player_grid_display.dart';

class CreatePage extends StatefulWidget { //Stateful page because of categories
  const CreatePage({super.key});
  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage>{
  String? _selectedCategory; // Store category name


  void _handleCategorySelected(String categoryName) {
    setState(() {
      _selectedCategory = categoryName;
      print('Selected category: $_selectedCategory');
    });
  }

  // Method to filter mock players based on the selected category
  List<Player> _getFilteredPlayers() {
    if (_selectedCategory == null || _selectedCategory == 'All') {
      return mockPlayers; //
    } else {
      return mockPlayers
          .where((player) =>
      player.category.toLowerCase() == _selectedCategory!.toLowerCase()) //ensure theres no case differential
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Player> filteredPlayers = _getFilteredPlayers(); // Display by filtered list

    return SingleChildScrollView(
      child: Column(
        children: [
          searchBarWidget(),

          StatefulCategories(onCategorySelected: _handleCategorySelected),
          eventsWidget(),

          PlayerGridDisplay(players: filteredPlayers),
        ],
      ),
    );
  }

  Widget eventsWidget() {
    List<String> mockEvents = [ //Hardcoded events
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
                      print('Event selected: $event'); // No functionality yet, not sure how i'd sort
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
class PlayerDetailModal extends StatelessWidget { //Widget for popup modal
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

          Align( //Close button
            alignment: Alignment.topRight,
            child: PopupMenuButton<String>(
              child: Text("Points(↓)"),

              onSelected: (String result) {
                if (result == 'close') {
                  Navigator.of(context).pop(); // Close the modal
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Points',
                  child: Text('Points'),
                ),
                const PopupMenuItem<String>(

                  value: 'Rebounds',
                  child: Text('Rebounds'),
                ),
                const PopupMenuItem<String>(
                  value: 'share',
                  child: Text('Assists'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          SizedBox( //Jersey Img display
            width: 120,
            height: 120,
            child: Image.network(
              player.jerseyImg,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),

          Text( //Player name
            player.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),

          Text( //Versus Text
            'vs ${player.opponent ?? 'Opponent'} ${player.eventDate ?? 'Date'}', //Unknown who opponent would be, nor date
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          Column( //Points and Submit
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

          ElevatedButton(  //Slider button didn't work, just using elevated button
            onPressed: (){ //Display confirmation message as snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Line submitted!'),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[300],
            ),
            child: Text("SUBMIT LINE",
              style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),),
          )

        ],
      ),
    );
  }
}



