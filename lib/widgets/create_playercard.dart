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
      margin: const EdgeInsets.all(3), // Space between Cards
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: InkWell( // Make the entire card tappable
        onTap: onTap, // Assign the onTap callback
        borderRadius: BorderRadius.circular(12), // Match Card's border radius for ripple effect

        child: Padding( // Keep padding to give content breathing room inside InkWell's tap area
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // Removed mainAxisSize.min to allow the Column to expand and fill the InkWell's area
            // CrossAxisAlignment.stretch ensures children stretch horizontally if possible
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 60, // Adjusted size for grid display
                height: 90, // Adjusted size for grid display
                child: Image.network(
                  player.jerseyImg,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://placehold.co/60x60/cccccc/000000?text=Jersey',
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),
              const SizedBox(height: 6), // Adjusted spacing

              Text(
                player.name,
                style: const TextStyle(
                  fontSize: 12, // Adjusted font size
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2), // Adjusted spacing

              Text( //VERSUS Text
                'vs ${player.opponent ?? 'Opponent'} ${player.eventDate ?? 'Date'}',
                style: const TextStyle(
                  fontSize: 10, // Adjusted font size
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
