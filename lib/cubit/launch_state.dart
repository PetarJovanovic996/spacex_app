part of 'launch_cubit.dart';

abstract class LaunchState extends Equatable {
  const LaunchState();
}

class LaunchInitial extends LaunchState {
  @override
  List<Object?> get props => [];
}

class LaunchLoading extends LaunchState {
  @override
  List<Object?> get props => [];
}

class LaunchLoaded extends LaunchState {
  const LaunchLoaded(this.launches);
  final List<Launch> launches;
  @override
  List<Object?> get props => [launches];
}

class LaunchError extends LaunchState {
  const LaunchError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}
