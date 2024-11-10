// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class Submit extends HomeEvent {
  Submit({
    required this.staffId,
    required this.name,
    this.hobby,
    required this.password,
  });
  final String staffId;
  final String name;
  String? hobby;
  final String password;
}
