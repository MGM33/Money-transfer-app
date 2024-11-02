import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/bottomNavBar_controller.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:gradp2p/view/screens/Home/Wallet.dart';
import 'package:gradp2p/view/screens/Home/dashboard.dart';
import 'package:gradp2p/view/screens/Home/home%20.dart';
import 'package:gradp2p/view/screens/ManageCards/manageCards.dart';

class Bottomnavbar extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> pages = [
    Home(),
    Dashboard(),
    Wallet(),
    manageCards(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
           type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedIndex.value,
          backgroundColor:kColor1,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (index) {
            controller.changeIndex(index);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/tabler_credit-card.png'),
                size: 30,
              ),
              label: "My Cards",
            ),
          ],
        ),
      ),
    );
  }
}
