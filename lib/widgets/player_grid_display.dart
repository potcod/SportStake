import 'package:flutter/material.dart';

import '../Player.dart';
import 'create_playerCard.dart';
import '../pages/create_page.dart';


class PlayerGridDisplay extends StatelessWidget {
  final List<Player> players;

  const PlayerGridDisplay({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: players.length, // For now just go up to the list length for showng data
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final player = players[index]; // G
          return CreatePlayerCard(
            player: player,
            onTap: () {
              print('Tapped on ${player.name}');
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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
