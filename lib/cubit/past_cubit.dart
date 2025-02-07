import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_app/models/launch_model.dart';
import 'package:spacex_app/services/spacex_service.dart';

part 'past_state.dart';

class PastCubit extends Cubit<PastState> {
  PastCubit(this._spaceXService) : super(PastInitial()) {
    fetchPastLaunches();
    fetchLatestLaunch();
  }

  final SpaceXService _spaceXService;

  Future<void> fetchPastLaunches() async {
    // TODO: Missing loading state
    try {
      final pastLaunches = await _spaceXService.getPastLaunches();

      emit(PastLaunchesLoaded(pastLaunches));
    } catch (e) {
      emit(PastLaunchError(e.toString()));
    }
  }

  Future<void> fetchLatestLaunch() async {
    // TODO: Missing loading state
    try {
      final latestLaunch = await _spaceXService.getLatestLaunch();

      emit(LatestLoaded(latestLaunch));
    } catch (e) {
      emit(PastLaunchError(e.toString()));
    }
  }
}
