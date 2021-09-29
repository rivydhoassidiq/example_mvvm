import 'package:example_mvm_architecture/model/user.dart';
import 'package:example_mvm_architecture/ui/main_page.dart';
import 'package:example_mvm_architecture/view/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => UserBloc(),
        child: MainPage(),
      ),
    );
  }
}
