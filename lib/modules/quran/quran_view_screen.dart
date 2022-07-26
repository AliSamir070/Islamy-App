import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared/components/styles/styles.dart';

class QuranViewScreen extends StatefulWidget {
  static String route = "Quran_view";

  @override
  State<QuranViewScreen> createState() => _QuranViewScreenState();
}

class _QuranViewScreenState extends State<QuranViewScreen> {
  String quranTxt = "";
  StringBuffer viewedQuran = StringBuffer();
  List<String> quranLines = [];

  @override
  Widget build(BuildContext context) {
    QuranViewArguments arguments = ModalRoute.of(context)!.settings.arguments as QuranViewArguments;
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;
    if(quranLines.isEmpty)readFromFile(arguments.fileName);
    return Stack(
      children:[
        Image(
          width: double.infinity,
          fit: BoxFit.fill,
          image: AssetImage(
              'assets/images/background.png'
          ),

        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Islamy',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black
            ),
          ),
          backgroundColor: Colors.transparent,
          body:quranLines.isEmpty?Center(child: CircularProgressIndicator()): Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(
                    start: widthOfScreen*0.05,
                    end: widthOfScreen*0.05,
                    top: heightOfScreen*0.05
                ),
                height: heightOfScreen*0.7,
                width: widthOfScreen*0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "سورة ${arguments.suraName} ",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        color: AppStyle.baseColor,
                        margin: EdgeInsets.symmetric(vertical: heightOfScreen*0.02),
                        child: SizedBox(
                          height: 3,
                          width: widthOfScreen*0.7,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            margin: const EdgeInsetsDirectional.all(8),
                            child: Text(
                              viewedQuran.toString(),
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]
    );
  }

  void readFromFile(String filename) async{
    quranTxt = await rootBundle.loadString("assets/files/$filename");
    quranLines = quranTxt.split("\n");
    for(int i=0;i<quranLines.length;i++){
      viewedQuran.write(quranLines[i]);
      viewedQuran.write(" (${i+1}) ");
    }
    setState((){

    });
  }
}
class QuranViewArguments{
  String suraName;
  String fileName;
  QuranViewArguments({required this.fileName , required this.suraName});
}
