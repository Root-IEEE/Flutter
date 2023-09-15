import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(children: [
          RichText(
            text: TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 16),
                children: [
                  const TextSpan(text: 'Welcome,\n'),
                  TextSpan(
                    text: 'Ahmed Mahmoud',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ]),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  'assets/icons/notification-bing.svg',
                ),
              )),
        ]),
      ),
    ));
  }
}
