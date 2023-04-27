import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:islamic_book_reading/show_pdf.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> pdfData = [];
  showPdf() async {
    final result = await FirebaseFirestore.instance.collection("books").get();
    pdfData = result.docs.map((e) => e.data()).toList();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showPdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "PASHTO ISLAMIC BOOK",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff672CBC),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/logo.png"),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: pdfData.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      ShowPdf(pdf: pdfData[index]['url'])));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Image.asset(
                                "assets/p.png",
                                height: 120,
                                width: 100,
                              ),
                            ),
                            Text(
                              pdfData[index]['name'],
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
