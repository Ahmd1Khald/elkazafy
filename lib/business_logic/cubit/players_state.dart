part of 'players_cubit.dart';

@immutable
abstract class PlayersState {}

class PlayersInitial extends PlayersState {}

class PlayersSuccess extends PlayersState {
  // in case of list players has loaded
  final List<Players> players;

  PlayersSuccess(this.players);
}

class PlayersLoading extends PlayersState {}

class PlayersError extends PlayersState {
  final String error;

  PlayersError(this.error);
}

class LoadingPlayerData extends PlayersState {
  final List<Players> players = [];
}

class ErrorPlayerData extends PlayersState {
  final List<Players> players = [];
}

class getPlayersDataLoaded extends PlayersState {
  // in case of list players has loaded
  final Map<String, dynamic> allplayers;
  getPlayersDataLoaded(this.allplayers);
}
