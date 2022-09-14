import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_scissors_app/bloc/game_event.dart';
import 'package:rock_scissors_app/bloc/game_state.dart';

class GameBloc extends Bloc<ChoiseEvent, ChoiseState> {
  GameBloc(initialState)
      : super(ChoiseState(response: '', select: '', statusMessage: '')) {
    on<ChoiseEvent>(_handleChoiseEvent);
  }

  final _random = Random();

  final List<String> parametres = [
    'Камень',
    'Ножницы',
    'Бумага',
  ];

  static const String _winMessage = 'Вы выиграли!';
  static const String _loseMessage = 'Вы проиграли!';
  static const String _draw = 'Ничья!';

  late String _output = '';

  void _handleChoiseEvent(ChoiseEvent event, Emitter emit) {
    for (int i = 0; i <= parametres.length; i++) {
      _output = parametres[_random.nextInt(parametres.length)];
    }

    if (event.choise == 'Камень' && _output == 'Ножницы') {
      emit(
        ChoiseState(
            statusMessage: _winMessage,
            response: _output,
            select: event.choise),
      );
    } else if (event.choise == 'Ножницы' && _output == 'Бумага') {
      emit(
        ChoiseState(
            statusMessage: _winMessage,
            response: _output,
            select: event.choise),
      );
    } else if (event.choise == 'Бумага' && _output == 'Камень') {
      emit(
        ChoiseState(
            statusMessage: _winMessage,
            response: _output,
            select: event.choise),
      );
    } else if (event.choise == _output) {
      emit(
        ChoiseState(
            statusMessage: _draw, response: _output, select: event.choise),
      );
    } else {
      emit(
        ChoiseState(
            statusMessage: _loseMessage,
            response: _output,
            select: event.choise),
      );
    }
  }
}
