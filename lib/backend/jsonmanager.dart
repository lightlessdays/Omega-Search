// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> decodeJSONData(String input, String cseId, String apiKey) async {
  List<List> returnList = [];

  try {
    var resultUndecoded = await http.get(Uri.parse(
        "https://www.googleapis.com/customsearch/v1?key=${apiKey}&cx=${cseId}&q=${input}"));

    var result = jsonDecode(resultUndecoded.body);
    List resultList = result["items"];
    for (var i = 0; i < resultList.length; i++) {
      if (resultList[i]["title"] != null) {
        returnList.add([
          resultList[i]["title"].toString(),
          resultList[i]["snippet"].toString(),
          resultList[i]["link"].toString(),
          resultList[i]["displayLink"].toString()
        ]);
      }
    }
    String newSpelling = result["spelling"]["correctedQuery"];
    returnList.add([newSpelling, true]);
  } catch (e) {
    //this catch block has been intentionally left empty so as to not trigger any errors.
  }

  return returnList;
}
