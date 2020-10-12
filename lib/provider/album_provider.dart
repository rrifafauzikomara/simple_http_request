import 'package:flutter/foundation.dart';
import 'package:simple_http_request/common/result_state.dart';
import 'package:simple_http_request/network/api/api_service.dart';
import 'package:simple_http_request/network/model/album.dart';

class AlbumProvider extends ChangeNotifier {
  final ApiService apiService;

  AlbumProvider({@required this.apiService}) {
    _fetchAlbum();
  }

  Album _album;
  String _message = '';
  ResultState _state;

  String get message => _message;

  Album get result => _album;

  ResultState get state => _state;

  Future<dynamic> _fetchAlbum() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final album = await apiService.fetchAlbum();
      if (album == null) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _album = album;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
