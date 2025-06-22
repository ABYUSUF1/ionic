import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/product/domain/repo/product_repo.dart';

import '../../../../../core/models/product_model/product.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo _productRepo;
  ProductCubit(this._productRepo) : super(const ProductState.initial());

  Future<void> getProduct(String productId, Product? product) async {
    if (product != null) {
      emit(ProductState.success(product));
      addToRecentlyProducts(product);
      return;
    }

    emit(const ProductState.loading());
    final result = await _productRepo.getProduct(productId);
    result.fold((l) => emit(ProductState.error(l.errMessage)), (r) {
      addToRecentlyProducts(r);
      emit(ProductState.success(r));
    });
  }

  void updateQuantity(int newQty) {
    state.maybeWhen(
      success: (product, quantity) {
        emit(ProductState.success(product, quantity: newQty));
      },
      orElse: () {},
    );
  }

  void addToRecentlyProducts(Product product) {
    try {
      unawaited(_productRepo.addToRecentlyProducts(product.toProductItem()));
    } catch (_) {
      // Optionally log or ignore — no user impact
    }
  }
}
