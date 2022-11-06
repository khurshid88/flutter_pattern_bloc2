import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../model/post_model.dart';

@immutable
abstract class CreateState extends Equatable {}

class CreateInitialState extends CreateState {
  @override
  List<Object?> get props => [];
}

class CreateLoadingState extends CreateState {
  @override
  List<Object?> get props => [];
}

class CreateErrorState extends CreateState {
  final String errorMessage;

  CreateErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class CreatedPostState extends CreateState {
  final Post post;

  CreatedPostState(this.post);

  @override
  List<Object?> get props => [post];
}
