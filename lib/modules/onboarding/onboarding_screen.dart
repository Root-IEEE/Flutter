import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/components/constants/navigation_helper.dart';
import '../../shared/network/local/shared_preferences_helper.dart';
import '../../shared/styles/colors.dart';
import '../auth/login/login_screen.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.body, required this.title});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boardingList = [
    BoardingModel(
        image: 'assets/images/onboarding1.png',
        body: 'Screen Body 1',
        title: 'An\ninvestment in\nknowledge\npays the best\ninterest.'),
    BoardingModel(
        image: 'assets/images/onboarding2.png',
        body: 'Screen Body 2',
        title: 'An\ninvestment in\nknowledge\npays the best\ninterest.'),
    BoardingModel(
        image: 'assets/images/onboarding3.png',
        body: 'Screen Body 3',
        title: 'An\ninvestment in\nknowledge\npays the best\ninterest.'),
  ];

  PageController boardController = PageController();

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateToAndKill(context, LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (int index) {
                if (index == boardingList.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              controller: boardController,
              itemBuilder: (context, index) =>
                  buildBoardingItem(boardingList[index]),
              physics: const BouncingScrollPhysics(),
              itemCount: boardingList.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 20),
            child: Text(
              'get started with UR PROF',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
            child: SizedBox(
              width: double.infinity,
              height: 60.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  elevation: 5,
                  backgroundColor: AppColors.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  shadowColor: AppColors.mainColor,
                ),
                onPressed: () {
                  if (isLast) {
                    submit();
                  }
                  boardController.nextPage(
                    duration: const Duration(milliseconds: 750),
                    curve: Curves.fastLinearToSlowEaseIn,
                  );
                },
                child: Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          isLast ? 'Continue' : 'Get Started',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(right: 25.0),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        children: [
          Stack(alignment: Alignment.centerLeft, children: [
            Image(
              image: AssetImage(model.image),
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(200.0),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                model.title,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            Positioned(
                left: 20.0, // Adjust the left position as needed
                bottom: 20.0,
                child: SmoothPageIndicator(
                  controller: boardController,
                  count: boardingList.length,
                  effect: const ScrollingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.white,
                      activeDotScale: 2,
                      activeStrokeWidth: 2,
                      dotWidth: 5,
                      dotHeight: 5),
                )),
            Positioned(
                left: 20.0, // Adjust the left position as needed
                top: 60.0,
                child: Image.asset('assets/images/logo white.png',width: 120)),
          ]),
        ],
      );
}
