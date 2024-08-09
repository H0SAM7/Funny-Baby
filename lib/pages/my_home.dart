import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/cubit/get_products_cubit.dart';
import 'package:funny_baby/cubit/states.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/helper/helper_functions.dart';
import 'package:funny_baby/models/product_model.dart';
import 'package:funny_baby/pages/categories_page.dart';
import 'package:funny_baby/pages/sales.dart';
import 'package:funny_baby/pages/profile.dart';
import 'package:funny_baby/pages/search.dart';
import 'package:funny_baby/widgets/adv_widget.dart';
import 'package:funny_baby/widgets/card_sliver_grid.dart';
import 'package:funny_baby/widgets/custom_card.dart';
import 'package:funny_baby/widgets/custom_progress.dart';
import 'package:funny_baby/widgets/custom_title_appbar.dart';
import 'package:funny_baby/widgets/drawer.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  static String id = 'MyHome';

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    bool isarabic = isArabic(context);
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    //  var size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 236, 181, 181),
      drawer: const DrawerWidget(),
      // backgroundColor: Color(0xF3D0D7).withOpacity(0.1),

      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
            centerTitle: true,
            //  automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.transparent,
                ),
              ),
            ],
            elevation: 0,
            title: TitleAppBar(isarabic: isarabic, s: s),
          ),
        ],
        body: Center(
          child: widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: blueWhiteColor,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: blueColor,
            ),
            label: S.of(context).Home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: blueColor),
            label: S.of(context).Search,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.discount_sharp,
              color: blueColor,
            ),
            label: S.of(context).Sales,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category, color: blueColor),
            label: S.of(context).Category,
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user, color: blueColor),
            label: S.of(context).Profile,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: !isDarkMode ? blueColor : Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
