import '../models/players.dart';
import '../web_services/players_web_services.dart';

class PlayersRepository {
  // get instance from players web services to get data
  final PlayerWebServices player_web_services;

  PlayersRepository({required this.player_web_services});

  Future<List<Players>> getAllPlayer() async {
    final players = await player_web_services.getAllPlayer();
    return players.map((player) => Players.fromJson(player)).toList();
  }

  Future<Map<String, dynamic>> getPlayerData() async {
    final playerData = await player_web_services.getPlayerData();
    return playerData;
  }
}
