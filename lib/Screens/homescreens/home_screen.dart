import 'package:flutter/material.dart';
import 'package:projectgrocery/Screens/addcart_screen.dart';
import 'package:projectgrocery/Screens/favorite_screen.dart';
import 'package:projectgrocery/Screens/homescreens/item_detail_screen.dart';
import 'package:projectgrocery/Screens/profile_screen.dart';
import 'package:projectgrocery/Screens/search_screen.dart';
import 'package:projectgrocery/data/app_product.dart';
import 'package:unicons/unicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // This function is called when an item in the bottom navigation bar is tapped
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screen[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xff53B175),
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          iconSize: 24,
          // backgroundColor: Colors.amber,
          items: [
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.shop),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_search),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        ));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Image.asset(
                "assets/image/corret.png",
                height: 35,
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                  width: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.location_on_sharp),
                      Text(
                        "Dhaka, Banassre",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Store',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                ),
              ),
              buildContainerImage(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                child: Row(
                  children: [
                    Text("Exclusive Offer",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                    Spacer(),
                    Text(
                      "See all",
                      style: TextStyle(color: Color(0xff53B175)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 248,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: product.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final data = product[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ItemDetail(data: data)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            width: 173,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(12.5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 130,
                                  child: Image.asset(product[index]["image"]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product[index]["title"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.5),
                                      ),
                                      Text(
                                        product[index]["quantity"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        product[index]["price"],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 58,
                                    ),
                                    Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: Color(0xff53B175),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: InkWell(
                                            customBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            onTap: () {
                                              addCart.add(product[index]);
                                              setState(() {});
                                              print(product[index]);
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            )))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
                child: Row(
                  children: [
                    Text(" Best Selling",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                    Spacer(),
                    Text(
                      "See all",
                      style: TextStyle(color: Color(0xff53B175)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 248,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: product1.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final data = product1[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ItemDetail(data: data)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            width: 173,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(12.5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 130,
                                  child: Image.asset(product1[index]["image"]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product1[index]["title"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.5),
                                      ),
                                      Text(
                                        product1[index]["quantity"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        product1[index]["price"],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 58,
                                    ),
                                    Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: Color(0xff53B175),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: InkWell(
                                            onTap: () {
                                              addCart.add(product1[index]);
                                              setState(() {});
                                              print(product1[index]);
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            )))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                child: Row(
                  children: [
                    Text("Groceries",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                    Spacer(),
                    Text(
                      "See all",
                      style: TextStyle(color: Color(0xff53B175)),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, bottom: 18),
                      child: Container(
                        height: 105,
                        width: 248,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 240, 211, 181),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Container(
                                    child: Image.asset(
                                        "assets/image/grocery2.png"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Pulses",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff3E423F),
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            )),
                            Expanded(
                              flex: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Container(
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, bottom: 18, right: 24),
                      child: Container(
                        height: 105,
                        width: 248,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 188, 228, 203),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Container(
                                    child: Image.asset(
                                        "assets/image/grocery1.png"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Pulses",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff3E423F),
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            )),
                            Expanded(
                              flex: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Container(
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 248,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: product2.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final data = product2[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ItemDetail(data: data)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            width: 173,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(12.5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 130,
                                  child: Image.asset(product2[index]["image"]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product2[index]["title"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.5),
                                      ),
                                      Text(
                                        product2[index]["quantity"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        product2[index]["price"],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 58,
                                    ),
                                    Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: Color(0xff53B175),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: InkWell(
                                            onTap: () {
                                              addCart.add(product2[index]);
                                              setState(() {});
                                              print(addCart[index]);
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            )))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainerImage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
          child: Container(
            height: 122,
            decoration: BoxDecoration(
              color: const Color(0xffF2F3F2),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/vegimage.png")),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Container(
                        child: Image.asset("assets/image/vegimage1.png"),
                      ),
                    ),
                  ],
                )),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Fresh Vegetables",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          Text("Get Up To 40% OFF",
                              style: TextStyle(color: Color(0xff53B175)))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    //
  }
}

List screen = [
  HomeScreen(),
  SearchScreen(),
  AddCartScreen(),
  FavoriteScreen(),
  ProfileScreen()
];
