import 'package:flutter/material.dart';
import '../Player.dart';

class CreatePlayerCard extends StatelessWidget { // Modified playercard for specifically the create screen
  final Player player;
  final VoidCallback? onTap; // Added for tap functionality

  const CreatePlayerCard({
    super.key,
    required this.player,
    this.onTap, // Make onTap optional
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      margin: const EdgeInsets.all(3), // Space between each card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: InkWell( // Entire card becomes tappable
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox( //Place to hold jersey img
                width: 60,
                height: 90,
                child: Image.network(
                  player.jerseyImg,
                ),
              ),
              const SizedBox(height: 6), //Better spacing

              Text( //Display player name
                player.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),

              Text( //VERSUS Text
                'vs ${player.opponent ?? 'Opponent'} ${player.eventDate ?? 'Date'}',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
