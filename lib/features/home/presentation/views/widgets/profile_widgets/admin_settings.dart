
import 'package:flutter/material.dart';
import 'package:funny_baby/features/admins/presentation/views/add_discount_view.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/features/admins/presentation/views/add_products_view.dart';
import 'package:funny_baby/features/admins/presentation/views/delete_product_view.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/profile_widgets/item_setting.dart';

class AdminSettings extends StatelessWidget {
  const AdminSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final s=S.of(context);
    return Column(children: [
ItemSetting(
                onTap: () {
                  Navigator.pushNamed(context, AddProductsPage.iD);
                },
                title: s.add_product,
                prefixIcon: Icons.add,
                suffixIcon: Container()),
            const Divider(
              indent: 20,
              endIndent: 20,
              thickness: .3,
            ),
            ItemSetting(
                onTap: () {},
                title: s.update_products,
                prefixIcon: Icons.update,
                suffixIcon: Container()),
            const Divider(
              indent: 20,
              endIndent: 20,
              thickness: .3,
            ),
            ItemSetting(
                onTap: () {
                  Navigator.pushNamed(context, AddSales.id);
                },
                title: s.add_sale,
                prefixIcon: Icons.add,
                suffixIcon: Container()),
            const Divider(
              indent: 20,
              endIndent: 20,
              thickness: .3,
            ),
            ItemSetting(
                onTap: () {
                  Navigator.pushNamed(context, DeleteProductsPage.id);
                },
                title: s.delete_products,
                prefixIcon: Icons.delete_forever,
                suffixIcon: Container()),
    ],);
  }
}