import 'package:json_annotation/json_annotation.dart';
part 'question.g.dart';

@JsonSerializable()
class Question {
  final String type;
  final String difficulty;
  final String category;
  final String question;
 
  @JsonKey(name: 'correct_answer')
  final String correctAnswer;

  @JsonKey(name: 'incorrect_answers')
  final List<String> incorrectAnswers;


  Question({
    required this.type,
    required this.difficulty,
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
