import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gradp2p/core/constants/routes.dart';

class navDrawer extends StatelessWidget {
  const navDrawer({super.key});

  Future<Map<String, String>> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name') ?? 'No Name';
    String smartEmail = prefs.getString('smartEmail') ?? 'No Email';
    return {'name': name, 'smartEmail': smartEmail};
  }
Future<void> clearToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('smartEmail');
    await prefs.remove('name');
    await prefs.remove('phone');
    await prefs.remove('birthDate');
    print("Token and user data cleared");
  }
  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FutureBuilder<Map<String, String>>(
                future: getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error loading user data'));
                  } else {
                    final userData = snapshot.data!;
                    return buildHeader(
                        context, userData['name']!, userData['smartEmail']!);
                  }
                },
              ),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context, String name, String email) =>
      Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              name,
              style: const TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 24,
                fontFamily: 'Abel',
                fontWeight: FontWeight.w400,
                height: 0.07,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              email,
              style: const TextStyle(
                color: Color(0xFF827F7F),
                fontSize: 13,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                height: 0.25,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text("Home"),
              onTap: () {
                Get.toNamed(AppRoute.Bottomnavbar);
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment_outlined),
              title: const Text("My wallet"),
              onTap: () {
                Get.toNamed(AppRoute.Wallet);
              },
            ),
            ListTile(
              leading: const Icon(Icons.loop),
              title: const Text("Transaction"),
              onTap: () {
                Get.toNamed(AppRoute.transaction);
              },
            ),
            ListTile(
              leading: const Icon(Icons.grid_view_rounded),
              title: const Text("Service"),
              onTap: () {
                Get.toNamed(AppRoute.service);
              },
            ),
            ListTile(
              leading: const Icon(Icons.currency_bitcoin_outlined),
              title: const Text("Crypto History"),
              onTap: () {
                Get.toNamed(AppRoute.Cryptohistory);
              },
            ),
            ListTile(
              leading: const Icon(Icons.send),
              title: const Text("Help"),
              onTap: () {
                Get.toNamed(AppRoute.SplashBot);
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_center_rounded),
              title: const Text("FAQ"),
              onTap: () {
                Get.toNamed(AppRoute.Bottomnavbar);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () async {
                await clearToken();
                Get.offAllNamed(AppRoute.login);
              },
            ),
          ],
        ),
      );
}
