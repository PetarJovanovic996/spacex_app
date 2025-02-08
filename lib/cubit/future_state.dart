part of 'future_cubit.dart';

abstract class FutureState extends Equatable {
  const FutureState();
}

class FutureInitial extends FutureState {
  @override
  List<Object> get props => [];
}

class FutureLaunchLoading extends FutureState {
  @override
  List<Object?> get props => [];
}

class FutureLaunchError extends FutureState {
  const FutureLaunchError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

class FutureLoaded extends FutureState {
  const FutureLoaded(this.futureLaunches);

  final List<Launch> futureLaunches;

  @override
  List<Object?> get props => [futureLaunches];
}

class NextLaunchLoaded extends FutureState {
  const NextLaunchLoaded(this.launch);
  final Launch launch;
  @override
  List<Object?> get props => [launch];
}
