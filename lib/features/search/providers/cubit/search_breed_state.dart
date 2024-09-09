part of 'search_breed_cubit.dart';

class SearchBreedState extends Equatable {
  const SearchBreedState({
    this.status = RequestStatus.notInitiated,
    this.cats = const [],
    required this.searchWord,
  });

  final RequestStatus status;
  final List<CatBreed> cats;
  final String searchWord;

  @override
  List<Object?> get props => [status, cats, searchWord];

  SearchBreedState copyWith({
    RequestStatus? status,
    List<CatBreed>? cats,
    String? searchWord,
  }) {
    return SearchBreedState(
      searchWord: searchWord ?? this.searchWord,
      status: status ?? this.status,
      cats: cats ?? this.cats,
    );
  }
}
