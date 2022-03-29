import 'package:flutter/material.dart';

class Viewer extends StatefulWidget {
  final String viewType;
  const Viewer({Key? key, required this.viewType}) : super(key: key);

  @override
  ViewerState createState() => ViewerState();
}

class ViewerState extends State<Viewer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Viewer - ${widget.viewType}'),
      ),
      /*body: Container(
        child: SfPdfViewer.network('https://ajaxweaver.com/public/ucanpay.pdf'),
      ),*/
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: HtmlElementView(viewType: widget.viewType),
      ),
    );
  }
}
