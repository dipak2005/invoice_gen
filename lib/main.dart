import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_gen/Splash%20screen.dart';
import 'package:invoice_gen/invoice.dart';
import 'package:invoice_gen/invoiceutil.dart';
import 'package:invoice_gen/my_pdf.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Spalash_screen(),
      routes: {
        "Invoice":(context) => Invoice(),
        "My_pdf":(context) => My_pdf(),


      },
    );
  }
}
