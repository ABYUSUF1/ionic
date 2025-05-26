import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/home/domain/entity/category_entity.dart';
import 'package:ionic/features/home/domain/repo/home_repo.dart';

part 'categories_state.dart';
part 'categories_cubit.freezed.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepo _homeRepo;
  CategoriesCubit(this._homeRepo) : super(CategoriesState.initial()) {
    fetchCategories();
  }

  final scrollController = ScrollController();

  Future<void> fetchCategories() async {
    emit(CategoriesState.loading([CategoryEntity.loading()]));
    final result = await _homeRepo.getCategories();
    result.fold(
      (failure) => emit(CategoriesState.error()),
      (categories) => emit(CategoriesState.success(categories)),
    );
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
