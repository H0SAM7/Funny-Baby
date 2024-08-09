import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/cubit/get_products_cubit.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/helper/helper_functions.dart';
import 'package:funny_baby/models/product_model.dart';
import 'package:funny_baby/widgets/custom_card.dart';
import 'package:funny_baby/widgets/custom_text_field.dart';

class SearchPage extends StatefulWidget {
 const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? query;
  bool isSearching = false;
  // ignore: prefer_typing_uninitialized_variables
  var searchResult;
  List<dynamic> searchHistory = [];

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = BlocProvider.of<GetProductCubit>(context);
    var size = MediaQuery.of(context).size;
  //  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * .1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: CustomTextField(
                label: s.search_label,
                hint: s.search_hint,
                onchage: (data) {
                  setState(() {
                    query = data;

                    if (data.isEmpty) {
                      searchResult = null;
                      isSearching = false; // Reset searching state
                    } else {
                      isSearching = true; // Set searching state
                      searchResult = cubit.search(data);
                      searchHistory.add(searchResult);
                    }
                  });
                },
              ),
            ),
            if (isSearching)
              searchResult != null
                  ? CustomCard(productModel: searchResult!)
                  : Text(s.product_not_found),
            // if (!isSearching && searchHistory.isNotEmpty)
            //   SizedBox(
            //     height: size.height * .6, // Adjust the height as needed
            //     child: ListView.builder(
            //       itemCount: searchHistory.length,
            //       itemBuilder: (context, ind) {
            //         return HistoryCard(productModel: searchHistory[ind],onTap: (){
            //           searchHistory.clear();
            //         });
            //       },
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
 final ProductModel productModel;
  const HistoryCard({super.key, 

    required this.productModel,
    required this.onTap
 
  });
 final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    bool arabic=isArabic(context);
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment:arabic? MainAxisAlignment.end:MainAxisAlignment.start,
              children: [
                IconButton(onPressed: onTap, icon: const Icon(Icons.delete))
              ],
            ),
            Row(
              children: [
                  Container(
            
                    width: 80.0,
                    height: 80.0,
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(productModel.image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                    const SizedBox(width: 5.0),
                Text(
                  productModel.title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5.0),
                const Text(
                  '',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

















// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:funny_baby/cubit/get_products_cubit.dart';
// import 'package:funny_baby/generated/l10n.dart';
// import 'package:funny_baby/widgets/custom_card.dart';
// import 'package:funny_baby/widgets/custom_text_field.dart';


// class SearchPage extends StatefulWidget {
//   SearchPage({
//     super.key,
//   });
  

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   String? quary;
// bool isSearching = false;

//   var searchResult;
// List<dynamic> searchHistory=[];
//   @override
//   Widget build(BuildContext context) {
//     final s=S.of(context);
//     var cubit = BlocProvider.of<GetProductCubit>(context);
//     var listProducts = BlocProvider.of<GetProductCubit>(context).listProducts;
//     var size = MediaQuery.of(context).size;
//      bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: size.height * .2,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//               child: CustomTextField(
//                 label:s.search_label,
//                 hint:s.search_hint,
                
//                 onchage: (data) {
//       setState(() {
//       quary = data;

//       if (data.isEmpty) {
//         searchResult = null;
//         isSearching = false; // Reset searching state
//       } else {
//         isSearching = true; // Set searching state
//         searchResult = cubit.search(data);
//         searchHistory.add(searchResult);
//       }
//     });
                  
//                 },
//               ),
//             ),
//            if (isSearching)
//   searchResult != null
//     ? CustomCard(productModel: searchResult!)
//     : Text(s.product_not_found),
          
//           !isSearching? ListView.builder(itemBuilder: (context,ind){
//             return !searchHistory.isEmpty? CustomCard(productModel: searchHistory[ind]):null;
//           }):
//           Container()
//           ],

          
//         ),
//       ),
//     );
//   }
// }
