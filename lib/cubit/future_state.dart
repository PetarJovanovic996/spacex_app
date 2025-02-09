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

class FutureLaunchLoaded extends FutureState {
  const FutureLaunchLoaded(this.futureLaunches);

  final List<Launch> futureLaunches;

  @override
  List<Object?> get props => [futureLaunches];
}

class NextLaunchLoaded extends FutureState {
  const NextLaunchLoaded(this.nextLaunch);

  final Launch nextLaunch;

  @override
  List<Object?> get props => [nextLaunch];
}
