import 'package:http/http.dart' as http;
class HttpHandler{
  static Future<http.Response> fetchRadios()async{
    return http.get(Uri.parse("https://api.mp3quran.net/radios/radio_arabic.json"));
  }
}