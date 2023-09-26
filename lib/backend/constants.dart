import 'dart:convert';

import 'package:http/http.dart' as http;


String cseId = "d7dd187d1818f4f24";
String apiKey = "AIzaSyByJRIwWLVjWj_MEu-a93CqQYz274YTAV8";

String pexelsKey = "nRwmsYj1tteZp4hP3SNfB8Jjt1FsZzOAzJlXoCo3f2MQVMYUzeCya3Di";

searchImages(String query,int pageNumber) async {
  var url =
      // ignore: unnecessary_brace_in_string_interps
      "https://api.pexels.com/v1/search?query=$query&per_page=30&page=${pageNumber}";
  var response = await http.get(Uri.parse(url), headers: {"Authorization": pexelsKey});
  List jsonList = (jsonDecode(response.body)["photos"]);
  List<List<String>> returnList = [];
  for(int i=0;i<jsonList.length;i++){
    returnList.add([jsonList[i]["src"]["medium"],jsonList[i]["src"]["original"]]);
  }
  return returnList;
}