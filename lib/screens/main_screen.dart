import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_scissors_app/bloc/game_bloc.dart';
import 'package:rock_scissors_app/bloc/game_event.dart';
import 'package:rock_scissors_app/bloc/game_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late GameBloc gameBloc;

  @override
  void initState() {
    super.initState();
    gameBloc = GameBloc('');
  }

  @override
  void dispose() {
    super.dispose();
    gameBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Some text'),
        actions: const [],
      ),
      body: Center(
        child: BlocBuilder<GameBloc, ChoiseState>(
          bloc: gameBloc,
          builder: (_, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Сделайте свой выбор :',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  width: MediaQuery.of(context).size.height / 2.0,
                  height: MediaQuery.of(context).size.height / 16.0,
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          gameBloc.add(
                            ChoiseEvent(
                              choise: gameBloc.parametres
                                  .firstWhere((element) => element == 'Камень'),
                            ),
                          );
                        },
                        child: Image.asset(
                          'lib/images/SeekPng.com_rock-on-png_3967087.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          gameBloc.add(
                            ChoiseEvent(
                              choise: gameBloc.parametres.firstWhere(
                                  (element) => element == 'Ножницы'),
                            ),
                          );
                        },
                        child: Image.asset(
                          'lib/images/D7mSLOMUIAAGYfa.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        child: Image.asset(
                          'lib/images/2e29f43a603936d.png',
                          fit: BoxFit.cover,
                        ),
                        onPressed: () {
                          gameBloc.add(
                            ChoiseEvent(
                              choise: gameBloc.parametres
                                  .firstWhere((element) => element == 'Бумага'),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Вы выбрали: ${state.select} ',
                    style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 50.0)),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Выбор алгоритма : ${state.response}',
                    style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 50.0)),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Результат : ${state.statusMessage}',
                    style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
