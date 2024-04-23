import 'package:flutter/material.dart';
import 'package:projectgrocery/Screens/about_us_screen.dart';
import 'package:projectgrocery/Screens/homescreens/home_screen.dart';

class GetStart extends StatelessWidget {
  const GetStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image.asset(
          "assets/image/8140 1.png",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Column containing the images
            Column(
              children: [
                Center(
                  child: Image.asset("assets/image/Group.png"),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Image.asset("assets/image/Welcome to our store.png"),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Image.asset(
                    "assets/image/Ger your groceries in as fast as one hour.png",
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
              ],
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 84),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 67,
                  width: 364,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Get Started"),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
