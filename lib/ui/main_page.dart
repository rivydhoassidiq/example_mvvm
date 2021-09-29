import 'dart:math';

import 'package:example_mvm_architecture/model/user.dart';
import 'package:example_mvm_architecture/ui/user_card.dart';
import 'package:example_mvm_architecture/view/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  // const MainPage({Key? key}) : super(key: key);
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Example MVVM'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              bloc.add(random.nextInt(10) + 1);
            },
            color: Colors.blueGrey,
            child: const Text('Pick Random User'),
          ),
          BlocBuilder<UserBloc, User>(
              builder: (context, user) => (user is UninitializedUser)
                  ? Container()
                  : UserCard(user: user)),
        ],
      ),
    );
  }
}
