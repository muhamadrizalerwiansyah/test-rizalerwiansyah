import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_rizal/home/repositories/services/home_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    final HomeService service = HomeService();
    on<Submit>((Submit event, Emitter<HomeState> emit) async {
      try {
        emit(HomeLoading());
        final Map<String, dynamic> data = {
          'staffId': event.staffId,
          'name': event.name,
          'hobby': event.hobby,
          'password': event.password,
        };
        final request = await service.submit(data, true);
        if (request) {
          emit(SubmitSuccess(message: "Berhasil"));
        } else {
          emit(SubmitError(message: "Gagal"));
        }
      } catch (e) {
        emit(SubmitError(message: e.toString()));
      }
    });
  }
}
