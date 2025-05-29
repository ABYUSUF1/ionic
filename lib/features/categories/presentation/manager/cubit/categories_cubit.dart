import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/entities/products_entity.dart';
import 'package:ionic/features/categories/domain/repo/categories_repo.dart';

part 'categories_state.dart';
part 'categories_cubit.freezed.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo _categoriesRepo;
  CategoriesCubit(this._categoriesRepo)
    : super(const CategoriesState.initial());

  Future<void> getCategories({required String categoryName}) async {
    emit(CategoriesState.loading(ProductsEntity.loading()));

    final result = await _categoriesRepo.getCategories(
      categoryName: categoryName,
    );
    result.fold((failure) => emit(CategoriesState.error(failure.errMessage)), (
      productsEntity,
    ) {
      emit(CategoriesState.success(productsEntity));
    });
  }
}
