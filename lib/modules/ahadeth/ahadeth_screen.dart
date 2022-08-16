import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/modules/ahadeth/ahadeth_view_screen.dart';

import '../../shared/components/styles/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AhadethScreen extends StatefulWidget {
  @override
  State<AhadethScreen> createState() => _AhadethScreenState();
}

class _AhadethScreenState extends State<AhadethScreen> {
  List<String> ahadethNames = [];
  List<String> ahadethText = [];

  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery
        .of(context)
        .size
        .height;
    double widthOfScreen = MediaQuery
        .of(context)
        .size
        .width;
    if (ahadethNames.isEmpty) readAhadethFile();
    return ahadethNames.isEmpty?Center(child: CircularProgressIndicator()):Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
              image: AssetImage(
                  'assets/images/ahadeth_image.png'
              )
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Column(
                children: [
                  Divider(
                    thickness: 3,
                    color: AppStyle.lightbaseColor,
                    height: 0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: heightOfScreen * 0.013),
                    alignment: Alignment.center,
                    child: Text(
                      '${AppLocalizations.of(context)?.ahadeth}',
                      style: TextStyle(
                          fontSize: 25
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                    color: AppStyle.lightbaseColor,
                    height: 0,
                  ),
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10,),
                        itemBuilder: (context, index) =>
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AhadethViewScreen.route,
                                    arguments: AhadethArguments(
                                        hadethName: ahadethNames[index],
                                        hadethText: ahadethText[index]
                                    )
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  ahadethNames[index],
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                        itemCount: ahadethNames.length),
                  )
                ],
              )
          )
        ],
      ),
    );
  }

  void readAhadethFile() async {
    String ahadeth = await rootBundle.loadString("assets/files/ahadeth .txt");
    List<String> ahadethList = ahadeth.split("#\r\n");
    for (int i = 0; i < ahadethList.length; i++) {
      List<String> tempListForAhadethNames = ahadethList[i].split("\n");
      ahadethNames.add(tempListForAhadethNames[0]);
      ahadethText.add(tempListForAhadethNames[1]);
    }
    setState(() {

    });
  }
}
