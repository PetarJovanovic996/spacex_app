import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_app/models/launch_model.dart';
import 'package:spacex_app/services/spacex_service.dart';

part 'past_state.dart';

class PastCubit extends Cubit<PastState> {
  PastCubit(this._spaceXService) : super(PastInitial());

  final SpaceXService _spaceXService;

  Future<void> fetchPastLaunches() async {
    try {
      final pastLaunches = await _spaceXService.getPastLaunches();

      emit(PastLaunchesLoaded(pastLaunches));
    } catch (e) {
      emit(LaunchError(e.toString()));
    }
  }

  Future<void> fetchLatestLaunch() async {
    try {
      final latestLaunch = await _spaceXService.getLatestLaunch();

      emit(LatestLoaded(latestLaunch));
    } catch (e) {
      emit(LaunchError(e.toString()));
    }
  }
}
