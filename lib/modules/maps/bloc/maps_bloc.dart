import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:maps/modules/maps/models/areas.dart';
import 'package:maps/modules/maps/bloc/maps_events.dart';
import 'package:maps/modules/maps/bloc/maps_states.dart';
import 'package:maps/modules/maps/repositories/areasService.dart';
import 'package:maps/modules/maps/repositories/exceptions.dart';
class AreasBloc extends Bloc<AreasEvents, AreasState> {
  late final AreasRepo areasRepo;
  late List<Areas> areas;

   AreasBloc({required this.areasRepo}) : super(AreasInitState());

  @override
  Stream<AreasState> mapEventToState(AreasEvents event) async* {
    switch (event) {
      case AreasEvents.fetchAreas:
        yield AreasLoading();
        try {
          areas = await areasRepo.getAreasList();
          yield AreasLoaded(areas: areas);
        } on SocketException {
          yield AreasListError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield AreasListError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield AreasListError(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          yield AreasListError(
            error: UnknownException('Unknown Error'),
          );
        }
        break;
    }
  }
}
