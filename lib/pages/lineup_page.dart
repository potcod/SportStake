import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../Player.dart';
import '../widgets/playerCard.dart';


class LineUpPage extends StatelessWidget {
  const LineUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: chart(),
          ),
          balance(),
          myLineups(),

        ],
      )
    );
  }
}

Widget chart(){
  final List<FlSpot> balanceData = [ //temp hardcoded data
    FlSpot(0, 100),
    FlSpot(1, 120),
    FlSpot(2, 115),
    FlSpot(3, 130),
  ];

  return LineChart(
    LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(1, 2),
            FlSpot(2, 4),
          ],
          isCurved: true,
          color: Colors.blue,
          belowBarData: BarAreaData(
            show: true,
            color: Colors.blue.withOpacity(0.3),
          ),
        ),
      ],
    ),
  );
}

Widget balance(){
  final int cashBalance = 300;
  final int atRisk = 200;
  final int totalBalance = 500;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      dataRow("Cash Balance", "\$$cashBalance"),
      dataRow("At Risk", "\$$atRisk"),
      dataRow("Total Balance", "\$$totalBalance"),
    ],
  );

}
Widget dataRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 16)),
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

class Bet {
  final List<Player> betList;

  //later on should receive jersey number and a list of team colors to color a preset jersey image

  Bet({required this.betList});
}
Widget myLineups(){
  final List<Bet> userBets = [
    Bet(betList: [
      mockPlayers[0]
    ]),
    Bet(betList: [
      mockPlayers[1],
      mockPlayers[2]
    ]),
    Bet(betList: [
      mockPlayers[3],
      mockPlayers[4],
    ]),
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: userBets.map((bet) {

      return Card( // Keep the card per entire bet group
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, // Vertically align items in this row
            children: [
              Expanded( //Expanded so that it takes all the available space
                child: Wrap(
                  children: bet.betList.map((player) {
                    return PlayerCard(player: player); // Use the PlayerCard for each player
                  }).toList(),
                ),
              ),
              const SizedBox(width: 16), // Space between player cards and button

              // List button
              ElevatedButton(
                onPressed: () {
                  // Add logic when needed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20), // Padding for button size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),

                ),
                child: const Text(
                  "List\n\$100 ->\$175", // Temp numbers
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
              )
            ],
          ),
        ),
      );
    }).toList(),
  );

}


