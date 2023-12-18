part of 'homescreen_cubit.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object> get props => [];
}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenHrLoading extends HomeScreenState {}

class HomeScreenHrSuccess extends HomeScreenState {}

class HomeScreenHrFailed extends HomeScreenState {
  const HomeScreenHrFailed(this.message);
  final String message;
}

class HomeScreenITLoading extends HomeScreenState {}

class HomeScreenITSuccess extends HomeScreenState {}

class HomeScreenITFailed extends HomeScreenState {
  const HomeScreenITFailed(this.message);
  final String message;
}
