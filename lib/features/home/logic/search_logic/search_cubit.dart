import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoppe/features/home/data/rebo/home_rebository.dart';

import '../../data/models/product_response_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  HomeRepository homeRepository ;
  SearchCubit( this.homeRepository) : super(SearchInitial());

  Future<void> searchProduct(String query)async{
    if(query.isEmpty){
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());
    try{
      final result = await homeRepository.searchProduct(query);
      if(result.isSuccess){
        emit(SearchSuccess(products: result.data!.products!));
      }else{
        emit(SearchError(message: result.error!));
      }
    }catch(e){
      emit(SearchError(message: e.toString()));
    }
    }
  void clearSearch() {
    emit(SearchInitial());
  }

  }

