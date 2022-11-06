import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../model/post_model.dart';

@immutable
abstract class UpdateEvent extends Equatable {
  const UpdateEvent();
}

class UpdatePostEvent extends UpdateEvent {
  final Post post;

  const UpdatePostEvent({required this.post});

  @override
  List<Object> get props => [post];
}

