part of 'search_breed_cubit.dart';

class SearchBreedState extends Equatable {
  const SearchBreedState({
    this.status = RequestStatus.notInitiated,
    this.cats = const [],
    required this.searchWord,
    required this.lastSearchedWord,
  });

  final RequestStatus status;
  final List<CatBreed> cats;
  final String searchWord;
  final String lastSearchedWord;

  @override
  List<Object?> get props => [
        status,
        cats,
        searchWord,
        lastSearchedWord,
      ];

  SearchBreedState copyWith({
    RequestStatus? status,
    List<CatBreed>? cats,
    String? searchWord,
    String? lastSearchedWord,
  }) {
    return SearchBreedState(
      searchWord: searchWord ?? this.searchWord,
      status: status ?? this.status,
      cats: cats ?? this.cats,
      lastSearchedWord: lastSearchedWord ?? this.lastSearchedWord,
    );
  }
}
