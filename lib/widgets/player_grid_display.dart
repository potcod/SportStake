import 'package:flutter/material.dart';
// Adjust paths as per your project structure
import '../Player.dart'; // Assuming mockPlayers list and Player class are here
import 'create_playercard.dart';
import '../pages/create_page.dart';
import 'create_playercard.dart'; // Assuming CreatePlayerCard is here

class PlayerGridDisplay extends StatelessWidget {
  final List<Player> players; // Now accepts a list of players

  const PlayerGridDisplay({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: players.length, // Use the provided players list's length
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final player = players[index]; // Get player from the provided list
          return CreatePlayerCard(
            player: player,
            onTap: () {
              print('Tapped on ${player.name}. Attempting to show dialog...');
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // PlayerDetailModal needs to be defined or imported here
                    // For now, it's assumed to be accessible, potentially from create_page.dart or its own file
                    child: PlayerDetailModal(player: player),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
