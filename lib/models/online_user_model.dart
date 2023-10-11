import 'package:intl/intl.dart';

class OnlineUserModel {
  late String title;
  late String subTitle;
  late String date;
  late String image;

  OnlineUserModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.image,
  });
}

List<OnlineUserModel> dummyOnlineUsers = [
  OnlineUserModel(
    date: DateFormat('hh:mm a').format(DateTime.now().add(const Duration(hours: 1))),
    title: 'Ahmed Mahmoud',
    subTitle: 'How can I help you',
    image: 'assets/images/person.png',
  ),
  OnlineUserModel(
    date: DateFormat('hh:mm a').format(DateTime.now().add(const Duration(hours: 1))),
    title: 'Ahmed Mahmoud',
    subTitle: 'How can I help you',
    image: 'assets/images/person.png',
  ),
  OnlineUserModel(
    date: DateFormat('hh:mm a').format(DateTime.now().add(const Duration(hours: 1))),
    title: 'Ahmed Mahmoud',
    subTitle: 'How can I help you',
    image: 'assets/images/person.png',
  ),
  OnlineUserModel(
    date: DateFormat('hh:mm a').format(DateTime.now().add(const Duration(hours: 1))),
    title: 'Ahmed Mahmoud',
    subTitle: 'How can I help you',
    image: 'assets/images/person.png',
  ),
  OnlineUserModel(
    date: DateFormat('hh:mm a').format(DateTime.now().add(const Duration(hours: 1))),
    title: 'Ahmed Mahmoud',
    subTitle: 'How can I help you',
    image: 'assets/images/person.png',
  ),
  OnlineUserModel(
    date: DateFormat('hh:mm a').format(DateTime.now().add(const Duration(hours: 1))),
    title: 'Ahmed Mahmoud',
    subTitle: 'How can I help you',
    image: 'assets/images/person.png',
  ),
  OnlineUserModel(
    date: DateFormat('hh:mm a').format(DateTime.now().add(const Duration(hours: 1))),
    title: 'Ahmed Mahmoud',
    subTitle: 'How can I help you',
    image: 'assets/images/person.png',
  ),
  OnlineUserModel(
    date: DateFormat('hh:mm a').format(DateTime.now().add(const Duration(hours: 1))),
    title: 'Ahmed Mahmoud',
    subTitle: 'How can I help you',
    image: 'assets/images/person.png',
  ),
];
