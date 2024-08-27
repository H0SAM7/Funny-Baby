import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/helper/shared_pref.dart';
import 'package:funny_baby/core/models/order_model.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/core/widgets/custom_button.dart';
import 'package:funny_baby/core/widgets/custom_widgets.dart';
import 'package:funny_baby/core/widgets/optional_text_field.dart';
import 'package:funny_baby/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:funny_baby/features/payment/presentation/manager/cubit/add_order_cubit.dart';
import 'package:go_router/go_router.dart';

class AddOrderView extends StatefulWidget {
  const AddOrderView({super.key, required this.items});
  static String id = 'AddOrderView';
  final List<ProductModel> items;

  @override
  State<AddOrderView> createState() => _AddOrderViewState();
}

class _AddOrderViewState extends State<AddOrderView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Define TextEditingControllers for each field
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController alternatePhoneController =
      TextEditingController();
  final TextEditingController centerController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController nearbyLocationController =
      TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    nameController.dispose();
    phoneController.dispose();
    alternatePhoneController.dispose();
    centerController.dispose();
    addressController.dispose();
    nearbyLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              OptionalTextField(
                label: "الاسم",
                hint: 'ادخل اسمك',
                controller: nameController,
                isRequired: true,
                onChanged: (value) {
                  nameController.text = value; // Update controller value
                },
              ),
              OptionalTextField(
                label: 'رقم الهاتف',
                hint: 'ادخل رقم هاتفك',
                controller: phoneController,
                isRequired: true,
                onChanged: (value) {
                  phoneController.text = value; // Update controller value
                },
              ),
              OptionalTextField(
                label: 'المركز',
                hint: '',
                controller: centerController,
                isRequired: true,
                onChanged: (value) {
                  centerController.text = value; // Update controller value
                },
              ),
              OptionalTextField(
                label: 'العنوان',
                hint: 'ادخل عنوانك',
                controller: addressController,
                isRequired: true,
                onChanged: (value) {
                  addressController.text = value; // Update controller value
                },
              ),
              OptionalTextField(
                label: 'اسم مكان مميز قريب منك',
                hint: '',
                controller: nearbyLocationController,
                isRequired: true,
                onChanged: (value) {
                  nearbyLocationController.text =
                      value; // Update controller value
                },
              ),
              const SizedBox(height: 24,),
              CustomButton(
                buttonName: 'اطلب الان',
                txtcolor: Colors.white,
                color: blueColor,
                onTap: () async {
                  var email = await SharedPreference().getString('email');
                  if (formKey.currentState!.validate()) {
                     
                    var docRef =
                        FirebaseFirestore.instance.collection('orders').doc();
                    await BlocProvider.of<AddOrderCubit>(context).addOrder(
                      OrderModel(
                        orderId: docRef.id,
                        products: widget.items,
                        //totalPrice: totalPrice,
                        customerName: nameController.text,
                        customerEmail: email!,
                        customerAddress: addressController.text,
                        customerAddressCenter: centerController.text,
                        customerPhone: phoneController.text,
                      ),
                    );
                    await BlocProvider.of<CartCubit>(context).clearCart();
                    showSnackbar(context,
                        'تم طلب الاوردر بنجاح سيتم التواصل معكم لتاكيد الاوردر');
                    GoRouter.of(context).pop();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
