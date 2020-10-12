import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:simple_http_request/bloc/album/bloc.dart';
import 'package:simple_http_request/network/api/api_service.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final ApiService apiService;

  AlbumBloc({@required this.apiService}) : super(Initial());

  @override
  Stream<AlbumState> mapEventToState(AlbumEvent event) async* {
    if (event is LoadData) {
      yield* _loadArticle();
    }
  }

  Stream<AlbumState> _loadArticle() async* {
    try {
      yield Loading();
      var album = await apiService.fetchAlbum();
      if (album == null) {
        yield NoData(message: 'No Data');
      } else {
        yield HasData(data: album);
      }
    } on IOException {
      yield NoInternetConnection(message: 'No Internet Connection');
    } on TimeoutException {
      yield NoInternetConnection(message: 'No Internet Connection');
    } catch (e) {
      yield Error(message: e.toString());
    }
  }
}
