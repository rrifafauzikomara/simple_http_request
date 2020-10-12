import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_http_request/network/model/album.dart';

class ApiService {
  static ApiService _instance;

  ApiService._internal() {
    _instance = this;
  }

  factory ApiService() => _instance ?? ApiService._internal();

  Future<Album> fetchAlbum() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/albums/1');

    if (response.statusCode == 200) {
      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
