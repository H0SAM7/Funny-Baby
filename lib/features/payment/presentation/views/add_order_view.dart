import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/errors/failure.dart';
import 'package:funny_baby/core/helper/shared_pref.dart';
import 'package:funny_baby/core/models/order_model.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/core/widgets/custom_button.dart';
import 'package:funny_baby/core/widgets/custom_widgets.dart';
import 'package:funny_baby/core/widgets/optional_text_field.dart';
import 'package:funny_baby/core/widgets/phone_number_text_field.dart';
import 'package:funny_baby/features/auth/presentation/views/login_view.dart';
import 'package:funny_baby/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:funny_baby/features/payment/presentation/manager/cubit/add_order_cubit.dart';
import 'package:funny_baby/features/payment/presentation/views/widgets/confirm_order_dialog.dart';
import 'package:funny_baby/features/payment/presentation/views/widgets/loading_order_dialog.dart';
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
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderFailure) {
          showSnackbar(context, state.errMessage);
        } else if (state is AddOrderSuccses) {
          showDialog(
              context: context,
              builder: (context) {
                return const ConfirmOrderDialog();
              });
        }
      },
      builder: (context, state) {
        if (state is AddOrderLoading) {
          const LoadingOrderDialog(
            title: 'جاري طلب الاورردر',
          );
          //  return const CustomLoadingIndicator();
        }

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
                  PhoneNumberTextField(
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
                  const SizedBox(
                    height: 24,
                  ),
                  CustomButton(
                    buttonName: 'اطلب الان',
                    txtcolor: Colors.white,
                    color: blueColor,
                    onTap: () async {
                      //  var email = await SharedPreference().getString('email');
                      //var email = 'hh';

                      if (formKey.currentState!.validate()) {
                        try {
                          User? user = FirebaseAuth.instance.currentUser;

                          if (user == null) {
                            // If the user is not signed in, redirect to login page
                            GoRouter.of(context).push('/${LoginPage.id}');
                            log('User is currently signed out!');
                            return; // Prevent further execution
                          }

                          // Get the user's email
                          var email = user.email;
                          var docRef = FirebaseFirestore.instance
                              .collection('orders')
                              .doc();
                          await addOrderFunction(context, docRef, email);
                          await BlocProvider.of<CartCubit>(context).clearCart();
                        } catch (e) {
                          showSnackbar(
                              context,
                              FirebaseFailure.fromFirebaseException(
                                      e as Exception)
                                  .toString());
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> addOrderFunction(BuildContext context,
      DocumentReference<Map<String, dynamic>> docRef, String? email) async {
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
        orderTime: DateTime.now(),
      ),
    );
  }
}
