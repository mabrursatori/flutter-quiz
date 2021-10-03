part of 'config_bloc.dart';

abstract class ConfigState extends Equatable {
  const ConfigState();
  
  @override
  List<Object> get props => [];
}

class ConfigInitial extends ConfigState {}

class ConfigLoaded extends ConfigState{
  final List<Level> config;

  ConfigLoaded({@required this.config});

  @override
  List<Object> get props => [config];
}
