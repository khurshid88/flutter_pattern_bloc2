import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../model/post_model.dart';

@immutable
abstract class UpdateState extends Equatable {}

class UpdateInitialState extends UpdateState {
  @override
  List<Object?> get props => [];
}

class UpdateLoadingState extends UpdateState {
  @override
  List<Object?> get props => [];
}

class UpdateErrorState extends UpdateState {
  final String errorMessage;

  UpdateErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class UpdatedPostState extends UpdateState {
  final Post post;

  UpdatedPostState(this.post);

  @override
  List<Object?> get props => [post];
}
