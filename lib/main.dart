import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'Player.dart';
import 'pages/pickem_page.dart';
import 'pages/trade_page.dart';
import 'pages/lineup_page.dart';
import 'pages/create_page.dart';
import 'pages/promos_page.dart';

void main() {
  runApp(const SportStakeApp());
}

class SportStakeApp extends StatelessWidget {
  const SportStakeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SportStake Intern Exam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const PlayerEntryScreen(),
    );
  }
}

class PlayerEntryScreen extends StatefulWidget {
  const PlayerEntryScreen({super.key});

  @override
  State<PlayerEntryScreen> createState() => _PlayerEntryScreenState();
}

class _PlayerEntryScreenState extends State<PlayerEntryScreen> {

  final List<Widget> _pages = const [ //import of views from /pages
    PickEmPage(),
    TradePage(),
    LineUpPage(),
    CreatePage(),
    PromosPage(),
  ];

  int selectedIndex = 2; //start at lineup page

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( //Global App Bar
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,

        title: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Available Balance",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  const Text( //Hard display balance for now
                    "\$100.00",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton( //Add to balance button
                    onPressed: (){
                      print("Add balance button pressed!");
                    },
                    icon: const Icon(Icons.add_circle),
                    color: Colors.blue,
                    iconSize: 18,
                    padding: EdgeInsets.zero,

                  ),
                ],
              ),
            ],
          ),
        ),
        leading: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.menu, color: Colors.black,)),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.info_outline, color: Colors.black,))
        ],

      ),


      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Pick em'),
            BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Trade'),
            BottomNavigationBarItem(icon: Icon(Icons.arrow_downward), label: 'My Lineup'),
            BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Create'),
            BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Promos')
          ],
        selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: onItemTapped,
      ),
      body: _pages[selectedIndex], //set body to whatever page is selected, instantiated at 2
    );
  }




}
