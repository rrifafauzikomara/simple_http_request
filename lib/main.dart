import 'package:flutter/material.dart';
import 'package:simple_http_request/common/color_palettes.dart';
import 'package:simple_http_request/ui/album_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: ColorPalettes.primaryColor,
      ),
      home: AlbumPage(),
    );
  }
}
