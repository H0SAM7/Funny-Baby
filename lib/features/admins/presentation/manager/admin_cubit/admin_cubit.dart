import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:funny_baby/core/models/discount_model.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/admins/data/admins_repo/admins_repo_impl.dart';
import 'package:image_picker/image_picker.dart';
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

  Future<String?> uploadImage(String fileName,) async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        File file = File(pickedFile.path);

        Reference storageRef =
            _storage.ref().child('FunnyBabyimages/$fileName');

        UploadTask uploadTask = storageRef.putFile(file);

        TaskSnapshot snapshot = await uploadTask.whenComplete(() => {});

        String downloadUrl = await snapshot.ref.getDownloadURL();

        return downloadUrl;
      }
    } catch (e) {
      log('Error uploading image: $e');
    }
    return null;
  }




  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();
  Future<String?> uploadDiscountImage(String fileName) async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        File file = File(pickedFile.path);

        Reference storageRef =
            _storage.ref().child('FunnyBabyOffers/$fileName');

        UploadTask uploadTask = storageRef.putFile(file);

        TaskSnapshot snapshot = await uploadTask.whenComplete(() => {});

        String downloadUrl = await snapshot.ref.getDownloadURL();

        return downloadUrl;
      }
    } catch (e) {
      log('Error uploading image: $e');
    }
    return null;
  }

  Future<String?> getDownloadUrl(String filePath) async {
    try {
      String downloadUrl = await _storage.ref(filePath).getDownloadURL();
      return downloadUrl;
    } catch (e) {
      log('Error getting download URL: $e');
      return null;
    }
  }

  

}



