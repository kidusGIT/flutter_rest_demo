import 'dart:convert';

import 'package:http/http.dart' as http;

class Config {
  static final String url = "http://192.168.1.6:8000/api";

  var id;
  Config({this.id});
}

String getTitle(String note) {
  String title = note.replaceAll("\n", " ");
  if (title.length > 40) {
    return title.substring(0, 30);
  }

  return title;
}

String getDesc(String note) {
  String title = getTitle(note);
  String body = note.replaceAll(title, " ");
  String desc = body.replaceAll("\n", " ");
  if (desc.length > 40) {
    return '${desc.substring(0, 40)}..';
  }

  return desc;
}

addNote(String note) async {
  var url = Uri.parse('${Config.url}/note-create');
  final headers = {"Content-Type": "application/json"};
  // final json = '{"notes":${note}}';
  final json = jsonEncode({'notes': note});
  final response = await http.post(url, headers: headers, body: json);
  print(response.body);
}

updateNote(String note, var id) async {
  var url = Uri.parse('${Config.url}/note-update/$id');
  final headers = {"Content-Type": "application/json"};
  // final json = '{"notes":${note}}';
  final json = jsonEncode({'notes': note});
  final response = await http.put(url, headers: headers, body: json);
  print(response.body);
}

deleteNote(var id) async {
  var url = Uri.parse('${Config.url}/note-delete/$id');
  final response = await http.delete(url);
}
