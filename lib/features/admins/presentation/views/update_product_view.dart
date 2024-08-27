import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/admins/presentation/manager/admin_cubit/admin_cubit.dart';
import 'package:funny_baby/services/fire_base_services.dart';
import 'package:funny_baby/core/widgets/custom_button.dart';
import 'package:funny_baby/core/widgets/custom_text_field.dart';
import 'package:funny_baby/core/widgets/custom_widgets.dart';

class UpdateProductsView extends StatefulWidget {
  const UpdateProductsView({super.key});
  static String id = 'UpdateProductsPage';

  @override
  State<UpdateProductsView> createState() => _AddProductsPageState();
}

class _AddProductsPageState extends State<UpdateProductsView> {
  final TextEditingController idController = TextEditingController();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController categoryController = TextEditingController();

  final TextEditingController sizeController = TextEditingController();

  final TextEditingController countController = TextEditingController();

  final TextEditingController genderController = TextEditingController();

  final TextEditingController discountController = TextEditingController();

  String? image;

  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Product')),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: mainColor,
        onRefresh: () async {
          // Replace this delay with the code to be executed during refresh
          // and return asynchronous code
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                label: 'Product ID',
                hint: 'Enter product ID',
                controller: idController,
              ),
              CustomTextField(
                label: 'Product Title',
                hint: 'Enter product title',
                controller: titleController,
              ),
              CustomTextField(
                label: 'Product Price',
                hint: 'Enter product price',
                controller: priceController,
              ),
              CustomTextField(
                label: 'Description',
                hint: 'Enter description',
                controller: descriptionController,
              ),
              // CustomTextField(
              //   label: 'Category',
              //   hint: 'Enter category',
              //   controller: categoryController,
              // ),

              CustomTextField(
                label: 'Size',
                hint: 'Enter size',
                controller: sizeController,
              ),
              CustomTextField(
                label: 'Count',
                hint: 'Enter count',
                controller: countController,
              ),
              CustomTextField(
                label: 'Gender',
                hint: 'Enter gender',
                controller: genderController,
              ),
              CustomTextField(
                label: 'Discount',
                hint: 'Enter discount',
                controller: discountController,
              ),

              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CategoryDropdown(),
                  TextButton.icon(
                    statesController: WidgetStatesController(),
                    onPressed: () async {
                      image =  await BlocProvider.of<AdminCubit>(context)
                          .uploadImage(titleController.text,);
                      loaded = true;
                      setState(() {});
                    },
                    icon: Icon(
                      !loaded ? Icons.upload : Icons.done,
                      color: mainColor,
                    ),
                    label: !loaded
                        ? const Text('Upload Image')
                        : Text(titleController.text),
                  ),
                ],
              ),

              const SizedBox(
                height: 15,
              ),

              CustomButton(
                buttonName: 'Send',
                border: true,
                txtcolor: Colors.white,
                color: mainColor,
                onTap: () async {
                  await FireBaseServices().updateProduct(ProductModel(
                    code: idController.text,
                    parcode: idController.text,
                    title: titleController.text,
                    price: priceController.text,
                    description: descriptionController.text,
                    category: categoryController.text,
                    image: image!,
                    size: sizeController.text,
                    count: int.tryParse(countController.text) ?? 0,
                    gender: genderController.text,
                    cart: false,
                    discount: double.tryParse(discountController.text) ?? 0,
                  ));
                  log('send data Done');
                  loaded = false;
                  setState(() {});
                  showSnackbar(context, 'Update New product Done');
                  idController.clear();
                  titleController.clear();
                  priceController.clear();
                  descriptionController.clear();
                  categoryController.clear();
                  sizeController.clear();
                  countController.clear();
                  genderController.clear();
                  discountController.clear();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  bool allfields() {
    return idController.text.isNotEmpty &&
        titleController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        sizeController.text.isNotEmpty &&
        countController.text.isNotEmpty &&
        genderController.text.isNotEmpty &&
        discountController.text.isNotEmpty;
  }
}

class CategoryDropdown extends StatefulWidget {
  const CategoryDropdown({super.key});

  @override
  CategoryDropdownState createState() => CategoryDropdownState();
}

class CategoryDropdownState extends State<CategoryDropdown> {
  String? selectedCategory;
  final List<String> catNames = [
    "Dresses",
    "Soiree",
    "Underwear",
    "Accessories",
    "Pajamas",
    "Swimsuits",
    "Jacket",
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedCategory,
      hint: const Text('Select a category'),
      items: catNames.map((String category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedCategory = newValue;
        });
      },
    );
  }
}
