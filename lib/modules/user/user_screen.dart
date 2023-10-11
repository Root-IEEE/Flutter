import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../shared/components/constants/navigation_helper.dart';
import '../../shared/styles/colors.dart';
import '../change_info/change_email.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Settings',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/person.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Ahmed Mahmoud',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  '2y / secondary school',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.purpleGrey, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    onTap: () {
                      navigateTo(context, ChangeEmail());
                    },
                    title: Text(
                      'Change Email',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColors.purpleGrey,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                      onTap: () {
                        navigateTo(context, Container());
                      },
                      title: Text(
                        'Notifications',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                      trailing: Switch(
                        // This bool value toggles the switch.
                        value: light,
                        activeColor: AppColors.mainColor,

                        onChanged: (bool value) {
                          setState(() {
                            light = value;
                          });
                        },
                      )),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    onTap: () {
                      singOut(context);
                    },
                    title: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/logout.svg'),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Log Out',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
