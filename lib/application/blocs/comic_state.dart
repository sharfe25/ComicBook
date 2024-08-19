import 'package:equatable/equatable.dart';

import '../../domain/entities/comic_model.dart';

abstract class ComicState extends Equatable {
  @override
  List<Object> get props => [];
}

class ComicInitial extends ComicState {}

class ComicLoading extends ComicState {
  
}

class ComicLoaded extends ComicState {
  final List<ComicModel> comics;

  ComicLoaded(this.comics);

  @override
  List<Object> get props => [comics];
}

class ComicDetailLoaded extends ComicState {
  final ComicModel comic;

  ComicDetailLoaded(this.comic);

  @override
  List<Object> get props => [comic];
}

class ComicError extends ComicState {
  final String message;

  ComicError(this.message);

  @override
  List<Object> get props => [message];
}
