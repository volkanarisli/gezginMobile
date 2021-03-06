import 'package:flutter/material.dart';
import 'package:gezginmobile/models/user.dart';
import 'package:gezginmobile/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import './tabs_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return TabsScreen();
    }
  }
}
