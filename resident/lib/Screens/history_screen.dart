import 'package:resident/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: Padding(padding: EdgeInsets.only(top: 10, left: 20), child:Text('History',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(8, 19, 73, 1),
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                  height: 1))),
          leadingWidth: 200,
toolbarHeight: 100,        ),
        body: Builder(
            builder: (context) => SingleChildScrollView(
                child: SafeArea(child: Container(child: null)))));
  }
}

class HistoryItem extends StatefulWidget {
  final String name;
  final String time;
  final bool status;
  const HistoryItem(
      {Key? key, required this.name, required this.time, required this.status})
      : super(key: key);

  @override
  State<HistoryItem> createState() => _HistoryItem();
}

class _HistoryItem extends State<HistoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SvgPicture.asset('assets/vectors/listUserIcon.svg'),
            SizedBox(width: 10),
            Column(
              children: [
                Text(widget.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(37, 61, 232, 1),
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                        height: 1)),
                Text(widget.time,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(118, 141, 255, 1),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1))
              ],
            ),
            Spacer(),
            Text(widget.status ? 'Active' : 'Inactive',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(37, 61, 232, 1),
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    height: 1))
          ],
        ));
  }
}
