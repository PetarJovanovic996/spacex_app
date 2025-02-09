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

class FutureAndNextLaunchLoaded extends FutureState {
  const FutureAndNextLaunchLoaded(this.futureLaunches, this.nextLaunch);

  final List<Launch> futureLaunches;
  final Launch nextLaunch;

  @override
  List<Object?> get props => [futureLaunches, nextLaunch];
}

class NextLaunchLoaded extends FutureState {
  const NextLaunchLoaded(this.nextLaunch);

  final Launch nextLaunch;

  @override
  List<Object?> get props => [nextLaunch];
}
