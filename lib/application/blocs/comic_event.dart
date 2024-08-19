import 'package:equatable/equatable.dart';

abstract class ComicEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchComics extends ComicEvent {
  final bool resetOffset;
  FetchComics( {this.resetOffset = true});
}

class FetchComicDetails extends ComicEvent {
  final String id;

  FetchComicDetails({required this.id});
}