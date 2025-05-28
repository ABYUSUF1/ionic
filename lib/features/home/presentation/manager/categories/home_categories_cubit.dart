import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/home/domain/entity/category_entity.dart';
import 'package:ionic/features/home/domain/repo/home_repo.dart';

part 'home_categories_state.dart';
part 'home_categories_cubit.freezed.dart';

class HomeCategoriesCubit extends Cubit<HomeCategoriesState> {
  final HomeRepo _homeRepo;
  HomeCategoriesCubit(this._homeRepo)
    : super(const HomeCategoriesState.initial()) {
    fetchCategories();
  }

  final scrollController = ScrollController();

  Future<void> fetchCategories() async {
    emit(HomeCategoriesState.loading([CategoryEntity.loading()]));
    final result = await _homeRepo.getCategories();
    result.fold(
      (failure) => emit(const HomeCategoriesState.error()),
      (categories) => emit(HomeCategoriesState.success(categories)),
    );
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
