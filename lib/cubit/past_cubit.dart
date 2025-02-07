import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_app/models/launch_model.dart';
import 'package:spacex_app/services/spacex_service.dart';

part 'past_state.dart';

class PastCubit extends Cubit<PastState> {
  PastCubit(this._spaceXService) : super(PastInitial()) {
    fetchCombinedLaunches();
  }

  final SpaceXService _spaceXService;

  Future<void> fetchPastLaunches() async {
    emit(PastLaunchLoading());
    try {
      final pastLaunches = await _spaceXService.getPastLaunches();

      emit(PastLaunchesLoaded(pastLaunches));
    } catch (e) {
      emit(PastLaunchError(e.toString()));
    }
  }

  Future<void> fetchLatestLaunch() async {
    emit(PastLaunchLoading());
    try {
      final latestLaunch = await _spaceXService.getLatestLaunch();

      emit(LatestLoaded(latestLaunch));
    } catch (e) {
      emit(PastLaunchError(e.toString()));
    }
  }

  Future<void> fetchCombinedLaunches() async {
    emit(PastLaunchLoading());
    try {
      final results = await Future.wait([
        _spaceXService.getPastLaunches(),
        _spaceXService.getLatestLaunch(),
      ]);

      final pastLaunches = results[0] as List<Launch>;

      final latestLaunch = results[1] as Launch;

      emit(PastAndLatestLoaded(pastLaunches, latestLaunch));
    } catch (e) {
      emit(PastLaunchError(e.toString()));
    }
  }
}
