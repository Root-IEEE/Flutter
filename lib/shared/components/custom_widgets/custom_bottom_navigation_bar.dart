import 'package:e_learning/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<String> data;
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.data,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 20.0,
          left: 20.0,
          bottom: 10.0,
        ),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(34),
          child: SizedBox(
            height: 70,
            width: double.infinity,
            child: ListView.builder(
              itemCount: data.length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (ctx, i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    onTap(i);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: AnimatedContainer(
                      width: 50,
                      duration: const Duration(milliseconds: 250),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: i == currentIndex ? AppColors.mainColor : null,
                      ),
                      child: _buildButtonNavBarIcons(
                        iconPath: data[i],
                        colorFilter: i == currentIndex
                            ? const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Colors.grey,
                                BlendMode.srcIn,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonNavBarIcons({
    required String iconPath,
    required ColorFilter colorFilter,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SvgPicture.asset(
        iconPath,
        colorFilter: colorFilter,
      ),
    );
  }
}
