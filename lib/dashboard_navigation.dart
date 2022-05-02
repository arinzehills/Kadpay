import 'package:flutter/material.dart';
import 'package:kadpay/auth_screens/registration/address_page.dart';
import 'package:kadpay/auth_screens/registration/reg_indicator.dart';
import 'package:kadpay/fundwallet/fund_wallet.dart';
import 'package:kadpay/home_page.dart';

import 'constants/constant.dart';

class DashboardNavigation extends StatefulWidget {
  final int? index;

  const DashboardNavigation({Key? key, this.index}) : super(key: key);

  @override
  _DashboardNavigationState createState() => _DashboardNavigationState();
}

class _DashboardNavigationState extends State<DashboardNavigation> {
  late int _selectedIndex = widget.index ?? 0;

  List<Widget> _widgetOptions = <Widget>[
    Homepage(),
    FundWallet(),
    FundWallet(),
    Homepage(),
  ];

  @override
  void initState() {
    super.initState();
    // var index = widget.index;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
                color: myOrange,
              ),
              label: 'Dashboard',
              activeIcon: RadiantGradientMask(
                  child: Icon(
                Icons.home_outlined,
                size: 30,
                color: Colors.white,
              ))),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/transactions.png'),
              color: myOrange,
              size: 30,
            ),
            label: 'Transactions',
            activeIcon: RadiantGradientMask(
                child: Icon(
              Icons.move_down_rounded,
              size: 30,
              color: Colors.white,
            )),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                'assets/fundwallet.png',
              ),
              size: 30,
              color: myOrange,
            ),
            label: 'Fund wallet',
            activeIcon: RadiantGradientMask(
                child: Icon(
              Icons.attach_money_rounded,
              size: 30,
              color: Colors.white,
            )),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
              size: 35,
              color: myOrange,
            ),
            label: 'Profile',
            activeIcon: RadiantGradientMask(
                child: Icon(
              Icons.account_circle,
              size: 30,
              color: Colors.white,
            )),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: myLightBlue,
        unselectedItemColor: Colors.grey[400],
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return RadialGradient(
          center: Alignment.bottomLeft,
          radius: 0.5,
          colors: <Color>[
            myLightBlue,
            myBlue,
            myLightBlue,
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
