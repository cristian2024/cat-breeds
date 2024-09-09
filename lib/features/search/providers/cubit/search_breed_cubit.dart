import 'package:cat_breeds/core/domain.dart';
import 'package:cat_breeds/features/cat_list/provider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_breed_state.dart';

class SearchBreedCubit extends Cubit<SearchBreedState> {
  SearchBreedCubit(
    this._repository, {
    required String initialWord,
  }) : super(
          SearchBreedState(searchWord: initialWord),
        );

  final CatsRepository _repository;

  set _state(SearchBreedState state) {
    emit(state);
  }

  void search({String? word}) async {
    final newWord = word ?? state.searchWord;
    _state = state.copyWith(
      status: RequestStatus.loading,
      searchWord: newWord,
    );
    try {
      final response = await _repository.searchBreeds(
        word: newWord,
      );
      _state = state.copyWith(
        status: RequestStatus.finished,
        cats: response.toCatEntity(),
      );
    } catch (e) {
      _state = state.copyWith(status: RequestStatus.error);
    }
  }

  void changeWord(String word) {
    _state = state.copyWith(searchWord: word);
  }
}
