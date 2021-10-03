import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:quiz_twk/models/models.dart';
import 'package:quiz_twk/utils/utils.dart';

part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc() : super(ConfigInitial());

  @override
  Stream<ConfigState> mapEventToState(
    ConfigEvent event,
  ) async* {
    if (event is LoadConfig) {
      List<Level> config = await SharedPreference.getSession(key: "config");
      if (config != null) {
        yield ConfigLoaded(config: config);
      } else {
        try {
          var jsonText = await rootBundle.loadString('json/config.json');
          List list = json.decode(jsonText);
          config = list.map((e) => Level.fromJson(e)).toList();
          config =
              await SharedPreference.setSession(key: "config", data: config);
          yield ConfigLoaded(config: config);
        } catch (e) {
          print("===============${e.toString()}==============");
          yield ConfigLoaded(config: config);
        }
      }
    } else if (event is UpdateConfig) {
      int indexLevel = event.indexLevel;
      int indexQuestion = event.indexQuestion;
      List<Level> levels = (state as ConfigLoaded).config;
      //Update isFinish Level when in the last Question
      if (indexQuestion == 9) {
        Level newLevel = levels[indexLevel].copyWith(isFinish: true);
        levels.removeAt(indexLevel);
        levels.insert(indexLevel, newLevel);
      }
      //Update Question isFinish
      List<Level> updatedlevels = levels.map((e) {
        if (levels.indexOf(e) == indexLevel) {
          Question newQuestion =
              e.questions[indexQuestion].copyWith(isFinish: true);
          e.questions.removeAt(indexQuestion);
          e.questions.insert(indexQuestion, newQuestion);
        }
        return e;
      }).toList();

      updatedlevels =
          await SharedPreference.setSession(key: "config", data: levels);
      yield ConfigLoaded(config: updatedlevels);
    }
  }
}
