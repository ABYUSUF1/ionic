import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/features/home/domain/repo/home_repo.dart';

part 'recently_viewed_products_state.dart';
part 'recently_viewed_products_cubit.freezed.dart';

class RecentlyViewedProductsCubit extends Cubit<RecentlyViewedProductsState> {
  final HomeRepo homeRepo;
  RecentlyViewedProductsCubit(this.homeRepo)
    : super(const RecentlyViewedProductsState.initial()) {
    fetchRecentlyProducts();
  }

  Future<void> fetchRecentlyProducts() async {
    emit(const RecentlyViewedProductsState.loading());
    final result = await homeRepo.fetchRecentlyProducts();
    result.fold(
      (failure) => emit(RecentlyViewedProductsState.error(failure.errMessage)),
      (products) => emit(RecentlyViewedProductsState.success(products)),
    );
  }
}
