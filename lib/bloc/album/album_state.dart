import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:simple_http_request/network/model/album.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();
}

class Initial extends AlbumState {
  @override
  List<Object> get props => [];
}

class Loading extends AlbumState {
  @override
  List<Object> get props => [];
}

class NoData extends AlbumState {
  final String message;

  NoData({@required this.message});

  @override
  List<Object> get props => [message];
}

class HasData extends AlbumState {
  final Album data;

  HasData({@required this.data});

  @override
  List<Object> get props => [data];
}

class NoInternetConnection extends AlbumState {
  final String message;

  NoInternetConnection({@required this.message});

  @override
  List<Object> get props => [message];
}

class Error extends AlbumState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
