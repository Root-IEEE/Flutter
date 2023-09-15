import 'package:e_learining/models/online_user_model.dart';
import 'package:flutter/material.dart';
import '../../shared/components/custom_widgets/chat_component.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Messages',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 24,fontWeight: FontWeight.bold),
              ),
            ),
            ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: dummyOnlineUsers
                    .map((e) => ChatComponent(
                          title: e.title,
                          subTitle: e.subTitle,
                          image: e.image,
                          date: e.date,
                        ))
                    .toList()),
          ]),
        ),
      ),
    );
  }
}
