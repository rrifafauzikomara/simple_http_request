import 'package:equatable/equatable.dart';

class Album extends Equatable {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  @override
  List<Object> get props => [userId, id, title];
}
