import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy_app/providers/local_provider.dart';
import 'package:islamy_app/shared/components/componenets/components.dart';
import 'package:islamy_app/shared/components/styles/styles.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  static String route = "settings_screen";
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
            ),
            backgroundColor: Colors.transparent,
            body:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    AppLocalizations.of(context)!.language,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleMedium
                  ),
                ),
                InkWell(
                  onTap: (){
                    showLocalBottomSheet(context);
                  },
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          provider.locale=='en'?'English':'العربية',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppStyle.lightbaseColor
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_downward,
                          size: 30,
                          color: AppStyle.lightbaseColor,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(
                          AppLocalizations.of(context)!.mode,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.start,
                      ),
                      Spacer(),
                      Switch(
                          value: provider.mode==ThemeMode.light?false:true,
                          onChanged: (value){
                            if(value){
                              provider.changeMode(ThemeMode.dark);
                            }else{
                              provider.changeMode(ThemeMode.light);
                            }
                          }
                          )
                    ],
                  ),
                )
              ],
            ),
          ),
        ]
    );
  }

  void showLocalBottomSheet(BuildContext context) {
    showModalBottomSheet<dynamic>(
      context: context,
      builder: (_){
        return LocaleBottomSheet();
      },

    );
  }
}
