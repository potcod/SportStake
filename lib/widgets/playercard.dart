import 'package:flutter/material.dart';
import '../Player.dart';

class PlayerCard extends StatelessWidget { //Playercard for lineup screen
  final Player player;

  const PlayerCard({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4), // Reduced margin for fitting side-by-side
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Reduced padding inside card
        child: Row( //Align everything by row first
          children: [
            Column( // Column for jerseyImg and Name
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(
                    player.jerseyImg,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  player.name.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(width: 12), // Reduced space between jersey and stats

            Expanded( // Display the pts of player
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_circle_up,
                        color: Colors.green[500],
                        size: 20,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${player.points}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        ' PTS',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8), //

                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration( //Create circle to go around pts of player
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 2, //
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${player.rebounds}', //Not too sure what to display for points, just put rebounds for now
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          'PTS',
                          style: TextStyle(
                            fontSize: 10,
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
