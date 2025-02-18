import 'package:get/get.dart';
import 'package:symphony_app/navber.dart';

import 'package:symphony_app/res/routes/routes_name.dart';
import 'package:symphony_app/view/specification_screen/specification_screen.dart';
import 'package:symphony_app/view/stacked_screens/stacked_screens.dart';
import 'package:symphony_app/view/support__screen/lso_support_screen.dart';
import 'package:symphony_app/view/support__screen/support_screen.dart';

import '../../view/splashscreen.dart';

class AppRoutes{

  static appRoutes()=>[
    GetPage(
        name: RouteName.navBarScreen,
        page: ()=>NavBar(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 250)

    ),
    GetPage(
        name: RouteName.splashScreen,
        page: ()=>const SplashScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 250)

    ),
    GetPage(
        name: RouteName.stackedPageView,
        page: ()=>const StackedScreens(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 250)

    ),
    GetPage(
        name: RouteName.specificationView,
        page: ()=> SpecificationScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 250)

    ),
    GetPage(
        name: RouteName.supportView,
        page: ()=> CheckSupportScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 250)

    ),
    GetPage(
        name: RouteName.lsoSupport,
        page: ()=> const LsoQueryPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 250)

    ),


  ];

}