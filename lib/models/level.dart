part of 'models.dart';

class Level extends Equatable {
  final int level;
  final bool isFinish;
  final List<Question> questions;

  Level(
      {@required this.level,
      @required this.isFinish,
      @required this.questions});

  @override
  List<Object> get props => [level, isFinish, questions];

  factory Level.fromJson(Map<String, dynamic> jsonMap) {
    List<Question> list;
    if (jsonMap['questions'] is String) {
      List strlist = json.decode(jsonMap['questions']);
      list = strlist.map((e) => Question.fromJson(e)).toList();
    } else {
      list = (jsonMap['questions'] as List)
          .map((e) => Question.fromJson(e))
          .toList();
    }
    return Level(
        level: jsonMap['level'],
        isFinish: jsonMap['isFinish'],
        questions: list);
  }

  Map toJson() => {
        "level": level,
        "isFinish": isFinish,
        "questions": jsonEncode(questions)
      };

  Level copyWith({bool isFinish}) => Level(
      isFinish: isFinish ?? this.isFinish,
      level: this.level,
      questions: this.questions);
}
