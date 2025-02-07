part of 'single_cubit.dart';

abstract class SingleState extends Equatable {
  const SingleState();
}

final class SingleInitial extends SingleState {
  @override
  List<Object?> get props => [];
}

final class SingleLaunchLoading extends SingleState {
  @override
  List<Object?> get props => [];
}

class SingleLaunchLoaded extends SingleState {
  const SingleLaunchLoaded(this.launch);
  final Launch launch;
  @override
  List<Object?> get props => [launch];
}

class SingleLaunchError extends SingleState {
  const SingleLaunchError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}
