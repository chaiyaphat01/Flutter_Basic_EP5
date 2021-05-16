import 'package:flutter/widgets.dart';
import 'package:flutter_basic_navigation/Screens/Drawer/about/about_screen.dart';
import 'package:flutter_basic_navigation/Screens/Drawer/term/term_screen.dart';
import 'package:flutter_basic_navigation/Screens/Drawer/contact/contact_screen.dart';
import 'package:flutter_basic_navigation/Screens/dashboard/dashboard_screen.dart';
import 'package:flutter_basic_navigation/Screens/login_screen/login_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => LoginScreen(),
  "/dashboard": (BuildContext context) => DashBoard(),
  "/about": (BuildContext context) => AboutScreen(),
  "/term": (BuildContext context) => TermScreen(),
  "/contact": (BuildContext context) => ContactScreen(),
};
