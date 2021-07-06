import 'package:MMLMobile/models/PageDirectionObject.dart';
import 'package:flutter/material.dart';
import 'package:global_state/gs.dart';
import 'package:http/http.dart' as http;

// GS values storage.
class GlobalState {
  //set page PI value in global
  static int get PI => gs['PI'];
  static set PI(int value) => gs['PI'] = value;

  static String get downloadFileTaskID => gs['downloadFileTaskID'];
  static set downloadFileTaskID(String value) => gs['downloadFileTaskID'] = value;



  static bool get errorCallMsgShown => gs['errorCallMsgShown'];
  static set errorCallMsgShown(bool value) => gs['errorCallMsgShown'] = value;

  static int get navigationIndex => gs['navigationIndex'];
  static set navigationIndex(int value) => gs['navigationIndex'] = value;

  //set page eventMethod value in global
  static String get eventMethod => gs['eventMethod'];
  static set eventMethod(String value) => gs['eventMethod'] = value;

  // static BuildContext get initContext => gs['initContext'];
  // static set initContext(BuildContext context) => gs['initContext'];
  //
  // static BuildContext get disposeContext => gs['disposeContext'];
  // static set disposeContext(BuildContext context) => gs['disposeContext'];

//set page PRI value in global
  static int get PRI => gs['PRI'];
  static set PRI(int valueOfPRI) => gs['PRI'] = valueOfPRI;

  static bool get pageDataLoaded =>
      gs['pageDataLoaded'] != null ? gs['pageDataLoaded'] : false;
  static set pageDataLoaded(bool valuePageLoad) =>
      gs['pageDataLoaded'] = valuePageLoad != null ? valuePageLoad : false;


  static bool get apiLoading =>
      gs['apiLoading'] != null ? gs['apiLoading'] : false;
  static set apiLoading(bool valueApiLoading) =>
      gs['apiLoading'] = valueApiLoading != null ? valueApiLoading : false;

//set settingPage items value in global
  static GSList get settingItems =>
      (gs['settingItems'] != null) ? gs['settingItems'] : [];
  static set settingItems(GSList valueOfSettingItems) =>
      gs['settingItems'] = valueOfSettingItems;

  //set recentPage items value in global
  static List<PageDirectionObject> get recentItems =>
      (gs['recentItems'] != null) ? gs['recentItems'] : [];
  static set recentItems(List<PageDirectionObject> valueOfRecentItems) =>
      gs['recentItems'] = valueOfRecentItems;

  //set organizationPage items value in global
  static List<PageDirectionObject> get organizationItems =>
      (gs['organizationItems'] != null) ? gs['organizationItems'] : [];
  static set organizationItems(
          List<PageDirectionObject> valueOfOrganizationItems) =>
      gs['organizationItems'] = valueOfOrganizationItems;

  //set otherPage items value in global
  static List<PageDirectionObject> get otherPageItems =>
      (gs['otherPageItems'] != null) ? gs['otherPageItems'] : [];
  static set otherPageItems(List<PageDirectionObject> valueOfOtherItems) =>
      gs['otherPageItems'] = valueOfOtherItems;

  static List get uploadingIndex => gs['uploadingIndex'];
  static set uploadingIndex(List value) => gs['uploadingIndex'] = value;
}

// class ImageDisplay extends StatelessWidget with GS {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GlobalState.PI == null
//           ? Center(
//               child: Text(
//                 'Loading...',
//                 textScaleFactor: 2,
//               ),
//             )
//           : Align(
//               alignment: Alignment(0, transition(2000, delayMillis: 800) - 1),
//               child: Text(GlobalState.PI.toString())),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.refresh),
//         onPressed: () async {
//           GlobalState.PI = null;
//           await fetchAndUpdateImage();
//           // Restarting context transitions after the new image has loaded
//           // causes the new image to also transition from top to center.
//           TransitionGroup(context: context).restart();
//         },
//       ),
//     );
//   }
// }

// class TransitionImagePage extends StatefulWidgetGS {
//   final int PI;
//   // final int backPRI;

//   const TransitionImagePage({Key key, this.PI}) : super(key: key);
//   @override
//   _TransitionImageState createState() => _TransitionImageState();
// }

// class _TransitionImageState extends State<TransitionImagePage> {
// // class TransitionImage extends StatefulGS {
//   // final Image image;
//   // const TransitionImage(this.image);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: Opacity(
//           opacity: transition(1500),
//           child: Text(widget.PI.toString() + "---------------------------")),
//       onTap: () async {
//         if (await fetchAndUpdateImage()) {
//           TransitionGroup(context: context).restart();
//         }
//       },
//     );
//   }
// }

// bool _fetching = false;

// Future<bool> fetchAndUpdateImage(
//     [String url = 'https://picsum.photos/300/200']) async {
//   if (_fetching) {
//     return false;
//   }
//   try {
//     _fetching = true; // locks the fetching function
//     final response = await http.get(url);
//     GlobalState.PI = 30;
//     return true;
//   } finally {
//     _fetching = false;
//   }
// }
