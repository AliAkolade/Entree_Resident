import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resident/Utils/constants.dart';
import 'package:intl/intl.dart';

class AddCodeScreen extends StatefulWidget {
  const AddCodeScreen({Key? key}) : super(key: key);

  @override
  State<AddCodeScreen> createState() => _AddCodeScreenState();
}

class _AddCodeScreenState extends State<AddCodeScreen> {
  Color labelColor = Color.fromRGBO(40, 49, 103, 1);
  late TextEditingController labelController =
      new TextEditingController(text: "");

  bool isDateShow = false;
  TextEditingController codeDate = new TextEditingController(text: '');
  String formattedDate = DateFormat.yMMMMd('en_US').format(DateTime.now());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      codeDate.text = formattedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(children: [
          Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Generate Code',
                          style: TextStyle(
                              color: Color.fromRGBO(8, 19, 73, 1),
                              fontFamily: 'Poppins',
                              fontSize: 30,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1)),
                      Spacer()
                    ]),
                SizedBox(height: 30),
                Row(children: [
                  Text('Label',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(147, 147, 147, 1),
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1))
                ]),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 0,
                  ),
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Color.fromRGBO(40, 49, 103, 1),
                      primaryColorDark: Color.fromRGBO(40, 49, 103, 1),
                      primaryColorLight: Color.fromRGBO(40, 49, 103, 1),
                    ),
                    child: Focus(
                        onFocusChange: (hasFocus) {
                          setState(() => labelColor = hasFocus
                              ? xLogoLightBlue
                              : Color.fromRGBO(40, 49, 103, 1));
                        },
                        child: TextField(
                          cursorColor: xLogoLightBlue,
                          controller: labelController,
                          decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              contentPadding: EdgeInsets.all(0),
                              filled: true,
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: xLogoLightBlue),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: xLogoLightBlue)),
                              labelText: '',
                              labelStyle: TextStyle(
                                color: labelController.text == ''
                                    ? labelColor
                                    : xLogoLightBlue,
                                fontFamily: 'Poppins',
                                fontSize: 20,
                              )),
                        )),
                  ),
                ),
                SizedBox(height: 40),
                Row(children: [
                  Text('Date',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(147, 147, 147, 1),
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1))
                ]),
                InkWell(
                    onTap: () {
                      setState(() {
                        isDateShow = !isDateShow;
                      });
                    },
                    child: TextField(
                      enabled: false,
                      controller: codeDate,
                      cursorColor: xLogoLightBlue,
                      decoration: InputDecoration(
                          prefixIcon: SizedBox(
                              child: Icon(Icons.calendar_today_outlined,
                                  color: xLogoLightBlue)),
                          disabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          hintText: codeDate.text,
                          hintStyle: TextStyle(color: xColorDarkBlue)),
                    )),
                isDateShow
                    ? Column(children: [
                        Container(
                            height: 200,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: DateTime.now(),
                              onDateTimeChanged: (DateTime newDateTime) {
                                // Do something
                                setState(() {
                                  formattedDate = DateFormat.yMMMMd('en_US')
                                      .format(newDateTime);
                                  codeDate.text = formattedDate;
                                });
                              },
                            )),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isDateShow = !isDateShow;
                            });
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(color: xLogoLightBlue),
                          ),
                        )
                      ])
                    : Container(
                        child: null,
                      ),
                SizedBox(height: 20),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(color: xLogoDarkBlue))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                xLogoDarkBlue)),
                        onPressed: () {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) => WillPopScope(
                                  onWillPop: () => Future.value(false),
                                  child: AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      title: Text(
                                        'Code Generated',
                                        textAlign: TextAlign.center,
                                      ),
                                      titleTextStyle: TextStyle(
                                          color: xLogoDarkBlue,
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                      content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/vectors/sampleQR.svg',
                                                color: xLogoDarkBlue),
                                            SizedBox(height: 20),
                                            Text('012345',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        37, 61, 232, 1),
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    letterSpacing: 5,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1)),
                                            SizedBox(height: 10),
                                            Text(labelController.text,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        37, 61, 232, 1),
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    letterSpacing: 2,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1)),
                                            SizedBox(height: 30),
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 30),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                        iconSize: 40,
                                                        onPressed: () {},
                                                        icon: SvgPicture.asset(
                                                            'assets/vectors/copy.svg',
                                                            color:
                                                                xLogoDarkBlue)),
                                                    Spacer(),
                                                    IconButton(
                                                      iconSize: 40,
                                                      onPressed: () {},
                                                      icon: SvgPicture.asset(
                                                          'assets/vectors/share.svg',
                                                          color: xLogoDarkBlue),
                                                    ),
                                                    Spacer(),
                                                    IconButton(
                                                        iconSize: 40,
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: Icon(Icons.close,
                                                            color:
                                                                xLogoDarkBlue))
                                                  ],
                                                ))
                                          ]))));
                        },
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              'Generate',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w700,
                                  height: 1),
                            ))))
              ]))
        ])));
  }
}
