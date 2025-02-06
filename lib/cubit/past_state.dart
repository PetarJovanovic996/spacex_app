part of 'past_cubit.dart';

abstract class PastState extends Equatable {
  const PastState();
}

final class PastInitial extends PastState {
  @override
  List<Object> get props => [];
}

class PastLaunchesLoaded extends PastState {
  const PastLaunchesLoaded(this.launches);
  final List<Launch> launches;
  @override
  List<Object?> get props => [launches];
}

class PastLaunchError extends PastState {
  const PastLaunchError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

class LatestLoaded extends PastState {
  const LatestLoaded(this.launch);
  final Launch launch;
  @override
  List<Object?> get props => [launch];
}
