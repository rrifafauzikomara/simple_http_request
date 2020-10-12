import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_http_request/bloc/album/bloc.dart';

class AlbumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.bloc<AlbumBloc>().add(LoadData());
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Center(
        child: BlocBuilder<AlbumBloc, ResultState>(
          builder: (context, state) {
            if (state is HasData) {
              return Text(state.data.title);
            } else if (state is Loading) {
              return CircularProgressIndicator();
            } else if (state is Error) {
              return Text(state.message);
            } else if (state is NoData) {
              return Text(state.message);
            } else if (state is NoInternetConnection) {
              return Text(state.message);
            } else {
              return Text("");
            }
          },
        ),
      ),
    );
  }
}
