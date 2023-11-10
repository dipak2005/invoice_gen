import 'package:flutter/material.dart';

class Spalash_screen extends StatefulWidget {
  const Spalash_screen({super.key});

  @override
  State<Spalash_screen> createState() => _Spalash_screenState();
}

class _Spalash_screenState extends State<Spalash_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/images/invoice_1.jpg"),
              Positioned(
                left: 120,
                bottom: 112,
                child: Text(
                  "Invoice \nGentator",
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w700,
                      fontSize: 45),
                ),
              ),
            ],
          ),
          IconButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orange),
                  shape: MaterialStatePropertyAll(CircleBorder(
                      side: BorderSide(
                          style: BorderStyle.solid, color: Colors.orange)))),
              onPressed: () {
                Navigator.pushNamed(context, "Invoice");
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,weight: 10,size: 40,
              )),

        ],
      ),
    );
  }
}
