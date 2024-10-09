import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus/presentation/home/bloc/home_bloc.dart';
import 'package:technaureus/presentation/home/bloc/home_event.dart';
import 'package:technaureus/presentation/home/bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc()..add(LoadMatches()), // Load matches on screen load
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HomeLoaded) {
              return ListView.builder(
                itemCount: state.matches.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.matches[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        // Add shortlisting functionality here
                      },
                    ),
                  );
                },
              );
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            }
            return Container(); // Fallback
          },
        ),
      ),
    );
  }
}
