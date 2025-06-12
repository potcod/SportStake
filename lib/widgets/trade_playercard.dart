import 'package:flutter/material.dart';
import '../Player.dart';

class PlayerCard extends StatelessWidget {
  final Player player;

  const PlayerCard({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      color: Colors.grey[100],
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(2.0), // Further reduced padding inside card
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  width: 35, // Slightly smaller width for jersey image
                  height: 35, // Slightly smaller height for jersey image
                  child: Image.network(
                    player.jerseyImg,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        'https://placehold.co/35x35/cccccc/000000?text=No+Jersey',
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 1), // Minimal vertical spacing
                SizedBox( // Wrap name in SizedBox to control its width
                  width: 55, // Fixed width for the name text
                  child: Text(
                    player.name,
                    style: const TextStyle(
                      fontSize: 7, // Even smaller font size
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // Ensure ellipsis if needed
                  ),
                ),
              ],
            ),
            const SizedBox(width: 4), // Even smaller space between jersey and stats

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_circle_up,
                        color: Colors.green[600],
                        size: 14, // Slightly smaller icon size
                      ),
                      const SizedBox(width: 1),
                      Text(
                        '${player.points}',
                        style: const TextStyle(
                          fontSize: 14, // Slightly smaller font size
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const Text(
                        ' PTS',
                        style: TextStyle(
                            fontSize: 9, // Slightly smaller font size
                            color: Colors.grey,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2), // Reduced space between stats

                  Container(
                    width: 35, // Reduced size
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 1, // Reduced border width
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${player.rebounds}',
                          style: const TextStyle(
                            fontSize: 12, // Reduced font size
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const Text(
                          'PTS',
                          style: TextStyle(
                            fontSize: 7, // Reduced font size
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}