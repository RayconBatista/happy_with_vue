import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "http://192.168.1.12:3333";

class API {
  static Future getOrphanages() async {
    var url = baseUrl + "/orphanages";
    return http.get(url);
  }
}