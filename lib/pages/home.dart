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
import 'package:funny_baby/widgets/custom_card.dart';
import 'package:funny_baby/widgets/custom_progress.dart';
import 'package:funny_baby/widgets/drawer.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  static String id = 'MyHome';

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchPage(),
    SalesPage(),
    CategoriesPage(),
    ProfilePage(),
  ];

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
      drawer: DrawerWidget(),
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
                icon: Icon(
                  Icons.search,
                  color: Colors.transparent,
                ),
              ),
            ],
            elevation: 0,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  !isarabic ? s.funny : s.baby,
                  style: TextStyle(
                      color: blueColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                      fontSize: 28),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  isarabic ? s.funny : s.baby,
                  style: TextStyle(
                      color: const Color.fromARGB(255, 247, 109, 233),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                      fontSize: 28),
                ),
              ],
            ),
          ),
        ],
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor:blueWhiteColor,
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
        selectedItemColor: !isDarkMode ? blueColor : Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double itemSpacing = size.width * 0.002; // Responsive item spacing
    double childAspectRatio =
        (size.width / 2) / (size.height * .53); // Adjust aspect ratio
    return BlocBuilder<GetProductCubit, StoreStates>(
      builder: (context, state) {
        var cubit = BlocProvider.of<GetProductCubit>(context);
        cubit.getProducts();

        if (state is ProductsLoadedSucccessfuly) {
          List<ProductModel> products = state.listProducts;
          return CustomScrollView(
            clipBehavior:Clip.none,
            slivers: [
              
              // SliverToBoxAdapter(
              //     child: Catogery_widget(
              //   categoryName: S.of(context).dresses,
              // )),
              // SliverToBoxAdapter(
              //     child: Catogery_widget(
              //   categoryName: S.of(context).boys,
              // )),
              SliverToBoxAdapter(child: SizedBox(
                  height: size.height * .188,
                   width: size.width,
                child: Advarticements(color: Color(0xFFCAF0F8),image: 'assets/Images/boyy.png'
                ,
                text: S.of(context).New_collection
                ))),

              // SliverToBoxAdapter(
              //     child: Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //   child: Stack(
              //     clipBehavior: Clip.none,
              //     children: [
              //       Container(
              //         height: size.height * .15,
              //         width: size.width,
              //         decoration: BoxDecoration(
              //           color: Color(0xFFCAF0F8),
              //           borderRadius: BorderRadius.circular(30),
              //         ),
              //       ),
              //       Positioned(
              //         top: -20,
              //         left: 0,
              //         child: Image.asset(
              //           'assets/Images/boyy.png',
              //           height: size.height * .18,
              //         ),
              //       ),
              //     ],
              //   ),
              // )),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:size.width>size.height?3: 2,
                  // childAspectRatio: 1 / 2.1,
                  //   childAspectRatio: 1 / 2.1,
                  // mainAxisSpacing: 7,
                  // crossAxisSpacing:3,
                  childAspectRatio: childAspectRatio,
                  mainAxisSpacing: itemSpacing,
                  crossAxisSpacing: itemSpacing,
                ),
                delegate: SliverChildBuilderDelegate(
                  
                  (context, index) {
                    return CustomCard(productModel: products[index]);
                  },
                  childCount: products.length,
                ),
              ),
            ],
          );
        } else if (state is ProductErrorLoading) {
          return Center(child: Text(S.of(context).Error_loading_products));
        } else {
          return Center(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
