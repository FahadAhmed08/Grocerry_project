import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  final dynamic data;
  const ItemDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
            ),
            color: Color(0xff181725),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.file_download_outlined),
              color: Color(0xff181725),
            )
          ],
          backgroundColor: Color(0xffF2F3F2),
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 280,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                  ),
                  color: Color(0xffF2F3F2)),
              child: Image.asset(
                data["image"],
                scale: 0.5,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    data["title"],
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff181725)),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                    color: const Color(0xff7C7C7C),
                    iconSize: 25,
                  ),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  data["quantity"],
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff7C7C7C)),
                )),
            const SizedBox(height: 16),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 16),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.minimize_rounded,
                        color: Color(0xffB3B3B3),
                        size: 32,
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: Color(0xffE2E2E2)),
                  ),
                  child: Center(
                      child: Text(
                    "1",
                    style: TextStyle(fontSize: 15, color: Color(0xff181725)),
                  )),
                  height: 50,
                  width: 50,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Color(0xff53B175),
                    size: 32,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Text(
                    data["price"],
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff181725),
                        fontWeight: FontWeight.w900),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 20, left: 24),
              child: Container(
                // margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xffE2E2E2)),
                        top: BorderSide(width: 1, color: Color(0xffE2E2E2)))),
                height: 140,
                width: 375,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Product Detail",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff181725)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                          "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet."),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    "Nutritions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffE2E2E2),
                    ),
                    width: 33,
                    height: 18,
                    child: Center(
                      child: Text(
                        "100gr",
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff7C7C7C)),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xffE2E2E2))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                children: [
                  Text(
                    "Review",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Image.asset("assets/image/abc.png")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: Container(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 67,
                    width: 364,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Add To Basket"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
