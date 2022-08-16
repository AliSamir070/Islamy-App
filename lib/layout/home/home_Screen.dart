import 'package:flutter/material.dart';
import 'package:islamy_app/modules/quran/quran_screen.dart';
import 'package:islamy_app/modules/radio/radio_screen.dart';
import 'package:islamy_app/modules/sebha/sebha_screen.dart';
import 'package:islamy_app/modules/settings/settings_screen.dart';
import 'package:provider/provider.dart';

import '../../modules/ahadeth/ahadeth_screen.dart';
import '../../providers/local_provider.dart';
import '../../shared/components/styles/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [RadioScreen() , SebhaScreen(),AhadethScreen(),QuranScreen()];
  int currentIndex = 0;
  late LocaleProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Stack(
      children:[
        Image(
          width: double.infinity,
          fit: BoxFit.fill,
          image: AssetImage(
              provider.mode==ThemeMode.light?'assets/images/background.png':'assets/images/darkback.png'
          ),

        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              '${AppLocalizations.of(context)?.title}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: Theme.of(context).appBarTheme.iconTheme,
            actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
            actions: [
              IconButton(
                  onPressed: (){
                    Navigator.pushNamed(context, SettingsScreen.route);
                  }, 
                  icon: Icon(
                    Icons.settings,
                  )
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          body: screens[currentIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context),
            child: BottomNavigationBar(

                selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
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
                      label: "${AppLocalizations.of(context)?.radio}"
                  ),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                    AssetImage(
                        'assets/images/sebha_icon.png'
                    ),
                  ),
                      label: "${AppLocalizations.of(context)?.sebha}"
                  ),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                    AssetImage(
                        'assets/images/ahadeth_icon.png'
                    ),
                  ),
                      label: "${AppLocalizations.of(context)?.ahadeth}"
                  ),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                    AssetImage(
                        'assets/images/quran_icon.png'
                    ),
                  ),
                      label: "${AppLocalizations.of(context)?.quran}"
                  ),
                ]
            ),
          ),
        ),
      ]
    );
  }
}
