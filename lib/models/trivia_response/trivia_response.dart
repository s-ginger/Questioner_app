import '/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trivia_response.g.dart';


@JsonSerializable()
class TriviaResponse {
  @JsonKey(name: 'response_code')
  final int responseCode;

  final List<Question> results;

  TriviaResponse({
    required this.responseCode,
    required this.results,
  });

  factory TriviaResponse.fromJson(Map<String, dynamic> json) =>_$TriviaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TriviaResponseToJson(this);
}