import 'package:intl/intl.dart';

class CommentModel {
  late String title;
  late String subTitle;
  late String date;
  late String image;

  CommentModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.image,
  });
}

List<CommentModel> dummyComments = [
  CommentModel(
    date: DateFormat('hh:mm a').format(DateTime.now().add(const Duration(hours: 1))),
    title: 'Ahmed Mahmoud',
    subTitle: 'How can I help you',
    image: 'assets/images/person.png',
  ),
  CommentModel(
    date: DateFormat('hh:mm a').format(DateTime.now().add(const Duration(hours: 1))),
    title: 'Ahmed Mahmoud',
    subTitle: 'How can I help you',
    image: 'assets/images/person.png',
  ),
  CommentModel(
    date: DateFormat('hh:mm a').format(DateTime.now().add(const Duration(hours: 1))),
    title: 'Ahmed Mahmoud',
    subTitle: 'How can I help you',
    image: 'assets/images/person.png',
  ),
  CommentModel(
    date: DateFormat('hh:mm a').format(DateTime.now().add(const Duration(hours: 1))),
    title: 'Ahmed Mahmoud',
    subTitle: 'How can I help you',
    image: 'assets/images/person.png',
  ),
];
