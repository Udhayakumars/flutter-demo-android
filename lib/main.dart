import 'package:MMLMobile/Screens/SplashScreen.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/screens/ComingSoonScreen.dart';
import 'package:MMLMobile/screens/HomeScreen.dart';
import 'package:MMLMobile/screens/LoginScreenV.dart';
import 'package:MMLMobile/screens/ReviveScreen.dart';
import 'package:MMLMobile/screens/SplashScreen.dart' as splash;
import 'package:MMLMobile/screens/navigation/NavigationCalls.dart';
import 'package:MMLMobile/screens/navigation/home/Settings.dart';
import 'package:MMLMobile/screens/navigation/organization/core/VideoTrimmer.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Accounts/account.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Companies/companies.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Locations/locations.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Sites/Sites.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Things/things.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Users/users.dart';
import 'package:MMLMobile/screens/navigation/settings/About.dart';
import 'package:MMLMobile/screens/navigation/settings/ChangePassword.dart';
import 'package:MMLMobile/screens/navigation/settings/Debug.dart';
import 'package:MMLMobile/screens/navigation/settings/Notification.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:MMLMobile/utils/UtilMethods.dart';
import 'package:catcher/catcher.dart';
import 'package:catcher/handlers/console_handler.dart';
import 'package:catcher/handlers/email_manual_handler.dart';
import 'package:catcher/mode/dialog_report_mode.dart';
import 'package:catcher/model/catcher_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:page_transition/page_transition.dart';

