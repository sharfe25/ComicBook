import 'package:flutter_bloc/flutter_bloc.dart';
import 'comic_event.dart';
import 'comic_state.dart';
import '../../domain/repositories/comic_repository.dart';

class ComicBloc extends Bloc<ComicEvent, ComicState> {
  final ComicRepository comicRepository;
  int _offset = 0;
  final int _limit = 20;
  bool _isFetching = false;

  ComicBloc({required this.comicRepository}) : super(ComicInitial()) {
    on<FetchComics>((event, emit) async {
      if (!_isFetching) {
        _isFetching = true;
        await getComics(emit, resetOffset: event.resetOffset);
        _isFetching = false;
      }
    });
    on<FetchComicDetails>((event, emit) async {
      await getComicDetails(event, emit);
    });
  }

  Future<void> getComics(Emitter<ComicState> emit,
      {bool resetOffset = false}) async {
    if (resetOffset) {
      _offset = 0;
      emit(ComicLoading());
    }

    try {
      final comics = await comicRepository.getComics(_offset, _limit);

      if (resetOffset) {
        emit(ComicLoaded(comics));
      } else {
        final currentState = state;
        if (currentState is ComicLoaded) {
          emit(ComicLoaded([...currentState.comics, ...comics]));
        } else {
          emit(ComicLoaded(comics));
        }
      }
      _offset += _limit;
    } catch (e) {
      emit(ComicError(e.toString()));
    }
  }

  Future<void> getComicDetails(
      FetchComicDetails event, Emitter<ComicState> emit) async {
    emit(ComicLoading());
    try {
      final comic = await comicRepository.getComicDetails(event.id);
      emit(ComicDetailLoaded(comic));
    } catch (e) {
      emit(ComicError(e.toString()));
    }
  }
}
