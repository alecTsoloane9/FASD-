import 'package:fasd/createp.dart';
import 'package:fasd/homefasdlis.dart';
import 'package:fasd/viewhome.dart';
import 'package:flutter/material.dart';
import 'package:fasd/tab_item.dart';
int? ix;
class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {super.key, required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;


  @override
  Widget build(BuildContext context) {
    Widget child;
    if(tabItem.index==0){child=const FasdHomSc();}
       else if(tabItem.index==1){child=const CreateFasd();}
       else {child=const ViewFasdh();}
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => child,
        );
      },
    );
  }
}
