import 'package:cat_breeds/core/data.dart';

class BreedPagination {
  final List<CatBreedInfo> breeds;
  final int nextPage;
  final int? amount;
  final int? limit;

  const BreedPagination({
    required this.breeds,
    required this.nextPage,
    this.amount,
    this.limit,
  });
}
