import 'package:games/questions.dart';

class AppBrain {
  List<Question> _questionGroup = [
    Question(
      questionText: 'عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب',
      questionImage: 'images/image-1.jpg',
      questionAnswer: true,
    ),
    Question(
      questionText: 'القطط هي حيوانات لاحمة',
      questionImage: 'images/image-2.jpg',
      questionAnswer: true,
    ),
    Question(
      questionText: 'الصين موجودة في القارة الافريقية',
      questionImage: 'images/image-3.jpg',
      questionAnswer: false,
    ),
    Question(
      questionText: 'الارض مسطحة و ليس كروية',
      questionImage: 'images/image-4.jpg',
      questionAnswer: false,
    ),
    Question(
      questionText: 'يستطيع الانسان البقاء على قيد الحياة دون اكل اللحوم',
      questionImage: 'images/image-5.jpg',
      questionAnswer: true,
    ),
    Question(
      questionText: 'الشمس تدور حول الارض و الارض تدور حول القمر',
      questionImage: 'images/image-6.jpg',
      questionAnswer: false,
    ),
    Question(
      questionText: 'الحيوانات لا تشعر بالالم',
      questionImage: 'images/image-7.jpg',
      questionAnswer: false,
    ),
  ];

  var _questionNum = 0;

  void nextQuestion() {
    if (_questionNum < _questionGroup.length - 1) {
      _questionNum++;
    }
  }

  String getQuestionText() {
    return _questionGroup[_questionNum].questionText;
  }

  String getQuestionImage() {
    return _questionGroup[_questionNum].questionImage;
  }

  bool getQuestionAnswer() {
    return _questionGroup[_questionNum].questionAnswer;
  }

  bool isFinised() {
    if (_questionNum >= _questionGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNum = 0;
  }
}
