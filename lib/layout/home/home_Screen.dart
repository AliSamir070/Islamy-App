import 'package:flutter/material.dart';
import 'package:islamy_app/modules/quran/quran_screen.dart';
import 'package:islamy_app/modules/radio/radio_screen.dart';
import 'package:islamy_app/modules/sebha/sebha_screen.dart';

import '../../modules/ahadeth/ahadeth_screen.dart';
import '../../shared/components/styles/styles.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [RadioScreen() , SebhaScreen(),AhadethScreen(),QuranScreen()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          ),
          backgroundColor: Colors.transparent,
          body: screens[currentIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: AppStyle.baseColor),
            child: BottomNavigationBar(
                selectedItemColor: Colors.black,
                currentIndex: currentIndex,
                onTap: (index){
                  currentIndex  = index;
                  setState((){

                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage(
                          'assets/images/radio_icon.png'
                        ),
                      ),
                      label: "radio"
                  ),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                    AssetImage(
                        'assets/images/sebha_icon.png'
                    ),
                  ),
                      label: "sebha"
                  ),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                    AssetImage(
                        'assets/images/ahadeth_icon.png'
                    ),
                  ),
                      label: "ahadeth"
                  ),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                    AssetImage(
                        'assets/images/quran_icon.png'
                    ),
                  ),
                      label: "quran"
                  ),
                ]
            ),
          ),
        ),
      ]
    );
  }
}
