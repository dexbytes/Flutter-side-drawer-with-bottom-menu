
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_drawwer_with_bottom_menu/p_main_app/utils_p/app_color.dart';
import 'package:side_drawwer_with_bottom_menu/p_main_app/utils_p/app_fonts.dart';
import 'package:side_drawwer_with_bottom_menu/p_main_app/utils_p/custome_view.dart';

class ScreenSideDrawer extends StatefulWidget {
  GlobalKey<ScaffoldState> scaffoldKey ;
  var onUpdate;
  ScreenSideDrawer(mScaffoldKey, onUpdate){
    this.scaffoldKey = mScaffoldKey;
    this.onUpdate = onUpdate;
  }
  @override
  _SideDrawer createState() => _SideDrawer(this.scaffoldKey,this.onUpdate);
}

class _SideDrawer extends State<ScreenSideDrawer> {
  GlobalKey<ScaffoldState> _scaffoldKey ;
  var onUpdate;
  var screenSize, screenHeight, screenWidth;

  var cat_items, name = 'Guest';
  int productDataLength = 0;
  List<String> drawerList = new List();

  _SideDrawer(GlobalKey<ScaffoldState> mScaffoldKey,onUpdate) {
    if(onUpdate!=null){
      this.onUpdate = onUpdate;
    }
    _scaffoldKey= mScaffoldKey;
  }
  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("dinesh");
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    screenHeight = screenSize.height;
    screenWidth = screenSize.width;
    //simple list creation
    List<String> drawerItems() {
      drawerList.add("Account");
      drawerList.add("Security");
      drawerList.add("Help");
      drawerList.add("About Us");
      drawerList.add("Privecy Policy");
      drawerList.add("Sign Out");
      return drawerList;
    }
    if (drawerList.length == 0) {
      drawerItems();
    }
  /*=================drawerItemClick====================*/
    void drawerItemClick(int itemName) {
      switch (itemName) {
      //case "Rules":
        case 0:
          {
            print("Account");
            /*Navigator.push(
                context, SlideRightRoute(widget: ScreenHistory()));*/
            if (_scaffoldKey.currentState.isDrawerOpen) {
              _scaffoldKey.currentState.openEndDrawer();
            }
          }
          break;
        case 1:
          {
            print("Security");
           // Navigator.push(context, SlideRightRoute(widget: ScreenSecurity()));
            if (_scaffoldKey.currentState.isDrawerOpen) {
              _scaffoldKey.currentState.openEndDrawer();
            }
          }
          break;
        case 2://"Terms of service":
          {
            print("Help");
            if (_scaffoldKey.currentState.isDrawerOpen) {
              _scaffoldKey.currentState.openEndDrawer();
            }
          }
          break;

        case 3://"FAQ":
          {
            print("About DocCredit");
            if (_scaffoldKey.currentState.isDrawerOpen) {
              _scaffoldKey.currentState.openEndDrawer();
            }
          }
          break;
        case 4://"About Price Ninja":
          {
            print("Privecy Policy");
            if (_scaffoldKey.currentState.isDrawerOpen) {
              _scaffoldKey.currentState.openEndDrawer();
            }
            /*Navigator.push(
            context, SlideRightRoute(widget: ScreenAboutNinja()));*/
          }
          break;

        case 5://"Transaction History":
          {
            print("Sign Out");
            if (_scaffoldKey.currentState.isDrawerOpen) {
              _scaffoldKey.currentState.openEndDrawer();
            }
            try {
              /*customView.confimationDialog(
                  context,
                  '',
                  'Are you sure you want to logout?',
                      (mcontext) => {
                    AppUtilsFilesLink().appSharedPreferencesFile.clearAll(),
                    Navigator.pop(mcontext, true),
                    print("pop up sure button clicked"),
                    //AppUtilsFilesLink().appProjectUtilFile.exitApp()
                  });*/
            } catch (e) {
              print(e);
            }
            /*Navigator.push(
                context, SlideRightRoute(widget: ScreenHistory()));*/
          }
          break;

        default:
          {
            print("Invalid choice");
          }
          break;
      }
    }
    return
      MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
        ),
        home:
        Scaffold(backgroundColor: Colors.transparent,body: Drawer(
          child: Container(
            color: appColors.drawerBgColor,
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.only(left: screenWidth / 30, right: screenWidth / 30),
              children: <Widget>[
                Container(
                  height: screenSize.height,
                  decoration: BoxDecoration(
                    color: appColors.drawerBgColor,
                  ),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight / (105)),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight,
                                //  child: IconButton(icon: AssetImage("assets/images/home_module_images/Setting.png"),color: AppColors.white,height: 20,width: 20,),
                                child: IconButton(
                                  icon: new ImageIcon(
                                      new AssetImage(
                                          "assets/images/smile.png"),
                                      color: appColors.black),
                                  iconSize: 20,
                                  onPressed: () => {
                                    /*Navigator.push(
                                            context,
                                            SlideRightRoute(
                                                widget: ScreenSetting())),*/
                                    if (_scaffoldKey
                                        .currentState.isDrawerOpen)
                                      {
                                        _scaffoldKey.currentState
                                            .openEndDrawer()
                                      }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          if (_scaffoldKey.currentState.isDrawerOpen)
                            {_scaffoldKey.currentState.openEndDrawer()},
                          // Navigator.push(context,SlideRightRoute(widget: ScreenUserProfile()),),
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Image(
                              image: AssetImage(
                                  "assets/images/smile.png"),
                              height: screenHeight / 8,
                              width: screenWidth / 3.5,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () => {
                            if (_scaffoldKey.currentState.isDrawerOpen)
                              {
                                _scaffoldKey.currentState
                                    .openEndDrawer()
                              },
                          },
                          child: Padding(
                            padding:
                            EdgeInsets.only(top: screenHeight / 90),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Hi, $name",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 22,
                                  color: appColors.drawerTextColor,
                                  fontFamily: appFonts.defaultFont,
                                ),
                              ),
                            ),
                          )),
                      Container(
                        height: 1.2,
                        color: appColors.drawerTextColor,
                        margin: const EdgeInsets.only(top: 15),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Container(
                          height: screenHeight / 2,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: drawerList.length,
                            itemBuilder: (context, index) {
                              return
                                Padding(
                                padding:
                                EdgeInsets.only(top: screenHeight / 40),
                                child: GestureDetector(
                                  onTap: () => {
                                    // print(drawerList[index]),
                                    drawerItemClick(index)
                                  },
                                  child:

                                  Container(child: Row(
                                    children: <Widget>[
                                      Text(
                                        drawerList[index],
                                        style: TextStyle(fontFamily: appFonts.mainFont,color: appColors.drawerTextColor,fontSize: 19,fontWeight: FontWeight.w300),
                                      ),
                                      /*Expanded(
                                        child: Align(
                                            alignment: Alignment.topRight,
                                            child: Image(
                                              image: AssetImage(
                                                  "assets/images/home_module_images/Arrow(right).png"),
                                              height: 18,
                                              width: 18,
                                              color: appColors.drawerLetIconColor,
                                            )
                                          *//*Icon(Icons.arrow_forward_ios,color: AppColors.white),*//*
                                        ),
                                      )*/
                                    ],
                                  ),color: Colors.transparent,padding: EdgeInsets.only(top: 5,bottom: 5),),
                                ),
                              );
                            },
                          ),
                        ),
                      )

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),),

      );

  }


}

