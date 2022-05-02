import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kadpay/components/my_text_field.dart';
import 'package:kadpay/constants/constant.dart';

import '../components/gradient_text.dart';
import '../components/myoval_gradient_button.dart';
import '../components/mypop_widget.dart';
import '../components/normal_curve_container.dart';
import '../constants/widgets_constants.dart';

class FundWallet extends StatefulWidget {
  const FundWallet({
    Key? key,
  }) : super(key: key);

  @override
  _FundWalletState createState() => _FundWalletState();
}

class OrderModel {
  String title;
  String? value;
  OrderModel({
    required this.title,
    this.value,
  });
}

class _FundWalletState extends State<FundWallet> {
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 40, 20, 15),
                          child: MyTextField(hintText: 'Enter Amout'),
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
