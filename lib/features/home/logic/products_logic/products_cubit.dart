import 'package:bloc/bloc.dart';
import 'package:shoppe/features/home/logic/products_logic/products_state.dart';

import '../../data/rebo/home_rebository.dart';

class ProductsCubit extends Cubit<ProductsState> {
  HomeRepository homeRepository;

  ProductsCubit( this.homeRepository) : super(ProductsInitial());
  Future <void> getProductByCategories(String category)async{
    emit(ProductLoading());
    final result = await homeRepository.getProductByCategories(category);
    if(result.isSuccess){
      emit(ProductSuccess(products: result.data!.products!));
    }else{
      emit(ProductError(message: result.error!));
    }
  }

}
