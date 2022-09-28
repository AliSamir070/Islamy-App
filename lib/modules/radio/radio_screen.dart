import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islamy_app/models/RadioResponse.dart';
import 'package:islamy_app/shared/components/componenets/components.dart';
import 'package:islamy_app/shared/network/remote/http_handler.dart';

import '../../models/Radios.dart';

class RadioScreen extends StatefulWidget {
  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  late Future<RadioResponse?> response;
  late AudioPlayer audioPlayer;
  @override
  void initState() {
    response = getRadios();
    audioPlayer = AudioPlayer();
  }


  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Image(
              image: AssetImage('assets/images/radio_image.png')
          ),
        ),
        Expanded(
            child: FutureBuilder<RadioResponse?>(
                future: response,
                builder: (context , asyncsnapshot){
                  if(asyncsnapshot.hasData){
                    List<Radios> radios = asyncsnapshot.data!.radios!;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: PageScrollPhysics(),
                        itemBuilder: (context , index)=>RadioController(radio: radios[index],audioPlayer: audioPlayer,),
                        itemCount: radios.length,
                    );
                  }else if(asyncsnapshot.hasError){
                    print("error");
                    return Center(
                        child: Column(
                          children: [
                            Text('Failed'),
                            IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  Icons.refresh,
                                  color: Theme.of(context).primaryColor,
                                )
                            )
                          ],
                        )
                    );
                  }else if(asyncsnapshot.connectionState == ConnectionState.none){
                    print("error");

                    return Center(
                        child: Column(
                          children: [
                            Text('Failed'),
                            IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  Icons.refresh,
                                  color: Theme.of(context).primaryColor,
                                )
                            )
                          ],
                        )
                    );
                  }else{
                    return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),);
                  }
                }
            )
        )
      ],
    );
  }

  Future<RadioResponse?> getRadios()async{
    try {
      final response = await HttpHandler.fetchRadios();
      if (response.statusCode == 200) {
        RadioResponse radioResponse = RadioResponse.fromJson(
            jsonDecode(utf8.decode(response.bodyBytes)));
        print(radioResponse.radios![0].name);
        return radioResponse;
      }else{
        throw Exception("Failed to load");
      }
    }on Exception catch(e){
    }
  }
}
