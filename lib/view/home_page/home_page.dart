import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questioner/bloc/question_bloc/question_bloc.dart';

import '../view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Start a test?'),
            ElevatedButton(
              onPressed: () {
                context.read<QuestionBloc>().add(QuestionsLoad());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: context.read<QuestionBloc>(),
                      child: const QuestionPage(),
                    ),
                  ),
                );
              },
              child: Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}
