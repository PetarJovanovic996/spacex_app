part of 'past_cubit.dart';

abstract class PastState extends Equatable {
  const PastState();
}

class PastInitial extends PastState {
  @override
  List<Object> get props => [];
}

class PastLaunchLoading extends PastState {
  @override
  List<Object?> get props => [];
}

class PastLaunchError extends PastState {
  const PastLaunchError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

class PastAndLatestLoaded extends PastState {
  const PastAndLatestLoaded(this.pastLaunches, this.latestLaunch);

  final List<Launch> pastLaunches;
  final Launch latestLaunch;

  @override
  List<Object?> get props => [pastLaunches, latestLaunch];
}
