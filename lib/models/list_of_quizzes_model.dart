class ListOfQuizzesModel {
  late String title;
  late String description;


  ListOfQuizzesModel({required this.title,required this.description});

  ListOfQuizzesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];

  }
}

List dummyQuizzes = [
  ListOfQuizzesModel(
    title: 'Exam 1',
    description: 'First Unit second lesson'
  ),
  ListOfQuizzesModel(
    title: 'Exam 2',
    description: 'First Unit second lesson'
  ),
  ListOfQuizzesModel(
    title: 'Exam 3',
    description: 'First Unit second lesson '
  ),
  ListOfQuizzesModel(
    title: 'Exam 4',
    description: 'First Unit second lesson'
  ),

];