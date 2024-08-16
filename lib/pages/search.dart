import 'package:flutter/material.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/custom_product_item.dart';
import 'package:funny_baby/core/widgets/custom_text_field.dart';

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
    // var cubit = BlocProvider.of<GetProductCubit>(context);
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
                      //   searchResult = cubit.search(data);
                      searchHistory.add(searchResult);
                    }
                  });
                },
              ),
            ),
            if (isSearching)
              searchResult != null
                  ? CustomProductItem(productModel: searchResult!)
                  : Text(s.product_not_found),
          ],
        ),
      ),
    );
  }
}
