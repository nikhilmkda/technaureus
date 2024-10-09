import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus/presentation/home/bloc/home_event.dart';
import 'package:technaureus/presentation/home/bloc/home_state.dart';

// Bloc class
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadMatches>((event, emit) async {
      emit(HomeLoading());
      try {
        // Simulate API call
        final matches = await Future.delayed(Duration(seconds: 2), () => ['User1', 'User2']);
        emit(HomeLoaded(matches));
      } catch (error) {
        emit(HomeError('Failed to load matches'));
      }
    });
  }
}
