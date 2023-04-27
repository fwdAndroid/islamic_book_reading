import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ShowPdf extends StatefulWidget {
  var pdf;
  ShowPdf({super.key, required this.pdf});

  @override
  State<ShowPdf> createState() => _ShowPdfState();
}

class _ShowPdfState extends State<ShowPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: SfPdfViewer.network(widget.pdf)));
  }
}
