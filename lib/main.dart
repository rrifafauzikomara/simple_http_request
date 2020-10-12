import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_http_request/ui/album_page.dart';
import 'package:simple_http_request/bloc/album/bloc.dart';
import 'package:simple_http_request/common/color_palettes.dart';
import 'package:simple_http_request/network/api/api_service.dart';
import 'package:simple_http_request/bloc/album_bloc_observer.dart';

void main() {
  Bloc.observer = AlbumBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumBloc(apiService: ApiService()),
      child: MaterialApp(
        title: 'Fetch Data Example',
        theme: ThemeData(
          primarySwatch: ColorPalettes.primaryColor,
        ),
        home: AlbumPage(),
      ),
    );
  }
}
