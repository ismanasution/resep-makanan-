import 'dart:convert';
import 'package:tugasbesar/model/resep.dart';
import 'package:http/http.dart' as http;

class ResepApi {
// const req = unirest('GET', 'https://yummly2.p.rapidapi.com/feeds/list');

// req.query({
// 	limit: '24',
// 	start: '0'
// });

// req.headers({
  // 'x-rapidapi-key': 'd3575c2d7dmsh1e15241871f4252p167f52jsn0aacc9dd17b0',
  // 'x-rapidapi-host': 'yummly2.p.rapidapi.com'
// });

  static Future<List<Resep>> getResep() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": '0', "size": '50', "tags": 'under_30_minutes'});

    final response = await http.get(uri, headers: {
      'x-rapidapi-key': 'd3575c2d7dmsh1e15241871f4252p167f52jsn0aacc9dd17b0',
      'x-rapidapi-host': 'tasty.p.rapidapi.com'
    });

    Map data = jsonDecode(response.body);

    List _temp = [];

    for (var i in data['results']) {
      _temp.add(i);
    }

    return Resep.resepFromSnapshot(_temp);
  }
}
