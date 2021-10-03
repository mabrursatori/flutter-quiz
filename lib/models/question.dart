part of 'models.dart';

class Question extends Equatable {
  final int id;
  final String title;
  final String question;
  final String trueAnswer;
  final List<String> answers;
  final String description;
  final String quran;
  final String quranTranslate;
  final String hadits;
  final String haditsTranslate;
  final String kitab;
  final String kitabTranslate;
  final String assetUrl;
  final bool isFinish;

  Question(
      {@required this.id,
      @required this.title,
      @required this.question,
      @required this.trueAnswer,
      @required this.answers,
      @required this.description,
      @required this.quran,
      @required this.quranTranslate,
      @required this.hadits,
      @required this.haditsTranslate,
      @required this.kitab,
      @required this.kitabTranslate,
      @required this.assetUrl,
      @required this.isFinish});

  @override
  List<Object> get props => [
        id,
        title,
        question,
        trueAnswer,
        answers,
        description,
        quran,
        quranTranslate,
        hadits,
        haditsTranslate,
        kitab,
        kitabTranslate,
        assetUrl,
        isFinish
      ];

  factory Question.fromJson(Map<String, dynamic> json) {
    List<String> answersTemp = (json['answers'] as List).map((e) {
      return e.toString();
    }).toList();
    return Question(
        id: json['id'],
        question: json['question'],
        title: json['title'],
        trueAnswer: json['trueAnswer'],
        answers: answersTemp,
        description: json['description'],
        quran: json['quran'],
        quranTranslate: json['quranTranslate'],
        hadits: json['hadits'],
        haditsTranslate: json['haditsTranslate'],
        kitab: json['kitab'],
        kitabTranslate: json['kitabTranslate'],
        assetUrl: json['asset_url'],
        isFinish: json['isFinish']);
  }

  Map toJson() => {
        "id": id,
        "question": question,
        "title": title,
        "trueAnswer": trueAnswer,
        "answers": answers,
        "description": description,
        "quran": quran,
        "quranTranslate": quranTranslate,
        "hadits": hadits,
        "haditsTranslate": haditsTranslate,
        "kitab": kitab,
        "kitabTranslate": kitabTranslate,
        "asset_url": assetUrl,
        "isFinish": isFinish
      };

  Question copyWith({bool isFinish}) => Question(
      id: this.id,
      title: this.title,
      question: this.question,
      trueAnswer: this.trueAnswer,
      answers: this.answers,
      description: this.description,
      quran: this.quran,
      quranTranslate: this.quranTranslate,
      hadits: this.hadits,
      haditsTranslate: this.haditsTranslate,
      kitab: this.kitab,
      kitabTranslate: this.kitabTranslate,
      assetUrl: this.assetUrl,
      isFinish: isFinish ?? this.isFinish);
}
