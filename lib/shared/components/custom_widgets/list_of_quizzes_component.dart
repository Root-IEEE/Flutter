import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/colors.dart';

class ListOfQuizzesComponents extends StatelessWidget {
  String title;
  String subTitle;
  Function? function;

  ListOfQuizzesComponents({
    required this.title,
    required this.subTitle,
    this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          height: 170,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/icons/clipboard-textIcons.svg',
                          width: 32),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        subTitle,
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 15),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(children: [
                          Text(
                            'Open',
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 15,
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.w600),
                          ),
                          Icon(Icons.arrow_right, color: AppColors.mainColor,)

                        ]),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        function!();
      },
    );
  }
}
