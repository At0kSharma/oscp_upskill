import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oscp_upskill/features/home/controllers/webpageview_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _HomeScreenState extends State<HomeScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(
            'https://upskillfinder.com/oscp-certification-training-course/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: FutureBuilder(
      //     future: _getCurrentUserId(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const CircularProgressIndicator();
      //       } else {
      //         return Text('User ID: ${snapshot.data}');
      //       }
      //     },
      //   ),
      // ),
      appBar: AppBar(
        toolbarHeight: 5.0,
        backgroundColor: const Color(0xFFFF1137),
      ),
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () async {
          if (await controller.canGoBack()) {
            controller.goBack();
            return false;
          } else {
            return true;
          }
        },
        child: WebPageView(
          controller: controller,
        ),
      ),
    );
  }
}

// Future<String?> _getCurrentUserId() async {
//   User? user = _auth.currentUser;
//   return user?.phoneNumber;
// }
