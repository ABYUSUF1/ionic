import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/features/home/domain/repo/home_repo.dart';

part 'recently_products_state.dart';
part 'recently_products_cubit.freezed.dart';

class RecentlyProductsCubit extends Cubit<RecentlyProductsState> {
  final HomeRepo homeRepo;
  RecentlyProductsCubit(this.homeRepo)
    : super(const RecentlyProductsState.initial()) {
    fetchRecentlyProducts();
  }

  Future<void> fetchRecentlyProducts() async {
    emit(const RecentlyProductsState.loading());
    final result = await homeRepo.fetchRecentlyProducts();
    result.fold(
      (failure) => emit(RecentlyProductsState.error(failure.errMessage)),
      (products) => emit(RecentlyProductsState.success(products)),
    );
  }
}
