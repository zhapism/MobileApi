import 'package:http/http.dart' as http;
import 'package:praktikum1/app/modules/models/news.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<Welcome?> articleNews() async {
    var responses = await client.get(
        'https://newsapi.org/v2/everything?q=tesla&from=2023-09-30&sortBy=publishedAt&apiKey=50c775743fab4cffb5837b78d2e85de8'
            as Uri);
    if (responses.statusCode == 200) {
      var jsonString = responses.body;
      return welcomeFromJson(jsonString);
    } else {
      return null;
    }
  }

  static fetchNews() {}
}
