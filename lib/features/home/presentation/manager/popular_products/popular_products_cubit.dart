import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/entities/products_entity.dart';
import '../../../domain/repo/home_repo.dart';

part 'popular_products_state.dart';
part 'popular_products_cubit.freezed.dart';

class PopularProductsCubit extends Cubit<PopularProductsState> {
  final HomeRepo _homeRepo;
  PopularProductsCubit(this._homeRepo)
    : super(const PopularProductsState.initial()) {
    fetchPopularProducts();
  }

  Future<void> fetchPopularProducts() async {
    emit(const PopularProductsState.loading());
    final result = await _homeRepo.fetchPopularProducts();
    result.fold(
      (failure) => emit(PopularProductsState.error(failure.errMessage)),
      (products) => emit(PopularProductsState.success(products)),
    );
  }
}
