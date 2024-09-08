import 'package:cat_breeds/core/data.dart';
import 'package:cat_breeds/core/domain.dart';
import 'package:cat_breeds/features/cat_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'breeds_state.dart';

class BreedsCubit extends Cubit<BreedsState> {
  BreedsCubit(this._repository)
      : super(BreedsState(
          paginationInfo: BreedsPaginationInfo.initial(),
        ));

  set _state(BreedsState state) {
    emit(state);
  }

  final CatsRepository _repository;

  Future<void> obtainNextBreedList() async {
    _state = state.copyWith(status: RequestStatus.loading);
    try {
      final response = await _repository.getBreeds(
        page: state.paginationInfo.currentPage + 1,
      );
      _state = state.copyWith(
        status: RequestStatus.finished,
        paginationInfo: BreedsPaginationInfo.fromBreedPagination(response),
        breeds: response.breeds.toCatEntity(),
      );
    } catch (e) {
      _state = state.copyWith(status: RequestStatus.error);
    }
  }
  Future<void> obtainBreedList(int page) async {
    _state = state.copyWith(status: RequestStatus.loading);
    try {
      final response = await _repository.getBreeds(
        page: page,
      );
      _state = state.copyWith(
        status: RequestStatus.finished,
        paginationInfo: BreedsPaginationInfo.fromBreedPagination(response),
        breeds: response.breeds.toCatEntity(),
      );
    } catch (e) {
      _state = state.copyWith(status: RequestStatus.error);
    }
  }
  
}

extension Converter on List<CatBreedInfo> {
  List<CatBreed> toCatEntity() {
    return map(
      (breed) => breed.toCatBreed(),
    ).toList();
  }
}
