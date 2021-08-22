import 'package:resident/Utils/bottom_nav_bar.dart';
import 'package:resident/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddCodeScreen extends StatefulWidget {
  const AddCodeScreen({Key? key}) : super(key: key);

  @override
  State<AddCodeScreen> createState() => _AddCodeScreenState();
}

class _AddCodeScreenState extends State<AddCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: xColorDarkBlue,
        body: SafeArea(child: Container(child: null)));
  }
}
