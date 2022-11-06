import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../model/post_model.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class HomePostListState extends HomeState {
  final List<Post> posts;

  HomePostListState(this.posts);

  @override
  List<Object> get props => [posts];
}

class HomeDeletePostState extends HomeState {
  @override
  List<Object> get props => [];
}

