import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/rebo/home_rebository.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  HomeRepository homeRepository;

  CategoryCubit(this.homeRepository) : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());
    final result = await homeRepository.getCategories();
    if (result.isSuccess) {
      emit(CategorySuccess(category: result.data!, selectedIndex: 0));
    } else {
      emit(CategoryError(message: result.error!));
    }
  }

  void selectedCategory(int index) {
    if (state is CategorySuccess) {
      final currentState = state as CategorySuccess;
      emit(
        CategorySuccess(category: currentState.category, selectedIndex: index),
      );
    }
  }
}