import 'customwidgets/ImageViewEdit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
  );
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.black));

  await UtilMethods.loadEnvFile(APIConstants.ENV_FILE);
  await GlobalConfiguration().loadFromAsset("PIandPRIValues");

  // ReportMode reportMode = DialogReportMode();
  // /// STEP 1. Create catcher configuration.
  // /// Debug configuration with dialog report mode and console handler. It will show dialog and once user accepts it, error will be shown   /// in console.
  // CatcherOptions debugOptions =
  // CatcherOptions(reportMode, [ConsoleHandler(enableApplicationParameters: true,
  //     enableDeviceParameters: true,
  //     enableCustomParameters: true,
  //     enableStackTrace: true),  HttpHandler(HttpRequestType.post, Uri.parse("https://"),
  //     printLogs: true)
  // ]);

  CatcherOptions debugOptions = CatcherOptions(DialogReportMode(), [
    ConsoleHandler(
        enableApplicationParameters: true,
        enableDeviceParameters: true,
        enableCustomParameters: true,
        enableStackTrace: true)
  ]);
  CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
    EmailManualHandler(["recipient@email.com"])
  ]);
  CatcherOptions profileOptions = CatcherOptions(
    DialogReportMode(),
    [
      ConsoleHandler(
          enableApplicationParameters: true,
          enableDeviceParameters: true,
          enableCustomParameters: true,
          enableStackTrace: true),
      ToastHandler()
    ],
    handlerTimeout: 10000,
    customParameters: {"example": "example_parameter"},
  );
  //Catcher(MyApp(), debugConfig: debugOptions, releaseConfig: releaseOptions, profileConfig: profileOptions, enableLogger: true);

  /// STEP 2. Pass your root widget (MyApp) along with Catcher configuration:
  //Catcher(MyApp(), debugConfig: debugOptions, releaseConfig: releaseOptions);

  // final database = $FloorAppDatabase.databaseBuilder('flutter_database.db')
  //     .build();
  AppDatabase appDatabase;
  appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
  APIConstants.initialize();
  Widget _defaultHome = SplashScreen();
  final isLoggedIn = await Preference.getItem('IsLoggedIn');
  if (await Preference.containsKey("IsLoggedIn")) {
    _defaultHome = ReviveScreen();
  } else {
    _defaultHome = SplashScreen();
  }
  FlutterStatusbarcolor.setStatusBarColor(Color.fromRGBO(80, 80, 80, 0.4));
  runApp(MaterialApp(
    navigatorKey: Catcher.navigatorKey,
    builder: (BuildContext context, Widget widget) {
      GlobalState.apiLoading = false;
      Catcher.addDefaultErrorWidget(
          showStacktrace: true,
          title:
          "There was an unexpected error in the application, please restart and login again",
          description:
          "Looks like the app had an unexpected error, please reach out to the developer if the problem persists.");
      return widget;
    },
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: _defaultHome,
    // routes: <String, WidgetBuilder>{
    //   "/customwidgets/ImageViewEdit": (BuildContext context) => new ImageViewEdit(),
    //   "/videoTrimmer": (BuildContext context) => new TrimmerView(),
    // },
    // onGenerateRoute: (settings) {
    //   switch (settings.name) {
    //     case "/screens/LoginScreen":
    //       return PageTransition(
    //         child: new LoginScreenV(),
    //         type: settings.arguments == null
    //             ? PageTransitionType.rightToLeft
    //             : (settings.arguments == 'eventBack'
    //                 ? PageTransitionType.leftToRight
    //                 : PageTransitionType.rightToLeft),
    //         settings: settings,
    //       );
    //     case "/screens/HomeScreen":
    //       return PageTransition(
    //         child: new NavigationCalls(),
    //         type: settings.arguments == null
    //             ? PageTransitionType.rightToLeft
    //             : (settings.arguments == 'eventBack'
    //                 ? PageTransitionType.leftToRight
    //                 : PageTransitionType.rightToLeft),
    //         settings: settings,
    //       );
    //     case "/screens/SplashScreen":
    //       return PageTransition(
    //         child: new SplashScreen(),
    //         type: settings.arguments == null
    //             ? PageTransitionType.rightToLeft
    //             : (settings.arguments == 'eventBack'
    //                 ? PageTransitionType.leftToRight
    //                 : PageTransitionType.rightToLeft),
    //         settings: settings,
    //       );
    //     case '/screens/navigation/home/Settings':
    //       return PageTransition(
    //         child: new SettingsTabScreen(),
    //         type: settings.arguments == null
    //             ? PageTransitionType.rightToLeft
    //             : (settings.arguments == 'eventBack'
    //                 ? PageTransitionType.leftToRight
    //                 : PageTransitionType.rightToLeft),
    //         settings: settings,
    //       );
    //       break;
    //     case '/screens/navigation/settings/ChangePassword':
    //       return PageTransition(
    //         child: new ChangePassword(),
    //         type: settings.arguments == null
    //             ? PageTransitionType.rightToLeft
    //             : (settings.arguments == 'eventBack'
    //                 ? PageTransitionType.leftToRight
    //                 : PageTransitionType.rightToLeft),
    //         settings: settings,
    //       );
    //       break;
    //     case '/screens/navigation/settings/Notification':
    //       return PageTransition(
    //         child: new NotificationSettings(),
    //         type: settings.arguments != null
    //             ? PageTransitionType.rightToLeft
    //             : (settings.arguments == 'eventBack'
    //                 ? PageTransitionType.leftToRight
    //                 : PageTransitionType.rightToLeft),
    //         settings: settings,
    //       );
    //       break;
    //     case '/screens/navigation/settings/About':
    //       return PageTransition(
    //         child: new About(),
    //         type: settings.arguments == null
    //             ? PageTransitionType.rightToLeft
    //             : (settings.arguments == 'eventBack'
    //                 ? PageTransitionType.leftToRight
    //                 : PageTransitionType.rightToLeft),
    //         settings: settings,
    //       );
    //       break;
    //     case '/screens/navigation/settings/Debug':
    //       return PageTransition(
    //         child: new Debug(),
    //         type: settings.arguments == null
    //             ? PageTransitionType.rightToLeft
    //             : PageTransitionType.rightToLeft,
    //         settings: settings,
    //       );
    //       break;
    //     case '/screens/navigation/organization/core/things':
    //       return PageTransition(
    //         child: new ThingScreen(),
    //         type: settings.arguments == null
    //             ? PageTransitionType.rightToLeft
    //             : PageTransitionType.rightToLeft,
    //         settings: settings,
    //       );
    //       break;
    //     case '/screens/navigation/organization/core/locations':
    //       return PageTransition(
    //         child: new LocationsScreen(),
    //         type: settings.arguments == null
    //             ? PageTransitionType.rightToLeft
    //             : PageTransitionType.rightToLeft,
    //         settings: settings,
    //       );
    //       break;
    //     case '/screens/navigation/organization/core/companies':
    //       return PageTransition(
    //         child: new CompaniesScreen(),
    //         type: settings.arguments == null
    //             ? PageTransitionType.rightToLeft
    //             : PageTransitionType.rightToLeft,
    //         settings: settings,
    //       );
    //       break;
    //     case '/screens/navigation/organization/core/places':
    //       return PageTransition(
    //         child: new PlacesScreen(),
    //         type: settings.arguments == null
    //             ? PageTransitionType.rightToLeft
    //             : PageTransitionType.rightToLeft,
    //         settings: settings,
    //       );
    //       break;
    //     case '/screens/navigation/organization/core/users':
    //       return PageTransition(
    //         child: new UsersScreen(),
    //         type: settings.arguments == null
    //             ? PageTransitionType.rightToLeft
    //             : PageTransitionType.rightToLeft,
    //         settings: settings,
    //       );
    //       break;
    //     case '/screens/navigation/organization/core/account':
    //       return PageTransition(
    //         child: new AccountScreen(),
    //         type: settings.arguments == null
    //             ? PageTransitionType.rightToLeft
    //             : PageTransitionType.rightToLeft,
    //         settings: settings,
    //       );
    //       break;
    //     case 'comingSoon':
    //       return PageTransition(
    //         child: new ComingSoonScreen(),
    //         type: settings.arguments == null
    //             ? PageTransitionType.rightToLeft
    //             : PageTransitionType.rightToLeft,
    //         settings: settings,
    //       );
    //       break;
    //     default:
    //       return null;
    //       break;
    //   }
    // },
    debugShowCheckedModeBanner: false,
  ));
}

// class MyApp extends StatelessWidget {
//   // const MyApp({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//   }
// }
