import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kadpay/constants/constant.dart';

class MyMenu extends StatelessWidget {
  const MyMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FabCircularMenu(
        fabOpenColor: myBlue,
        fabCloseColor: myBlue,
        ringColor: myBlue,
        // fabOpenIcon: ImageIcon(
        //                       AssetImage('assets/fabmenu.png'),
        //                         size: 90,
        //                         color:myBlue,
        //                       ),
        fabOpenIcon: SvgPicture.asset(
          'assets/menu-right.svg',
          color: myOrange,
          height: 30,
        ),
        children: [
          InkWell(
            onTap: () {
              // MyNavigate.navigatepushuntil(HomePage(), context);
            },
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {},
            child: ImageIcon(
              AssetImage('assets/airtime.png'),
              size: 50,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              // MyNavigate.navigatejustpush(ActionsPage(user_id: 2), context);
            },
            child: ImageIcon(
              AssetImage('assets/trans.png'),
              size: 50,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              // MyNavigate.navigatejustpush(Profile(), context);
            },
            child: Icon(
              Icons.person_rounded,
              size: 35,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ]);
  }
}
