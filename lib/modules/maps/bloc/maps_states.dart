import 'package:equatable/equatable.dart';
import 'package:maps/modules/maps/models/areas.dart';

abstract class AreasState extends Equatable {
  @override
  List<Object> get props => [];
}

class AreasInitState extends AreasState {}

class AreasLoading extends AreasState {}

class AreasLoaded extends AreasState {
  final List<Areas> areas;

  AreasLoaded({required this.areas});
}

class AreasListError extends AreasState {
  final error;

  AreasListError({this.error});
}
