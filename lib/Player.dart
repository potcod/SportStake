class Player {
  final String name;
  final String imageUrl;
  final String category;
  final String jerseyImg;
  final int points;
  final int rebounds;
  final int assists;
  final String? opponent;
  final String? eventDate;
  final int? pointsWager;


  Player({required this.name, required this.imageUrl, required this.category, required this.jerseyImg, required this.points, required this.rebounds, required this.assists, this.opponent, this.eventDate, this.pointsWager});
}

List<Player> mockPlayers = [
  Player(
    name: "LeBron James",
    imageUrl: "https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=",
    category: "basketball",
    jerseyImg: 'https://upperdeckstore.com/media/catalog/product/l/e/lebron-james-autographed-los-angeles-lakers-gold-authentic-nike-jersey-93766-front_1_2.jpg?optimize=high&fit=bounds&height=570&width=570&canvas=570:570',
    points: 1,
    rebounds: 2,
    assists: 3,
    pointsWager: 56,
  ),
  Player(
    name: "Stephen Curry",
    imageUrl: "https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=",
    category: "basketball",
    jerseyImg: 'https://i.ebayimg.com/images/g/gwsAAOSw6l5ikRse/s-l1200.jpg',
    points: 4,
    rebounds: 5,
    assists: 6,
    pointsWager: 32,
  ),
  Player(
    name: "Lionel Messi",
    imageUrl: "https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=",
    category: "soccer", // Changed category to soccer
    jerseyImg: 'https://i.ebayimg.com/images/g/ifQAAOSwQXdkVMcG/s-l1200.jpg',
    points: 4,
    rebounds: 5, // For soccer, this might represent tackles or interceptions
    assists: 6,
    pointsWager: 59,
  ),
  Player(
    name: "Cristiano Ronaldo",
    imageUrl: "https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=",
    category: "soccer",
    jerseyImg: 'https://soccerwearhouse.com/cdn/shop/files/Portugal_2025_Home_Jersey_by_PUMA_-_Cristiano_Ronaldo.jpg?v=1736466474',
    points: 7, // goals
    rebounds: 1, // tackles
    assists: 2,
    pointsWager: 32,
  ),
  Player(
    name: "Tom Brady",
    imageUrl: "https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=",
    category: "football",
    jerseyImg: 'https://cdn11.bigcommerce.com/s-karer354/images/stencil/1280x1280/products/218844/862263/2_23_22_1433__70747.1645665667.jpg?c=2',
    points: 0,
    rebounds: 0,
    assists: 300,
    pointsWager: 21,
  ),
  Player(
    name: "Shaquille O'Neal",
    imageUrl: "https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=",
    category: "basketball",
    jerseyImg: 'https://lakersstore.com/cdn/shop/files/97-swingman-jersey_ss5_p-200472836_pv-2_u-yh4dlzcpumaehoik5jta_v-q2gqgybyxuyyih9fxgoi_1800x1800.png?v=1741727495',
    points: 5,
    rebounds: 0, // N/A
    assists: 0, // N/A
  ),
  Player(
    name: "Mike Trout",
    imageUrl: "https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=",
    category: "baseball",
    jerseyImg: 'https://fanatics.frgimages.com/los-angeles-angels/mens-mike-trout-red-los-angeles-angels-big-and-tall-replica-player-jersey_pi3770000_altimages_ff_3770000-484b1d147edf9b72b4a7alt3_full.jpg?_hv=2&w=600',
    points: 2,
    rebounds: 0, // N/A
    assists: 1,
  ),
];
