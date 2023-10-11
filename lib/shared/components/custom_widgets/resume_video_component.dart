import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/colors.dart';

class ResumeVideoCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double lastVideoProgress;
  final Function() onTap;
  final double cardHeight;

  const ResumeVideoCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.lastVideoProgress,
    required this.onTap,
    required this.cardHeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 0.5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        height: cardHeight,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 11, 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/video_icon.svg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(8),
                            minHeight: 6,
                            value: lastVideoProgress,
                            backgroundColor: Colors.grey.shade200,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${(lastVideoProgress * 100).toStringAsFixed(0)}%',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.purpleGrey),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: [
                        Text(
                          'Resume',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.mainColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
