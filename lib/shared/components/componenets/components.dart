import 'package:flutter/material.dart';
import 'package:islamy_app/modules/quran/quran_view_screen.dart';
import 'package:islamy_app/shared/components/styles/styles.dart';

class SuraVerse extends StatelessWidget {
  String verseNumber;
  String verseName;
  String fileName;
  SuraVerse({required this.verseName ,required this.verseNumber , required this.fileName});
  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, QuranViewScreen.route,arguments: QuranViewArguments(
            fileName: fileName,
            suraName: verseName)
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            width:widthOfScreen*0.5,
            child: Text(
              verseNumber,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            color: AppStyle.baseColor,
            child: SizedBox(
              height: heightOfScreen*0.06,
              width: 4,
            ),
          ),
          Container(
            width:widthOfScreen*0.45,
            alignment: Alignment.center,
            child: Text(
              verseName,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }
}
