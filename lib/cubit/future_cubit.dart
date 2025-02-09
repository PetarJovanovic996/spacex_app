import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_app/models/launch_model.dart';
import 'package:spacex_app/services/spacex_service.dart';

part 'future_state.dart';

class FutureCubit extends Cubit<FutureState> {
  FutureCubit(this._spaceXService) : super(FutureInitial()) {
    fetchNextLaunch();
  }

  final SpaceXService _spaceXService;

  Future<void> fetchNextLaunch() async {
    emit(FutureLaunchLoading());
    try {
      final nextLaunch = await _spaceXService.getNextLaunch();

      emit(NextLaunchLoaded(nextLaunch));
    } catch (e) {
      emit(FutureLaunchError(e.toString()));
    }
  }

  Future<void> fetchFutureLaunches() async {
    emit(FutureLaunchLoading());
    try {
      final futureLaunches = await _spaceXService.getFutureLaunches();

      emit(FutureLaunchLoaded(futureLaunches));
    } catch (e) {
      emit(FutureLaunchError(e.toString()));
    }
  }

  Future<void> toggleLaunches() async {
    try {
      final futureLaunches = await _spaceXService.getFutureLaunches();
      if (state is NextLaunchLoaded) {
        emit(FutureLaunchLoaded(futureLaunches));
      } else {
        final nextLaunch = await _spaceXService.getNextLaunch();
        emit(NextLaunchLoaded(nextLaunch));
      }
    } catch (e) {
      emit(FutureLaunchError(e.toString()));
    }
  }
}
