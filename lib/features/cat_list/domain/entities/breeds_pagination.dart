import 'package:cat_breeds/core/data.dart';

class BreedsPaginationInfo {
  final bool hasMore;
  final int currentPage;

  const BreedsPaginationInfo({
    required this.hasMore,
    required this.currentPage,
  });

  factory BreedsPaginationInfo.initial() {
    return const BreedsPaginationInfo(
      hasMore: true,
      currentPage: 0,
    );
  }
  factory BreedsPaginationInfo.fromBreedPagination(
    BreedPagination pagination,
  ) {
    return  BreedsPaginationInfo(
      hasMore: pagination.breeds.isNotEmpty,
      currentPage: pagination.nextPage,
    );
  }
}
