class Strong {
  final double strength_level = 2222.987;
}

class QuickRunner {
  void runQuick() {
    print('run~!');
  }
}

enum Team { blue, red }

class Player with Strong, QuickRunner {
  // Mixins (without constructor)
  final Team team;

  Player({
    required this.team,
  });
}

void main() {
  var player = Player(
    team: Team.red,
  );

  player.runQuick();
  print(player.strength_level);
}
