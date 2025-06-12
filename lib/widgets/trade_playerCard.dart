import 'package:flutter/material.dart';
import '../Player.dart';

class PlayerCard extends StatelessWidget { //Trade player cards needed to be smaller to fit within one card
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
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: [
            Column( //Column to show jersey img and name under jersey
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: Image.network(
                    player.jerseyImg,

                  ),
                ),
                const SizedBox(height: 1),
                SizedBox(
                  width: 55,
                  child: Text(
                    player.name,
                    style: const TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,

                  ),
                ),
              ],
            ),

            const SizedBox(width: 4),

            Expanded(
              child: Column( //Column to show points data area
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_circle_up,
                        color: Colors.green[600],
                        size: 14,
                      ),
                      const SizedBox(width: 1),
                      Text(
                        '${player.points}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const Text(
                        ' PTS',
                        style: TextStyle(
                            fontSize: 9,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),

                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 1
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