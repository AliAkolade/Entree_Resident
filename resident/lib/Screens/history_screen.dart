import 'package:flutter_svg/flutter_svg.dart';
import 'package:resident/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String dropdownFilter = 'Active';
  List<String> filterList = <String>['Active', 'Used', 'Expired', 'Cancelled'];
  bool isHistoryPage = true;

  List<Widget> historyList = <Widget>[
    HistoryItem(name: 'John Albania', time: '10 minutes ago', status: true),
    HistoryItem(name: 'Kola Barrister', time: '20 minutes ago', status: false),
    HistoryItem(name: 'John Albania', time: '30 minutes ago', status: true),
    HistoryItem(name: 'John Albania', time: '50 minutes ago', status: true),
    HistoryItem(name: 'Kola Barrister', time: '1 hour ago', status: false),
    HistoryItem(name: 'John Albania', time: '10 hours ago', status: true),
    HistoryItem(name: 'John Albania', time: 'Yesterday', status: true),
    HistoryItem(name: 'Kola Barrister', time: '3 days ago', status: false),
    HistoryItem(name: 'John Albania', time: '1 week ago', status: true),
    HistoryItem(name: 'John Albania', time: '3 months ago', status: true)
  ];
  List<Widget> savedList = <Widget>[
    SavedItem(name: 'John Albania', number: '09087654315'),
    SavedItem(name: 'Kola Barrister', number: '070986524317'),
    SavedItem(name: 'John Albania', number: '08114523572'),
    SavedItem(name: 'John Albania', number: '08023416629'),
    SavedItem(name: 'Kola Barrister', number: '08077654321'),
    SavedItem(name: 'John Albania', number: '09076543213'),
    SavedItem(name: 'John Albania', number: '08012345622'),
    SavedItem(name: 'Kola Barrister', number: '07022443517'),
    SavedItem(name: 'John Albania', number: '08023150567'),
    SavedItem(name: 'John Albania', number: '08114325711')
  ];
  List<Widget> viewList = <Widget>[];

  @override
  void initState() {
    super.initState();
    setState(() {
      viewList = historyList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Builder(
            builder: (context) => SafeArea(
                minimum: EdgeInsets.only(top: 10),
                child: Stack(children: [
                  SingleChildScrollView(
                      child: Column(children: [
                    Container(height: isHistoryPage ? 130 : 90),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 0, bottom: 10, left: 20, right: 20),
                        child: Column(children: viewList))
                  ])),
                  Container(
                      height: isHistoryPage ? 130 : 90,
                      color: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(isHistoryPage ? 'History' : 'Saved',
                                      style: TextStyle(
                                          color: Color.fromRGBO(8, 19, 73, 1),
                                          fontFamily: 'Poppins',
                                          fontSize: 30,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                          height: 1)),
                                  Spacer(),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isHistoryPage = !isHistoryPage;
                                        });
                                        if (isHistoryPage) {
                                          setState(() {
                                            viewList = historyList;
                                          });
                                        } else {
                                          setState(() {
                                            viewList = savedList;
                                          });
                                        }
                                      },
                                      child: Text(
                                          isHistoryPage ? 'Saved' : 'History',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  118, 141, 255, 1),
                                              fontFamily: 'Poppins',
                                              fontSize: 20,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.bold,
                                              height: 1)))
                                ]),
                            SizedBox(height: 20),
                            isHistoryPage
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                        Spacer(),
                                        Text('Sort by',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    118, 141, 255, 1),
                                                fontFamily: 'Poppins',
                                                fontSize: 14,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.normal,
                                                height: 1)),
                                        SizedBox(width: 10),
                                        Flexible(
                                            fit: FlexFit.loose,
                                            child: Container(
                                              height: 40,
                                              padding: const EdgeInsets.only(
                                                  left: 10,
                                                  right: 0,
                                                  top: 0,
                                                  bottom: 0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: xGreyBlue,
                                                  border: Border.all(
                                                      color:
                                                          Colors.transparent)),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  icon: Transform.rotate(
                                                      angle: 90 * math.pi / 180,
                                                      child: Icon(
                                                        Icons
                                                            .chevron_right_rounded,
                                                        color: xLogoDarkBlue,
                                                        size: 30,
                                                      )),
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          37, 61, 232, 1),
                                                      fontFamily: 'Poppins',
                                                      fontSize: 14,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1),
                                                  value: dropdownFilter,
                                                  isExpanded: true,
                                                  dropdownColor: xGreyBlue,
                                                  elevation: 10,
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownFilter =
                                                          newValue!;
                                                    });
                                                  },
                                                  items: filterList.map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            )),
                                      ])
                                : Container(
                                    child: null,
                                  ),
                          ]))),
                ]))));
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
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: xColorDarkBlue,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                        height: 1)),
                SizedBox(height: 5),
                Text(widget.time,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(147, 147, 147, 1),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        letterSpacing: 1,
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

class SavedItem extends StatefulWidget {
  final String name;
  final String number;
  const SavedItem({Key? key, required this.name, required this.number})
      : super(key: key);

  @override
  State<SavedItem> createState() => _SavedItem();
}

class _SavedItem extends State<SavedItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SvgPicture.asset('assets/vectors/listUserIcon.svg'),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: xColorDarkBlue,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                        height: 1)),
                SizedBox(height: 5),
                Text(widget.number,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(147, 147, 147, 1),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                        height: 1))
              ],
            ),
            Spacer(),
            SvgPicture.asset('assets/vectors/sampleSmallQR.svg')
          ],
        ));
  }
}
