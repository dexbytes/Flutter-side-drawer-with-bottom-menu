import 'dart:io';
import 'package:side_drawwer_with_bottom_menu/p_main_app/screens_p/ScreenSideDrawer.dart';
import 'package:side_drawwer_with_bottom_menu/p_main_app/screens_p/feeds_screen.dart';
import 'package:side_drawwer_with_bottom_menu/p_main_app/utils_p/custom_left_profile_app_bar.dart';
import 'package:side_drawwer_with_bottom_menu/p_main_app/utils_p/screen_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils_p/app_color.dart';
import '../utils_p/app_dimens.dart';
class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> with WidgetsBindingObserver {
  int selectedBottomMenu = 0;
  var notificationCount = 0;
  int currentSelectedMenu = 0;
  String currentSelectedMenuTitle = "Feeds";
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // user returned to our app
    } else if (state == AppLifecycleState.inactive) {
      // app is inactive
    } else if (state == AppLifecycleState.paused) {
      // user is about quit our app temporally
    }
  }

  @override
  Widget build(BuildContext context) {
    //Get Screen size
    appDimens.appDimensFind(context: context);

    List<Widget> selectedScreensOnBottomMenu = <Widget>[
      FeedsScreen(),
      Container(child: Center(child: Text("Users menu selected"),),),
      Container(child:Center(child: Text("Users menu selected"),),),
      Container(child: Center(child: Text("Chat menu selected"),),),
      Container(child: Center(child: Text("Users menu selected"),),),
    ];
    void getBottomMenuIndex(index, isOpenOutSideView) {
      currentSelectedMenu = index;
      //Check is showing menu selected and show view in the container
      if (index != null && !isOpenOutSideView) {
        //Check is showing menu selected and show view in side the container
        if (!isOpenOutSideView) {
          setState(() {
            selectedBottomMenu = index;
            switch (index) {
              case 0:
                {
                  setState(() {
                    currentSelectedMenuTitle = "Feeds";
                  });
                  break;
                }
              case 1:
                {
                  setState(() {
                    currentSelectedMenuTitle = "Users";
                  });
                  break;
                }
              case 3:
                {
                  setState(() {
                    currentSelectedMenuTitle = "Chat";
                  });
                  break;
                }
            }
          });
        }
      }

      //Check is showing menu selected and show view outside of the container
      if (index != null && (isOpenOutSideView != null && isOpenOutSideView)) {
        //Check is showing menu selected and show view in the container
        switch (index) {
          case 0:
            {

              break;
            }
          case 1:
            {

            }
            break;
          case 2:
            {
              /*setState(() {
                currentSelectedMenuTitle = "Add feeds";
              });*/
              break;
            }
          case 3:
            {

              break;
            }
          case 4:
            {
              if (_scaffoldKey.currentState.isDrawerOpen)
              {
                //Scaffold.of(context).openEndDrawer(),
                print("drawer open");
      _scaffoldKey.currentState.openEndDrawer();
      }
      else if (!_scaffoldKey.currentState.isDrawerOpen)
      {
      //Scaffold.of(context).openDrawer(),
      print("drawer close");
      _scaffoldKey.currentState.openDrawer();
      //  ProjectLogs.LogsE("Home","Open")
      }
              /*setState(() {
                currentSelectedMenuTitle = "Side menu";
              });*/
              break;
            }
        }
      }
    }

    _onBackPressed() {
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      }else if(Platform.isIOS) {
        // exit(0);
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      }
      else{
        exit(0);
      }
    }
    //Main view
    return WillPopScope(
        onWillPop: _onBackPressed,
        child:Scaffold(
        key: _scaffoldKey,
        backgroundColor: appColors.appBgColor[100],
          appBar: getAppBar(),
          body: Container(
            color: appColors.appBgColor[600],
            child: selectedScreensOnBottomMenu[selectedBottomMenu],
          ),
          bottomNavigationBar: SafeArea(
              child: Container(
                child: ScreenBottomBar(getBottomMenuIndex, notificationCount),
              )),
        drawer: ScreenSideDrawer(_scaffoldKey,(){

        }),
        ));
  }

    //Move to next screen
  void moveToLoginScreen() {

  }
  //Move to next screen
  void moveToRegisterScreen() {

  }

  //Get App bar
  getAppBar() {
    return customLeftProfileAppBar.appBarHomeProfileWithTittleAndRightIcon(
        statusbarHeight: MediaQuery.of(context).padding.top,
        title: currentSelectedMenuTitle,
        appBarBgColor: // Colors.red,
        appColors.appBarBgColor,
        titleColor: appColors.appBarTextColor,
        titleFontSize: appDimens.fontSize(value: 20),
        profileUrl: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
        name: "_userName",
        profileSize: appDimens.widthDynamic(value: 41),
        rightIcon: null,
        rightIconSize: appDimens.iconSquareCustom(value: 25),
        onProfilePressed: () {

        },
        onNotificationPressed: () {

        });
  }
  }


