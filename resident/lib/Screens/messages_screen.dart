import 'package:flutter_svg/flutter_svg.dart';
import 'package:resident/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List<Widget> messageList = <Widget>[
    MessageItem(
        name: 'Alice Zara', message: 'Hi Love', time: '11:43 pm', unread: 1),
    MessageItem(
        name: 'Alice Zara',
        message: 'Hello Hello Hello',
        time: 'Yesterday',
        unread: 10),
    MessageItem(
        name: 'Alice Zara', message: 'Hi Love', time: '11:43 pm', unread: 1),
    MessageItem(
        name: 'Alice Zara', message: 'Hi Love', time: '11:43 pm', unread: 1),
    MessageItem(
        name: 'Alice Zara', message: 'Hi Love', time: '11:43 pm', unread: 1),
    MessageItem(
        name: 'Alice Zara',
        message: 'Hello Hello Hello',
        time: 'Yesterday',
        unread: 10),
    MessageItem(
        name: 'Alice Zara', message: 'Hi Love', time: '11:43 pm', unread: 1),
    MessageItem(
        name: 'Alice Zara', message: 'Hi Love', time: '11:43 pm', unread: 1),
    MessageItem(
        name: 'Alice Zara', message: 'Hi Love', time: '11:43 pm', unread: 1),
    MessageItem(
        name: 'Alice Zara',
        message: 'Hello Hello Hello',
        time: 'Yesterday',
        unread: 10),
    MessageItem(
        name: 'Alice Zara', message: 'Hi Love', time: '11:43 pm', unread: 1),
    MessageItem(
        name: 'Alice Zara', message: 'Hi Love', time: '11:43 pm', unread: 1),
    MessageItem(
        name: 'Alice Zara', message: 'Hi Love', time: '11:43 pm', unread: 1),
    MessageItem(
        name: 'Alice Zara',
        message: 'Hello Hello Hello',
        time: 'Yesterday',
        unread: 10),
    MessageItem(
        name: 'Alice Zara', message: 'Hi Love', time: '11:43 pm', unread: 1),
    MessageItem(
        name: 'Alice Zara', message: 'Hi Love', time: '11:43 pm', unread: 1),
    MessageItem(
        name: 'Alice Zara', message: 'Hi Love', time: '11:43 pm', unread: 1),
    MessageItem(
        name: 'Alice Zara',
        message: 'Hello Hello Hello',
        time: 'Yesterday',
        unread: 10),
    MessageItem(
        name: 'Alice Zara', message: 'Hi Love', time: '11:43 pm', unread: 1),
    MessageItem(
        name: 'Alice Zara', message: 'Hi Love', time: '11:43 pm', unread: 1),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: SvgPicture.asset(
          'assets/vectors/createCode.svg',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Builder(
            builder: (context) => SafeArea(
                minimum: EdgeInsets.only(top: 10),
                child: Stack(children: [
                  SingleChildScrollView(
                      child: Column(children: [
                    Container(height: 70),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 0, bottom: 10, left: 20, right: 20),
                        child: Column(children: messageList))
                  ])),
                  Container(
                      height: 70,
                      color: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text('Messages',
                                      style: TextStyle(
                                          color: Color.fromRGBO(8, 19, 73, 1),
                                          fontFamily: 'Poppins',
                                          fontSize: 30,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                          height: 1)),
                                  Spacer(),
                                ]),
                            SizedBox(height: 0)
                          ])))
                ]))));
  }
}

class MessageItem extends StatefulWidget {
  final String name;
  final String message;
  final String time;
  final int unread;
  const MessageItem(
      {Key? key,
      required this.name,
      required this.message,
      required this.time,
      required this.unread})
      : super(key: key);

  @override
  State<MessageItem> createState() => _MessageItem();
}

class _MessageItem extends State<MessageItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(children: [
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
              Text(widget.message,
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
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(widget.time,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(37, 61, 232, 1),
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1)),
            SizedBox(height: 5),
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: xLogoDarkBlue,
                ),
                Text(widget.unread.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 10)),
              ],
            )
          ])
        ]));
  }
}
