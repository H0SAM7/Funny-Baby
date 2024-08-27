import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/core/helper/helper_functions.dart';
import 'package:funny_baby/core/widgets/custom_title_appbar.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/drawer.dart';
import 'package:funny_baby/features/home/presentation/views/search_view.dart';
import 'package:go_router/go_router.dart';

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
                onPressed: () {
                     GoRouter.of(context)
            .push('/${SearchPage.id}', );
                },
                icon:  Icon(
                  Icons.search,
                  color:isDarkMode?Colors.white :blueColor,
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
            icon: Icon(FontAwesomeIcons.cartShopping, color: blueColor),
            label: S.of(context).cart,
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
        unselectedItemColor: isDarkMode?Colors.black:blueColor,
        selectedIconTheme:const IconThemeData(size: 15),
        showUnselectedLabels:false,
        onTap: _onItemTapped,
      ),
    );
  }
}
