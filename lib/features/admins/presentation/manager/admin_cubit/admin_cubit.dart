import 'package:bloc/bloc.dart';
import 'package:funny_baby/core/models/discount_model.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/admins/data/admins_repo/admins_repo_impl.dart';
import 'package:meta/meta.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  Future<void> addProduct({required ProductModel productModel})async{
    emit(AdminLoading());
   try {
  await AdminsRepoImpl().addProduct(productModel: productModel);
  emit(AdminSuccess());
} catch (e) {
  emit(AdminFailure(errMessage: e.toString()));
}
  }



  Future<void> deleteProduct({required String parcode})async{
    emit(AdminLoading());
    try {
  await AdminsRepoImpl().deleteProduct(parcode: parcode);
  emit(AdminSuccess());
}catch (e) {
   emit(AdminFailure(errMessage: e.toString()));
}
  }

  
  Future<void> updateProduct()async{
    emit(AdminLoading());
    try {

  emit(AdminSuccess());
}catch (e) {
   emit(AdminFailure(errMessage: e.toString()));
}
  }
  
  Future<void> addDiscount({required DiscountModel discountModel})async{
    emit(AdminLoading());
    try {
  await AdminsRepoImpl().addDiscount(discountModel: discountModel);
  emit(AdminSuccess());
}catch (e) {
   emit(AdminFailure(errMessage: e.toString()));
}
  }


}
