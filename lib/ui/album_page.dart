import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_http_request/common/result_state.dart';
import 'package:simple_http_request/network/api/api_service.dart';
import 'package:simple_http_request/provider/album_provider.dart';

class AlbumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AlbumProvider(apiService: ApiService()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: Consumer<AlbumProvider>(
            builder: (context, state, _) {
              if (state.state == ResultState.Loading) {
                return CircularProgressIndicator();
              } else if (state.state == ResultState.HasData) {
                return Text(state.result.title);
              } else if (state.state == ResultState.NoData) {
                return Text(state.message);
              } else if (state.state == ResultState.Error) {
                return Text(state.message);
              } else {
                return Center(child: Text(''));
              }
            },
          ),
        ),
      ),
    );
  }
}
