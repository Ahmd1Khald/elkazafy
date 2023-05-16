import 'package:elkazafy/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/players_cubit.dart';
import 'data_layer/repositories/players_repository.dart';
import 'data_layer/web_services/players_web_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late PlayersRepository playersRespostry =
      PlayersRepository(player_web_services: PlayerWebServices());

  late PlayersCubit playerCubit = PlayersCubit(playersRespostry)
    ..getAllPlayers();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlayersCubit(playersRespostry)..getAllPlayers(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // onGenerateRoute: (settings) => appRouter.generateRoute(settings),
        initialRoute: '/',
        routes: {
          '/': (context) => Test(),
          // 'nextPage': (context) => NextPage(),
        },
      ),
    );
  }
}
