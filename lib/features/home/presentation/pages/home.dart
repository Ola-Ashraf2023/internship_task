import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_task/core/api/api_manager.dart';

import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(ApiManager())..add(GetProductEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
            if (state.screenStatus == ScreenStatus.failure) {
            showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Center(child: Text("An Error Occurred")),
                ));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Slash.",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.arrow_back),
            ),
            backgroundColor: Colors.black,
            body: Column(
              children: [
                Expanded(child: ListView.builder(
                  itemCount: state.products?.length,
                  itemBuilder: (context, index) {
                  return Text(state.products?[index].name??"error",style: TextStyle(color: Colors.white),);
                },))
              ],
            ),
          );
        },
      ),
    );
  }
}
