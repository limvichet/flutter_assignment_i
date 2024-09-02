import 'package:assignment_flutter/cpd_activity_model.dart';
import 'package:flutter/material.dart';

class CpdActivityScreenDetail extends StatefulWidget {
  //const CpdActivityScreenDetail({super.key});
  Course item;
  CpdActivityScreenDetail(this.item);

  @override
  State<CpdActivityScreenDetail> createState() =>
      _CpdActivityScreenDetailState();
}

class _CpdActivityScreenDetailState extends State<CpdActivityScreenDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cpd Activity Detail'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 40),
              child: Image.asset("pictures/logo.png",
                  height: 120, fit: BoxFit.fill,
                  ),
            ),
            SizedBox(height: 16),
            Text(
              "${widget.item.cpdCourseKh}",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            Text(
              "${widget.item.cpdCourseEn}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[300]),
            ),
            Text(
              "ផ្តល់ដោយ: ${widget.item.providerKh}",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 16),
            Text(
              "${widget.item.durationHour}ម៉ោង ស្មើ${widget.item.credits}ក្រេឌីត",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'ថ្ងៃខែទទួលចុះឈ្មោះ ${widget.item.regStartDate} - ${widget.item.regEndDate}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),

            Text(
              'ថ្ងៃខែទទួលចូលរៀន ${widget.item.startDate} - ${widget.item.endDate}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10),
            Text(
              'អំពីវគ្គសិក្សា៖ ${removeAllHtmlTags(widget.item.cpdCourseDescKh)}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.justify,
            ),
            Text(
              'ការបណ្តុះបណ្តាល:៖ ${removeAllHtmlTags(widget.item.learningOptionKh)}',
            ),
            // SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}
