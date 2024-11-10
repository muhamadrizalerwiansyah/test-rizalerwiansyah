part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class SubmitSuccess extends HomeState {
  SubmitSuccess({required this.message});
  final String message;
}

final class SubmitError extends HomeState {
  SubmitError({required this.message});
  final String message;
}
