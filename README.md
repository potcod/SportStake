# Sporstake Intern Exam
A mobile application built with Flutter, for Sportstake, designed to showcase player statistics, allow users to create and manage their lineups, and participate in a simulated trading market for player bets.

Features: 
Player Browsing: View a grid of player cards with essential stats.

Category Filtering: Filter players by sport categories (Basketball, Soccer, Football, Baseball, Golf).

Event Display: See upcoming sports events.

Player Detail Modal: Tap on a player card to view detailed information, adjust wager points, and select between different stats (Points, Rebounds, Assists).

Lineup Management: Display and manage custom player lineups, aka bets.

Responsive UI: Designed to adapt to various screen sizes.


Prerequisites:

Have Flutter SDK installed, 
Install and setup Android Studio,
Have git to clone the repo,

Starting the Project:

run- git clone https://github.com/potcod/SportStake.git
     flutter run

If there's issues with flutter, try running - 
flutter doctor
flutter pub get
flutter clean

OVERVIEW:
When creating this application, I first started with items that'd be on all pages, which are the AppBar and the BottomNavigationBar. I made the pages for those first and the UI for the AppBar. 
Afterwards, I created the landing first as I felt that'd be the most important, then the other pages following it. As I was working on this project, I noticed a lot of the Widgets I used and UI 
were being re-used alot, so I made separate .dart files to keep them in and to use throughout my application, without having to rewrite it on each page. Some of the Widgets I created modified versions
of to better fit the needs of a certain page, even if they were very similar in what they did. A lot of the buttons don't have functionality, such as listing or buying bets, which I hope is ok as I was 
sometimes not sure what functionalities I was suppose to put for certain buttons.

Thank you.
                                            
