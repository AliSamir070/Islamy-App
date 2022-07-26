import 'package:flutter/material.dart';
import 'package:islamy_app/shared/components/styles/styles.dart';

class AhadethViewScreen extends StatelessWidget {
  static String route = "Ahadeth_view";
  @override
  Widget build(BuildContext context) {
    AhadethArguments arguments = ModalRoute.of(context)!.settings.arguments as AhadethArguments;
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;
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
            body:Column(
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
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          arguments.hadethName,
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
                          width: widthOfScreen*0.6,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsetsDirectional.all(8),
                            child: Text(
                              arguments.hadethText,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]
    );
  }
}
class AhadethArguments{
  String hadethName;
  String hadethText;

  AhadethArguments({required this.hadethName ,required this.hadethText});
}
