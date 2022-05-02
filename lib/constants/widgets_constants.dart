import 'package:flutter/material.dart';
import 'package:kadpay/constants/constant.dart';

import '../components/gradient_text.dart';

Widget atmCard(size, amount, name) => Container(
      height: size.height * 0.31,
      width: size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: myBlueGradient)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Balance',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    GradientText(
                      'N $amount',
                      gradient: LinearGradient(colors: myOrangeGradient),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(0.0),
                    height: 60,
                    child: Image.asset('assets/atmchip.png')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '**** **** *** 1112',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
                // Container(
                //     padding: EdgeInsets.all(0.0),
                //     height: 60,
                //     child: Image.asset('assets/atmchdip.png')),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(colors: myOrangeGradient)),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(colors: myOrangeGradient)),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
