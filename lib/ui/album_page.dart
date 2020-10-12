import 'package:flutter/material.dart';
import 'package:simple_http_request/network/api/api_service.dart';
import 'package:simple_http_request/network/model/album.dart';

class AlbumPage extends StatefulWidget {
  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  final ApiService _apiService = ApiService();
  Future<Album> _futureAlbum;

  @override
  void initState() {
    super.initState();
    _futureAlbum = _apiService.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: _futureAlbum,
          builder: (context, snapshot) {
            var state = snapshot.connectionState;
            if (state != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                return Text('');
              }
            }
          },
        ),
      ),
    );
  }
}
