import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_app/models/launch_model.dart';
import 'package:spacex_app/services/spacex_service.dart';

part 'single_state.dart';

class SingleCubit extends Cubit<SingleState> {
  SingleCubit(this._spaceXService) : super(SingleInitial());

  final SpaceXService _spaceXService;

  Future<void> fetchSingleLaunches(String id) async {
    emit(SingleLaunchLoading());
    try {
      final singleLaunch = await _spaceXService.getSingleLaunch(id);

      emit(SingleLaunchLoaded(singleLaunch));
    } catch (e) {
      emit(SingleLaunchError(e.toString()));
    }
  }
}
