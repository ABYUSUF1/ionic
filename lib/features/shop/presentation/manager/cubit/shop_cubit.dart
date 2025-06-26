import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/models/product_model/product.dart';

import '../../../domain/repo/shop_repo.dart';

part 'shop_state.dart';
part 'shop_cubit.freezed.dart';

class ShopCubit extends Cubit<ShopState> {
  final ShopRepo _shopRepo;
  int _currentPage = 0;
  final int _limit = 10; // Items per page
  bool _hasReachedMax = false;
  List<Product> _products = [];

  ShopCubit(this._shopRepo) : super(const ShopState.initial()) {
    fetchProducts();
  }

  Future<void> fetchProducts({bool loadMore = false}) async {
    // Prevent duplicate calls when already loading
    if (state is _Loading || (state is _LoadingMore && loadMore)) return;

    if (_hasReachedMax && loadMore) return;

    if (!loadMore) {
      _currentPage = 0;
      _hasReachedMax = false;
      _products = [];
      emit(const ShopState.loading());
    } else {
      emit(ShopState.loadingMore(_products));
    }

    final result = await _shopRepo.getProducts(
      limit: _limit,
      skip: _currentPage * _limit,
    );

    result.fold((failure) => emit(ShopState.error(failure.errMessage)), (
      productsResponse,
    ) {
      final newProducts = productsResponse.products;

      if (newProducts.isEmpty) {
        _hasReachedMax = true;
        emit(ShopState.success(_products, hasReachedMax: true));
        return;
      }

      // Check for duplicates before adding
      final newUniqueProducts =
          newProducts
              .where(
                (newProduct) =>
                    !_products.any(
                      (existingProduct) => existingProduct.id == newProduct.id,
                    ),
              )
              .toList();

      if (newUniqueProducts.isEmpty) {
        _hasReachedMax = true;
        emit(ShopState.success(_products, hasReachedMax: true));
        return;
      }

      _currentPage++;
      _products.addAll(newUniqueProducts);
      emit(ShopState.success(_products, hasReachedMax: false));
    });
  }
}
