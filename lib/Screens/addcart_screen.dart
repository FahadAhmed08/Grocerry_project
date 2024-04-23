import 'package:flutter/material.dart';
import 'package:projectgrocery/data/app_product.dart';

class AddCartScreen extends StatefulWidget {
  const AddCartScreen({super.key});

  @override
  State<AddCartScreen> createState() => _AddCartScreenState();
}

class _AddCartScreenState extends State<AddCartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 105,
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
              child: Center(
                child: Text(
                  "My Cart",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            addCart.isEmpty
                ? Center(child: Text("Cart is Empty"))
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: addCart.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 25, left: 20, right: 20),
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1))),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 15),
                              height: 80,
                              width: 100,
                              child: Image.asset(
                                addCart[index]["image"],
                                scale: 1.5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    addCart[index]["title"],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    addCart[index]["price"],
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    width: 120,
                                    height: 40,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              // color: Colors.black12,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                width: 0.1,
                                              )),
                                          child: Icon(Icons.remove),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "1",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                width: 0.1,
                                              )),
                                          child: Icon(
                                            Icons.add,
                                            color: Color(0xff53B175),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 75,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      addCart.removeAt(index);
                                      setState(() {});
                                    },
                                    child: Icon(Icons.cancel_outlined)),
                                SizedBox(
                                  height: 35,
                                ),
                                Text(
                                  addCart[index]["price"],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: SizedBox(
          height: 67,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff53B175),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Go To CheckOut",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    height: 15,
                    color: Colors.black26,
                    child: Text(
                      "data",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.5,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
        ),
      ),
    ));
  }
}
