import 'package:bloc/bloc.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/home/data/home_repo/home_repo_impl.dart';
import 'package:meta/meta.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit() : super(AllProductsInitial());

  Future<void> getAllProducts() async {
    emit(AllProductLoading());
    var result = await HomeRepoImp().getAllProducts();
    result.fold((Failure) => emit(AllProductsFailure(errMessage: Failure.errMessage!)),
        (products) => emit(AllProductsSuccess(products: products)));
  }
}
