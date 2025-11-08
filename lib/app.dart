import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questioner/bloc/question_bloc.dart';
import 'package:questioner/repository/repository.dart';
import 'package:questioner/view/question_page/question_page.dart';

import 'view/view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (context) => QuestionBloc(QuestionsRepoitory()),
        child: const QuestionPage(),
      )
    );
  }
}