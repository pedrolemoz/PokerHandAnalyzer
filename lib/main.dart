import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poker_hand_analyzer/model/user_hands.dart';
import 'package:poker_hand_analyzer/pages/home_page.dart';
import 'package:poker_hand_analyzer/utils/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF5F8FC),
      statusBarIconBrightness: Brightness.dark,
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserHands>(
          create: (context) => UserHands(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: Color(0xFFF5F8FC),
          scaffoldBackgroundColor: Color(0xFFF5F8FC),
          primaryColor: Colors.green[800],
          textTheme: theme,
        ),
        home: HomePage(),
      ),
    );
  }
}
