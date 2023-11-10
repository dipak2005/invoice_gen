import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:invoice_gen/invoiceutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class My_pdf extends StatefulWidget {



  @override
  State<My_pdf> createState() => _My_pdfState();
}


class _My_pdfState extends State<My_pdf> {
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController quantity = TextEditingController();


  int pro = 0;
  int propri = 0;
  int prototal = 0;
  @override
  void initState() {

    super.initState();


  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MY pdf",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: PdfPreview(
        build: (PdfPageFormat format) {
          return Mypdf();
        },
      ),
    );
  }

  Future<Uint8List> Mypdf() async {
    var document = pw.Document();
    final netImage = await networkImage(
        "https://awards.brandingforum.org/wp-content/uploads/2016/11/BMW-logo.jpg");

    document.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            children: [
              pw.Align(
                alignment: pw.Alignment.topRight,
                child: pw.Image(netImage, height: 100, width: 100),
              ),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Text(
                  "INVOICE",
                  style: pw.TextStyle(
                    color: PdfColors.black,
                    fontSize: 50,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Align(
                      alignment: pw.Alignment.topLeft,
                      child: pw.Text(
                        " INVOICE NO:${invoice.invoiceno}",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                    ),
                    pw.Text(
                      "DATE:${invoice.date}",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ]),
              pw.SizedBox(height: 10),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Text(
                  "BILL TO:${invoice.address}",
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Text(
                  "Customer_Name:  ${invoice.cust_name}",
                  style: pw.TextStyle(
                      fontSize: 20, fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Container(
                height: 40,
                width: double.infinity,
                margin: pw.EdgeInsets.all(10),
                padding: pw.EdgeInsets.symmetric(vertical: 13),
                decoration: pw.BoxDecoration(
                    border: pw.Border(
                  top: pw.BorderSide(color: PdfColors.black),
                  bottom: pw.BorderSide(color: PdfColors.black),
                )),
                child: pw.Column(
                  children: [
                    pw.Align(
                      alignment: pw.Alignment.bottomCenter,
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                          children: [
                            pw.Text("iteam"),
                            pw.Text("Product"),
                            pw.Text("Quantity"),
                            pw.Text("Prize"),
                          ]),
                    ),
                  ],
                ),
              ),
              pw.Container(
                margin: pw.EdgeInsets.symmetric(horizontal: 10),
                padding: pw.EdgeInsets.symmetric(vertical: 10),
                decoration: pw.BoxDecoration(
                    border: pw.Border(
                        bottom: pw.BorderSide(color: PdfColors.black))),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                  children: [
                    pw.Text("1", style:
                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text("${invoice.product}", style:
                    pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text("${invoice.quantity}", style:
                    pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text("${invoice.prize}", style:
                    pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ],
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Align(
                alignment: pw.Alignment(0.8, 0),
                child: pw.Text(
                  "TOTAL:${invoice.prototal}", style:
          pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold),

                ),
              ),
              pw.Align(
                alignment: pw.Alignment(-0.9, 0),
                child: pw.Text("Bank Name:  ${invoice.bank_name}", style:
          pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              ),
              pw.SizedBox(height: 10),
              pw.Align(
                alignment: pw.Alignment(-0.9, 0),
                child: pw.Text("Bank Account:  ${invoice.account}", style:
          pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              ),
              pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                width: double.infinity,
                decoration: pw.BoxDecoration(
                  border: pw.Border(
                    bottom: pw.BorderSide(color: PdfColors.black),
                  ),
                ),
              ),
              pw.Text("Thank you welcome again!!",
                  style: pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold))
            ],
          );
        },
      ),
    );
    return document.save();
  }
}

