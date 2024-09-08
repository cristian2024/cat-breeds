import 'package:cat_breeds/core/domain.dart';
import 'package:cat_breeds/core/ui.dart';
import 'package:cat_breeds/features/cat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CatBreedsScreen extends StatelessWidget {
  const CatBreedsScreen({super.key});

  static const String routeName = 'breeds';
  static const String route = 'breeds';
  static const String fullRoute = '/breeds';

  @override
  Widget build(BuildContext context) {
    return AppBlocProvider(
      create: (context) => BreedsCubit(read())..obtainNextBreedList(),
      child: Scaffold(
        appBar: AppBar(
          title: Hero(
            tag: 'cat_breeds_title',
            child: Text(
              "Cat breeds",
              style: context.getTitleLarge(),
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // TODO(Cristian) - Add searchbar
              Text('Search bar'),
              Expanded(
                child: _CatBreedList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CatBreedList extends StatefulWidget {
  const _CatBreedList();

  @override
  State<_CatBreedList> createState() => __CatBreedListState();
}

class __CatBreedListState extends State<_CatBreedList> {
  final _pagingController = PagingController<int, CatBreed>(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      context.read<BreedsCubit>().obtainBreedList(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BreedsCubit, BreedsState>(
      listener: (context, state) {
        final BreedsState(
          :status,
          :paginationInfo,
          :breeds,
        ) = state;
        final BreedsPaginationInfo(:currentPage, :hasMore) = paginationInfo;
        if (status.isFinished) {
          //forget about existing record
          //about the last page, fetch last page number from
          //backend

          final lastPage = currentPage;

          if (!hasMore) {
            _pagingController.appendLastPage(breeds);
          } else {
            _pagingController.appendPage(breeds, lastPage);
          }
        }
        if (status.hasError) {
          _pagingController.error = "Error";
        }
      },
      builder: (context, state) {
        // return CatBreedCardImageProvider(
        //   imageId: "DbwiefiaY",
        // );
        return PagedListView.separated(
          separatorBuilder: (_, __) {
            return const SizedBox(height: 24);
          },
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<CatBreed>(
            itemBuilder: (_, breed, __) {
              return CatBreedCard.fromCatBreed(breed);
            },
          ),
        );
      },
    );
  }
}
