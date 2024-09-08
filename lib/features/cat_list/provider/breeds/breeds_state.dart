part of 'breeds_cubit.dart';

class BreedsState extends Equatable {
  const BreedsState({
    this.status = RequestStatus.loading,
    this.breeds = const [],
    required this.paginationInfo,
  });

  final RequestStatus status;
  final List<CatBreed> breeds;

  final BreedsPaginationInfo paginationInfo;

  @override
  List<Object?> get props => [status, breeds];

  BreedsState copyWith({
    RequestStatus? status,
    List<CatBreed>? breeds,
    BreedsPaginationInfo? paginationInfo,
  }) {
    return BreedsState(
      paginationInfo: paginationInfo ?? this.paginationInfo,
      status: status ?? this.status,
      breeds: breeds ?? this.breeds,
    );
  }
}
