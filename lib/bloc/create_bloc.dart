import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/post_model.dart';
import '../services/http_service.dart';
import 'create_event.dart';
import 'create_state.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  CreateBloc() : super(CreateInitialState()) {
    on<CreatePostEvent>(_onCreatePost);
  }

  Future<void> _onCreatePost(
      CreatePostEvent event, Emitter<CreateState> emit) async {
    emit(CreateLoadingState());
    final response = await Network.POST(Network.API_CREATE, Network.paramsEmpty());
    if (response != null) {
      Post post = Network.parsePost(response);
      emit(CreatedPostState(post));
    } else {
      emit(CreateErrorState("Couldn't fetch posts"));
    }
  }
}
