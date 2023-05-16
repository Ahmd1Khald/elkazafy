import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/players_cubit.dart';

class Test extends StatelessWidget {
  const Test({super.key});
  @override
  Widget build(BuildContext context) {
    final result = PlayersCubit.get(context).myplayers;
    return BlocConsumer<PlayersCubit, PlayersState>(
      listener: (context, state) {
        if (state is PlayersLoading) {
          const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        } else if (state is PlayersSuccess) {
          print(state.players);
        } else if (state is PlayersError) {
          print("Error");
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text("Player"),
        ),
        body: SafeArea(
          child: buildPlayerList(result),
        ),
      ),
    );
  }
}

Widget buildPlayerList(List player) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 2 / 3,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
    ),
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    padding: EdgeInsets.zero,
    itemCount: player.length,
    itemBuilder: (context, index) {
      // with clean code must create class put in it the design card and returned it in return
      return Text('');
    },
  );
}
