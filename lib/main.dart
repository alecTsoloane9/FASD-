import 'package:fasd/ConnectionInj.dart';
import 'package:fasd/feedback.dart';
import 'package:fasd/constantsfasd.dart';
import 'package:fasd/pnpfasd.dart';
import 'package:fasd/profileedit.dart';
import 'package:fasd/theme_cons.dart';
import 'package:fasd/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:path_provider/path_provider.dart';
import 'FasdSplash.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:fasd/bottom_navigation.dart';
import 'package:fasd/tab_item.dart';
import 'package:fasd/tab_navigator.dart';
var imgg= 'lib/img/fasd.PNG';

List<Box> boxList=[];
Future<List<Box>> _openBox() async{
  var dir=await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  var hidb=Co();
  var dbna=hidb.dbhi;
  var itemfasd=await Hive.openBox("itemf");
  var biou=await Hive.openBox(dbna);
  boxList.add(itemfasd);
  boxList.add(biou);
  return boxList;
}
void main() async {
WidgetsFlutterBinding.ensureInitialized();
await _openBox();
////
///



///
///

  runApp( const MyApp());
  ConnectionInj.init();////con unchecked 
}
ThemeManager _themeManager=ThemeManager();
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
@override
void dispose() {
_themeManager.removeListener(themeListener);
    super.dispose();
  }
  @override
  void initState(){
    _themeManager.addListener(themeListener);
    super.initState();
  }
  themeListener(){
    if(mounted){setState(() {
      
    });}
  }
  @override
  Widget build(BuildContext context) {
  
    return  GetMaterialApp(
     debugShowCheckedModeBanner:false,
  theme: lightTheme,
   darkTheme: darkTheme,
   themeMode: _themeManager.themeMode,
         home:const FasdSpalsh(),
       
       
        );
  }
}
///////////////////////////////////////////////////////////////////////






class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
 /*
  String? currentPage;
  int? currentIndex;
List<String> pagekeys=["P1","P2","P3"];
Map<String,GlobalKey<NavigatorState>> _navigatorKeys={"P1":GlobalKey<NavigatorState>(),"P2":GlobalKey<NavigatorState>(),"P3":GlobalKey<NavigatorState>(),};
  */
  List<TabItem> pagekeys=[TabItem.HOME,TabItem.CREATE,TabItem.VIEW];
  var _currentTab=TabItem.HOME ;
  final _navigatorKeys = {

    TabItem.HOME: GlobalKey<NavigatorState>(),
    TabItem.CREATE: GlobalKey<NavigatorState>(),
    TabItem.VIEW: GlobalKey<NavigatorState>(),

  };
int _selectedIndex=0;

  //var index;
  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) { 
      // pop to first route
      
                 //  Navigator.pop(context);
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } 
    
    else {
    setState(() {
       _currentTab = tabItem;
      _selectedIndex=tabItem.index;
     } );
  
    }
    
  }
  /*
  void _selectTab(String tabItem,int index) {
    
      setState(() {
        _currentTab = tabItem;
        var _selectedIndex=index;
        });
    
  }
  */

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.HOME) {
            // select 'main' tab
            _selectTab(TabItem.CREATE);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(

appBar: AppBar(
        leading: Builder(
          builder: (context)=> 
             IconButton(icon:const Icon(Icons.menu),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
             ),
        ),
          title:const Text ("FASD"),
          actions: [
            Switch(value: _themeManager.themeMode==ThemeMode.dark, 
            
            onChanged: (newValue){
            _themeManager.toggleTheme(newValue);
          }
          )
          ],
   
      ),



drawer: Drawer(
      
        child: Column(
          children: [
            
            DrawerHeader(
              child:
              Column(
         children:[
           
            Container(
              height: 80,
              width:150,
              decoration:BoxDecoration(
     borderRadius: BorderRadius.circular(10),
      image: const DecorationImage(
        image: AssetImage('lib/img/fasd.PNG',),
      fit: BoxFit.fill,      
      ),
      shape: BoxShape.rectangle
              ) ,
                        
            
            ),
            
            ]

            )
               ),
               
















            const Padding( padding:  EdgeInsets.all(8.0),),

                        Padding(
              padding: const EdgeInsets.only(left:25.0),
              child: ListTile(
                leading:const Icon(Icons.message,),
                title:const Text("F E E D B A C K"),
                onTap:(){
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>FeedbackFasd()));

                } ,
              ),
            ),



            Padding(
              padding: const EdgeInsets.only(left:25.0),
              child: ListTile(
                leading:const Icon(Icons.account_circle_sharp
                //user_circle_1 
               
                 ),
                title:const Text("E D I T  P R O F I L E"),
                 onTap:(){
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const ProfileEditFasd()));

                } ,
              ),
            ),

          Padding(
              padding: const EdgeInsets.only(left:25.0),
              child: ListTile(
                leading:const Icon(Icons.business),
                title:const Text("P R I V A C Y & P O L I C Y"),
                onTap:(){
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>pnpFasd()));

                } ,
              ),
            ),
            const Padding(
              padding: 
              EdgeInsets.fromLTRB(25.0, 40, 0, 0),
              child: ListTile(
                leading: Icon(Icons.info, ),
                title: Text("F A S D 1D"),
                
              ),
            )
          ],
        ),
      ),


///////////////////////////////////
        body: 
        
                Stack(
          fit: StackFit.loose,
          children:
         <Widget>[
         
          _buildOffstageNavigator(TabItem.HOME),
          _buildOffstageNavigator(TabItem.CREATE),
          _buildOffstageNavigator(TabItem.VIEW),
 
        ]
        ),
        
          bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),



      ),
    );
  }
///////////////////////////



////////////////////////////////
  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}










