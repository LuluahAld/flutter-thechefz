import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:thechefz/constants.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: purple),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(
                Icons.system_update_alt,
                size: 30,
              ),
            )
          ],
        ),
        body: SizedBox(child: SfPdfViewer.asset('pdf/invoice.pdf')));
  }
}
