import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data_layer/models/players.dart';
import '../../data_layer/repositories/players_repository.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  final PlayersRepository playerReposetory;
  late List<Players> myplayers = [];
  late Map<String, dynamic> getplayersData = {};

  static PlayersCubit get(context) => BlocProvider.of(context);

  PlayersCubit(this.playerReposetory) : super(PlayersInitial());
  // get data from repostory
  void getAllPlayers() {
    emit(PlayersLoading());
    playerReposetory.getAllPlayer().then((players) {
      //emit => to release data to ui
      emit(PlayersSuccess(players));
      myplayers = players;
      print('++++++++++++++++');
      print(myplayers.asMap());
    }).catchError((error) {
      emit(PlayersError(error));
    });
  }

  //function for get player data
  Map<String, dynamic> getplayerData() {
    playerReposetory.getPlayerData().then((player) {
      emit(getPlayersDataLoaded(player));
      this.getplayersData = player;
    });
    return getplayersData;
  }
}
