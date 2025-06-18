import 'package:flutter/material.dart';
import '../widgets/categories.dart';
import '../widgets/trade_playerCard.dart';
import '../Player.dart'; //
import '../widgets/searchBar.dart';

class TradePage extends StatefulWidget { //Stateful due to needing categories state
  const TradePage({super.key});

  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  String? _selectedCategory; //Store category name
  Set<String> _selectedTopButton = {'openMarket'};


  void _handleCategorySelected(String categoryName) {
    setState(() {
      _selectedCategory = categoryName;
      print('Selected category: $_selectedCategory');

    });
  }
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

    return SingleChildScrollView( // Scrollable to see all the doubles user may have
        padding: const EdgeInsets.only(left:8, right: 8),
        child: Column(
          children: [
            const SizedBox(height: 4),
            topButtonsWidget(),
            const SizedBox(height: 12),
            searchBarWidget(),
            StatefulCategories(onCategorySelected:  _handleCategorySelected),

            Align(
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.only(left: 6.0), // Adjust left padding as needed
                child: Text(
                  "Doubles",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24, // Adjust font size as needed
                  ),
                ),
              ),
            ),

            doublesWidget(),


          ],
        )
    );
  }

  Widget topButtonsWidget(){
    return Center(
      child: SegmentedButton<String>(
        segments: const <ButtonSegment<String>>[
          ButtonSegment<String>(
            value: 'openMarket',
            label: Text('Open Market'),
            icon: Icon(Icons.storefront),
          ),
          ButtonSegment<String>(
            value: 'myListings',
            label: Text('My Listings'),
            icon: Icon(Icons.list),
          ),
        ],
        selected: _selectedTopButton,

        onSelectionChanged: (Set<String> newSelection) {
          setState(() {
            _selectedTopButton = newSelection;
            print('Selected segmented button: $_selectedTopButton');
          });
        },
        style: SegmentedButton.styleFrom( // Determine look of selected button
          selectedBackgroundColor: Colors.black,
          selectedForegroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  Widget doublesWidget(){
    final List<Player> filteredPlayers = _getFilteredPlayers();
    List<Widget> rowsOfDoubles = [];
    for (int i = 0; i < filteredPlayers.length; i += 2) {
      if (i + 1 < filteredPlayers.length) { //Makes it so theres 2 players per card
        rowsOfDoubles.add(
          Card( // Start each row as a card
            color: Colors.grey[100],
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center, // Align the items together
                children: [
                  Expanded(
                    child: Row( //Row that holds the two playercards
                      children: [
                        Expanded(child: PlayerCard(player: filteredPlayers[i])), //Just holds i to length of mockplayers for now to show some data
                        const SizedBox(width: 8),
                        Expanded(child: PlayerCard(player: filteredPlayers[i + 1])),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () { //No sell logic yet
                      print("Sell Doubles Bet for ${filteredPlayers[i].name} and ${filteredPlayers[i+1].name}");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      foregroundColor: Colors.white,
                      minimumSize: const Size(80, 60),
                      shape: RoundedRectangleBorder( //Makes the button square
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "List\n\$100\n\$175", // Random pricing for now, no data
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
    return Column(
      children:
      rowsOfDoubles,
    );
  }
}
