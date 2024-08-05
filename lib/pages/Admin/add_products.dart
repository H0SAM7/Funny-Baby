import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/models/product_model.dart';
import 'package:funny_baby/services/fire_base.dart';
import 'package:funny_baby/widgets/custom_button.dart';
import 'package:funny_baby/widgets/custom_dropdown.dart';
import 'package:funny_baby/widgets/custom_text_field.dart';


class AddProductsPage extends StatefulWidget {
  AddProductsPage({super.key});
  static String iD = 'AddProductsPage';

  @override
  State<AddProductsPage> createState() => _AddProductsPageState();
}

class _AddProductsPageState extends State<AddProductsPage> {
  final TextEditingController codeController = TextEditingController();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController categoryController = TextEditingController();



  final TextEditingController sizeController = TextEditingController();

  final TextEditingController countController = TextEditingController();

  final TextEditingController genderController = TextEditingController();

  final TextEditingController discountController = TextEditingController();

  String? image,Category;

  bool loaded = false;
    GlobalKey<FormState> FromKey = GlobalKey<FormState>();
      List<String> CatNames = [
       "اولادي",
      "بناتي",
      "حديثي الولادة",
      "ملابس داخلية",
      "بيجامة",
      "اكسسوارات",
      "مصيف",
      "احذية",
      "سواريه",
  ];
  @override
  Widget build(BuildContext context) {
    final s=S.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(s.add_products)),
      body: RefreshIndicator(
          color: Colors.white,
        backgroundColor: mainColor,
        onRefresh: () async {
          // Replace this delay with the code to be executed during refresh
          // and return asynchronous code
          return Future<void>.delayed(const Duration(seconds: 3));
        
        },
        

        
        child: SingleChildScrollView(
      
          child: Form(
            key: FromKey,
            child: Column(
              children: [
                //  CustomTextField(
                //   label: 'Image URL',
                //   hint: 'Enter image URL',
                //   onSaved: (data) => image = data,
                // ),
                    
                CustomTextField(
                  label: s.productIDLabel,
                  hint: s.productIDHint,
                  controller: codeController,
                ),
                CustomTextField(
                  label: s.product_title,
                  hint: s.enter_product_title,
                  controller: titleController,
                ),
                CustomTextField(
                  label:s.product_price,
                  hint: s.enter_product_price,
                  controller: priceController,
                ),
                CustomTextField(
                  label: s.description,
                  hint: s.enter_description,
                  controller: descriptionController,
                ),
                // CustomTextField(
                //   label: 'Category',
                //   hint: 'Enter category',
                //   controller: categoryController,
                // ),
              
                CustomTextField(
                  label: s.size,
                  hint: s.enter_size,
                  controller: sizeController,
                ),
                CustomTextField(
                  label:s.count,
                  hint: s.enter_count,
                  controller: countController,
                ),
                CustomTextField(
                  label:s.gender,
                  hint: s.enter_gender,
                  controller: genderController,
                ),
                CustomTextField(
                  label:s.discount,
                  hint: s.enter_discount,
                  controller: discountController,
                ),
                    
                SizedBox(
                  height: 5,
                ),
                     Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
               CustomDropDown(MenuList:CatNames ,  onChanged: (selectedValue) {
                        categoryController.text = selectedValue ?? '';
                      },),
                TextButton.icon(
                  statesController: MaterialStatesController(),
                  onPressed: () async {
                    image =
                        await FireBaseServices().uploadImage(titleController.text+codeController.text);
                   
                    setState(() {
                   if(image!=null){
                    loaded=true;
                   }
                    });
                  },
                  icon: Icon(
                    !loaded ? Icons.upload : Icons.done,
                    color: mainColor,
                  ),
                  label:
                      !loaded ? Text(s.upload_image) : Text(titleController.text),
                ),
             ],
                     ),
           

                   
                SizedBox(
                  height: 25,
                ),
            
                loaded
                    ? CustomButton(
                        buttonName:s.send,
                        border: true,
                        txtcolor: Colors.white,
                        color: mainColor,
                        onTap: () async {
                      if (FromKey.currentState!.validate()) {
                            await FireBaseServices().addProduct(ProductModel(
                              code: codeController.text,
                               parcode: codeController.text,
                              title: titleController.text,
                              price: priceController.text,
                              description: descriptionController.text,
                              category: categoryController.text,
                              image: image!,
                           
                              size: sizeController.text,
                              count: int.tryParse(countController.text) ?? 0,
                              gender: genderController.text,
                              
                              cart: false,
                              discount:
                                  double.tryParse(discountController.text) ?? 0,
                            ));
                            log('send data Done');
                            loaded=false;
                            setState(() {
                              
                            });
                            ShowSnackbar(context, s.add_new_product_done);
                          codeController.clear();
                          titleController.clear();
                          priceController.clear();
                          descriptionController.clear();
                          categoryController.clear();
       
                          sizeController.clear();
                          countController.clear();
                          genderController.clear();
                          discountController.clear();
                          }
                          else{
                            ShowSnackbar(context, s.please_fill_all_fields);
                          }
                        },
                      )
                    : Text(s.please_upload_image),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void ShowSnackbar(BuildContext context, String massage) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(massage.replaceAll('-', '')),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.black,
    ));
  }
  
 }


