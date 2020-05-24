import 'package:flutter/material.dart';
import 'package:gezginmobile/models/user.dart';
import './screens/wrapper.dart';

import './screens/map__screen.dart';
import './screens/tabs_screen.dart';
import './screens/home_screen.dart';
import './screens/profile_screen.dart';
import 'package:provider/provider.dart';
import './services/auth.dart';
import './models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gezgin App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => StreamProvider<User>.value(
              value: AuthService().user,
              child: Wrapper(),
            ),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        MapScreen.routeName: (ctx) => MapScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen()
      },
    );
  }
}
