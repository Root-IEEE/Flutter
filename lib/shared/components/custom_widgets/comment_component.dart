import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentComponent extends StatelessWidget {
  String title;
  String subTitle;
  String image;
  Function? function;
  String date;

  CommentComponent({
    required this.title,
    required this.subTitle,
    required this.image,
    this.function,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 20, right: 20, bottom: 5.0, top: 5.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              onTap: () {
                function;
              },
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage(image),
              ),
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, fontSize: 16.0),
                ),
              ),
              subtitle: Text(
                subTitle,
              ),
              trailing: Text(
                date,
                style: GoogleFonts.notoSans(),
              ),
            ),
          )),
    );
  }
}
