
import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/services/fire_base.dart';
import 'package:funny_baby/widgets/sales_widget.dart';

class SalesBody extends StatelessWidget {
  const SalesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SaleModel>>(
          future: FireBaseServices().getsales(), // Replace with your async function
          builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return Center(child: Text(S.of(context).no_discounts));
    } else if (snapshot.hasData) {
      final sales = snapshot.data!;
      return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          clipBehavior: Clip.none,
          itemCount: sales.length,
          itemBuilder: (context, index) {
            return SalesWidget(
              sale: sales[index],
            );
          },
        ),
      );
    } else {
      return Center(child: Text('Error: ${snapshot.error}'));
    }
          },
        );
  }
}
