part of 'config_bloc.dart';

abstract class ConfigEvent extends Equatable {
  const ConfigEvent();

  @override
  List<Object> get props => [];
}

class LoadConfig extends ConfigEvent {
  @override
  List<Object> get props => [];
}

class UpdateConfig extends ConfigEvent {
  final int indexLevel;
  final int indexQuestion;

  UpdateConfig({@required this.indexLevel, this.indexQuestion});

  @override
  List<Object> get props => [indexLevel, indexQuestion];
}
