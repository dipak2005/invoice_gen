import 'dart:io';

import 'package:flutter/material.dart';
import 'package:invoice_gen/invoiceutil.dart';
import 'package:invoice_gen/my_pdf.dart';

class Invoice extends StatefulWidget {
  const Invoice({super.key});

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  GlobalKey<FormState> gkey = GlobalKey<FormState>();
  TextEditingController cust_name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController invoiceno = TextEditingController();
  TextEditingController bank_name = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController quantity = TextEditingController();

  TextEditingController product = TextEditingController();
  TextEditingController account = TextEditingController();
  bool isvalied = false;
  String product1 = "";
  String quantity1 = "";
  String total1 = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    address.text = invoice.address ?? "";
    date.text = invoice.date ?? "";
    invoiceno.text = invoice.invoiceno ?? "";
    quantity.text = invoice.quantity ?? "";
    pricecontroller.text = invoice.prize ?? "";
    cust_name.text = invoice.cust_name ?? "";
    bank_name.text = invoice.bank_name ?? "";
    product.text = invoice.product ?? "";
    account.text = invoice.account ?? "";

  }

  int pro = 0;
  int propri = 0;
  int prototal = 0;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "INVOICE",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "My_pdf");
            },
            icon: Icon(Icons.picture_as_pdf, color: Colors.black),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Form(
        key: gkey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.9, 0.9),
                                blurRadius: 10)
                          ]),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                                height: 150,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(
                                        "assets/images/bmw1.jpeg"))),
                            Text(
                              "BMW Showroom",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: TextFormField(
                                controller: cust_name,
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return " * Please enter customer name";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    enabled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusColor: Colors.black12,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    fillColor: Colors.black12,
                                    filled: true,
                                    hintText: "Enter customer name:"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: TextFormField(
                                controller: address,
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return " * Please enter customer address";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    enabled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusColor: Colors.black12,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black,
                                            style: BorderStyle.solid)),
                                    hintText: "Enter address",
                                    fillColor: Colors.black12,
                                    filled: true),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: TextFormField(
                                controller: date,
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return " * Please enter Date";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  label: Text("Enter Date:"),
                                  enabled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black12)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                  )),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2),
                                  ),
                                  hintText: "DD/MM/YYYY",
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: TextFormField(
                                controller: invoiceno,
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return " * Please enter Invoice no.:";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  hintText: "Enter Invoice no.:",
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: TextFormField(
                                controller: bank_name,
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return " * Please Bank_name";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    enabled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black12)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    hintText: "Enter Bank_name",
                                    fillColor: Colors.black12,
                                    filled: true),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: TextFormField(
                                controller: account,
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return " * Please Bank account";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  enabled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black12)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  hintText: "Enter Bank account",
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: TextFormField(
                                controller: product,
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return " * Please Product";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  enabled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black12)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  hintText: "Enter Product:",
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        return initState(

                                        );
                                      },
                                      controller: quantity,
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return " * Please enter quantity:";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        enabled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        hintText: "Enter Quantity",
                                        filled: true,
                                        fillColor: Colors.black12,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: TextFormField(
                                      controller: pricecontroller,
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return " * Please enter prize";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        enabled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        hintText: "Enter Prize:",
                                        filled: true,
                                        fillColor: Colors.black12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.black12)),
                                  onPressed: () {
                                    bool isvalied =
                                        gkey.currentState?.validate() ?? true;
                                    if (isvalied) {
                                      FocusScope.of(context).unfocus();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Column(
                                        children: [
                                          Text(
                                              "YOUR PDF GENRATING SUCCESSFULLY.."),
                                        ],
                                      )));
                                      invoice.cust_name = cust_name.text;
                                      invoice.address = address.text;
                                      invoice.date = date.text;
                                      invoice.invoiceno = invoiceno.text;
                                      invoice.quantity = quantity.text;
                                      invoice.prize = pricecontroller.text;
                                      invoice.product = product.text;
                                      invoice.account = account.text;
                                      invoice.bank_name = bank_name.text;
                                      int? quantity1 = int.tryParse(quantity.text);
                                      pro = quantity1 ?? 0;
                                      int? prize1 = int.tryParse(pricecontroller.text);
                                      propri = prize1 ?? 0;
                                      invoice.prototal= pro * propri;
                                      print("${prototal}");

                                      Navigator.pushNamed(context, "My_pdf",arguments: prototal);
                                      gkey.currentState?.save();
                                    }
                                  },
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.black12)),
                                  onPressed: () {
                                    bool isvalied =
                                        gkey.currentState?.validate() ?? true;
                                    if (isvalied) {
                                      invoice.cust_name = cust_name.text;
                                      invoice.address = address.text;
                                      invoice.date = date.text;
                                      invoice.invoiceno = invoiceno.text;
                                      invoice.product = product.text;
                                      invoice.quantity = quantity.text;
                                      invoice.prize = pricecontroller.text;
                                      invoice.account = account.text;
                                      invoice.bank_name = bank_name.text;
                                      gkey.currentState?.reset();
                                    }
                                  },
                                  child: Text(
                                    "Clear",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
