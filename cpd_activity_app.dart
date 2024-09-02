import "package:assignment_flutter/cpd_activity_logic.dart";
import "package:assignment_flutter/cpd_activity_screen.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "cpd_activity_favorite_logic.dart";

Widget cpdActivityAppWithProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CpdActivityLogic()),
      ChangeNotifierProvider(create: (context) => FavoriteCpdActivityLogic()),
    ],
    child: const CpdActivityApp(),
  );
}

class CpdActivityApp extends StatelessWidget {
  const CpdActivityApp({super.key});

  //const CpdActivityApp({super.key});

  Future<void> readLogics(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: CpdActivityScreen());
    return FutureBuilder<void>(
      future: readLogics(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const MaterialApp(home: CpdActivityScreen());
        } else {
          return _buildSplashScreen();
        }
      },
    );
  }

  Widget _buildSplashScreen() {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            alignment: Alignment.center,
            color: Colors.blueGrey[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "pictures/logo.png",
                  height: 110,
                  fit: BoxFit.fill,
                ),
                const CircularProgressIndicator(color: Colors.white),
              ],
            )),
      ),
    );
  }
}
