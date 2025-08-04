import 'package:flutter/material.dart';
import 'package:fasd/tab_item.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatelessWidget {
  
   BottomNavigation({super.key, required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
void Function (int)? onTabChange;
  @override
  Widget build(BuildContext context) {
    return Container(
    margin:const EdgeInsets.all(5),
    child:GNav (
      gap: 5,     
      tabBackgroundColor:  Colors.black38,
      tabBorderRadius: 24,
      activeColor:const Color.fromARGB(255, 245, 241, 241),

      onTabChange:(index) => onSelectTab(
      TabItem.values[index],
      ),
      selectedIndex: currentTab.index,
      tabs: const [
     GButton (icon: Icons.home,text: "HOME",),
      GButton(icon: Icons.create,text: "CREATE",),
      GButton(icon: Icons.search,text: "VIEW",),
    ],),

    );
  }

}
