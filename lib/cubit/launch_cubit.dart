import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_app/models/launch_model.dart';
import 'package:spacex_app/services/cache_service.dart';
import 'package:spacex_app/services/spacex_service.dart';

part 'launch_state.dart';

class LaunchCubit extends Cubit<LaunchState> {
  LaunchCubit(this._spaceXService, this._cacheService) : super(LaunchInitial());

  final SpaceXService _spaceXService;
  final CacheService _cacheService;

  Future<void> fetchAllLaunches() async {
    emit(LaunchLoading());
    try {
      final cachedLaunches = await _cacheService.getCachedLaunches();

      if (cachedLaunches.isNotEmpty) {
        final List<Launch> launches = cachedLaunches
            .map((launchJson) => Launch.fromJson(launchJson))
            .toList();
        emit(LaunchLoaded(launches));
        return;
      }

      final allLaunches = await _spaceXService.getAllLaunches();
      await _cacheService
          .cacheLaunches(allLaunches.map((launch) => launch.toJson()).toList());

      emit(LaunchLoaded(allLaunches));
    } catch (e) {
      emit(LaunchError(e.toString()));
    }
  }
}
