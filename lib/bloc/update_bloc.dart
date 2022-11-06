import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc2/bloc/update_event.dart';
import 'package:pattern_bloc2/bloc/update_state.dart';

import '../model/post_model.dart';
import '../services/http_service.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc() : super(UpdateInitialState()) {
    on<UpdatePostEvent>(_onUpdatePost);
  }

  Future<void> _onUpdatePost(
      UpdatePostEvent event, Emitter<UpdateState> emit) async {
    emit(UpdateLoadingState());
    final response = await Network.PUT(
        Network.API_UPDATE + event.post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      Post post = Network.parsePost(response);
      emit(UpdatedPostState(post));
    } else {
      emit(UpdateErrorState("Couldn't update post"));
    }
  }
}
