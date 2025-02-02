import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_app/models/launch_model.dart';
import 'package:spacex_app/services/spacex_service.dart';

part 'launch_state.dart';

class LaunchCubit extends Cubit<LaunchState> {
  LaunchCubit(this._spaceXService) : super(LaunchInitial());

  final SpaceXService _spaceXService;

  Future<void> fetchAllLaunches() async {
    emit(LaunchLoading());
    try {
      final allLaunches = await _spaceXService.getAllLaunches();
      emit(LaunchLoaded(allLaunches));
    } catch (e) {
      emit(LaunchError(e.toString()));
    }
  }
}
