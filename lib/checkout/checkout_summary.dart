import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kadpay/constants/constant.dart';

import '../components/gradient_text.dart';
import '../components/myoval_gradient_button.dart';
import '../components/mypop_widget.dart';
import '../components/normal_curve_container.dart';
import '../constants/widgets_constants.dart';

class CheckoutSummary extends StatefulWidget {
  const CheckoutSummary({
    Key? key,
  }) : super(key: key);

  @override
  _CheckoutSummaryState createState() => _CheckoutSummaryState();
}

class OrderModel {
  String title;
  String? value;
  OrderModel({
    required this.title,
    this.value,
  });
}

class _CheckoutSummaryState extends State<CheckoutSummary> {
  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            children: [
              NormalCurveContainer(
                pagetitle: 'Fund wallet',
                size: size,
                height: size.height * 0.49,
                container_radius: 140,
                widget: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: atmCard(size, '430', 'Arinze Hills'),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 10.0, top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: myBlue.withOpacity(0.6),
                          // spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 28),
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, left: 20, right: 20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'dada',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'dsda',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20, top: 20),
                          child: Center(
                            child: MyOvalGradientButton(
                                placeHolder: 'Fund ',
                                pressed: () {},
                                firstcolor: myOrange,
                                secondcolor: myLightOrange),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  showLoading(
    String title,
    String? message,
  ) {
    Widget widget() => Column(
          children: [
            Container(
              padding: EdgeInsets.all(0.0),
              height: 155,
              child: Image.asset(
                'assets/dullbaby.png',
                height: 60,
              ),
            ),
            GradientText(message ?? '',
                gradient: LinearGradient(colors: myOrangeGradient)),
            MyOvalGradientButton(
                placeHolder: 'Buy again',
                pressed: () {
                  Navigator.pop(context);
                },
                firstcolor: myLightOrange,
                secondcolor: myOrange)
          ],
        );
    myPopUp(context, title, widget());
  }
}

class OrderInfo {
  final String status;
  final String request_id;
  final String bonus;
  final String? units;
  final String purchased_code;

  OrderInfo({
    this.status = 'success',
    required this.request_id,
    required this.bonus,
    this.units,
    required this.purchased_code,
  });
}
