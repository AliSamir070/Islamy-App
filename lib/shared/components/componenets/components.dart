import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islamy_app/modules/quran/quran_view_screen.dart';
import 'package:islamy_app/providers/local_provider.dart';
import 'package:islamy_app/shared/components/styles/styles.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../models/Radios.dart';

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
            color: AppStyle.lightbaseColor,
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
class LocaleBottomSheet extends StatelessWidget{
  late LocaleProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: (){
                provider.changeLanguage('en');
                Navigator.pop(context);
              },
              child: getCheckedLanguage('en')
          ),
          SizedBox(
            height: 24,
          ),
          InkWell(
              onTap: (){
                provider.changeLanguage('ar');
                Navigator.pop(context);
              },
              child: getCheckedLanguage('ar')
          ),
        ],

      ),
    );
  }
  Widget getCheckedLanguage(String locale){
    return provider.locale==locale?Row(
      children: [
        Text(
          locale=='en'?'English':'العربية',
          style: TextStyle(
              fontSize: 20,
              color: AppStyle.lightbaseColor
          ),
        ),
        Spacer(),
        Icon(
          Icons.check_outlined,
          color: AppStyle.lightbaseColor,
        )
      ],
    ):Text(
      locale=='en'?'English':'العربية',
      style: TextStyle(
          fontSize: 20,
          color: Colors.black
      ),
    );
  }
}

class RadioController extends StatelessWidget {
  Radios radio ;
  AudioPlayer audioPlayer;
  RadioController({required this.radio , required this.audioPlayer});
  late LocaleProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              radio.name!,
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: (){
                    play();
                  },
                  icon: Icon(
                    Icons.play_arrow
                  ),
                  iconSize: 30,
                color: provider.mode == ThemeMode.light?Colors.black:Colors.white,
              ),
              SizedBox(width: 10,),
              IconButton(
                  onPressed: (){
                    pause();
                  },
                  icon: Icon(
                      Icons.pause
                  ),
                  iconSize: 30,
                  color: provider.mode == ThemeMode.light?Colors.black:Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }

  play()async{
    await audioPlayer.play(radio.radioUrl!);
  }
  pause() async{
    await audioPlayer.pause();
  }
}

