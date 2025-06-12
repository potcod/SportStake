import 'package:flutter/material.dart';
import '../widgets/categories.dart';
import '../widgets/trade_playercard.dart';
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


  void _handleCategorySelected(String categoryName) { //
    setState(() {
      _selectedCategory = categoryName;
      print('Selected category for TradePage: $_selectedCategory');

    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 4),
            topButtons(),
            const SizedBox(height: 12),
            searchBar(),
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

            doubles(),


          ],
        )
    );
  }

  Widget topButtons(){
    return Center( // Center the segmented button horizontally
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
        style: SegmentedButton.styleFrom( //Change look of selected button
          selectedBackgroundColor: Colors.black,
          selectedForegroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  Widget doubles(){

    List<Widget> rowsOfDoubles = [];
    for (int i = 0; i < mockPlayers.length; i += 2) {
      if (i + 1 < mockPlayers.length) { //Makes it so theres 2 players per card
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
                        Expanded(child: PlayerCard(player: mockPlayers[i])), //Just holds i to length of mockplayers for now to show some data
                        const SizedBox(width: 8),
                        Expanded(child: PlayerCard(player: mockPlayers[i + 1])),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () { //No sell logic yet
                      print("Sell Doubles Bet for ${mockPlayers[i].name} and ${mockPlayers[i+1].name}");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      foregroundColor: Colors.white,
                      minimumSize: const Size(80, 60),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      shape: RoundedRectangleBorder(
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
