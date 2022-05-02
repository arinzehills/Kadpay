import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kadpay/components/gradient_text.dart';
import 'package:kadpay/constants/widgets_constants.dart';

import 'components/drawer.dart';
import 'components/mymenu.dart';
import 'constants/constant.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // drawer: MyDrawer(
      //   userid: 1,
      //   username: 'Hills',
      // ),

      floatingActionButton: MyMenu(),
      appBar: AppBar(
        // titleTextStyle: TextStyle(A),
        elevation: 0.0,
        centerTitle: false,
        title: GradientText('KADPAY',
            gradient: LinearGradient(colors: myBlueGradient)),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              // Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/menu-right.svg',
              color: myOrange,
              height: 30,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 10,
              // left: 15,
              // right: 15,
            ),
            child: Column(children: [
              atmCard(size, '403', 'Arinze Hills'),
            ]),
          ),
        ),
      )),
    );
  }
}
