// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../../../main.dart';
// import '../../../../core/utils/global_utils.dart';
// import '../../dashboard/view/dashboard_screen.dart';
//
// class IntroScreenDefault extends StatefulWidget {
//   static const id = '/intro_screen';
//   const IntroScreenDefault({super.key});
//
//   @override
//   State<IntroScreenDefault> createState() => _IntroScreenDefaultState();
// }
//
//
// class _IntroScreenDefaultState extends State<IntroScreenDefault> {
//   List<ContentConfig> listContentConfig = [];
//
//   @override
//   void initState() {
//     super.initState();
//
//     listContentConfig.add(
//        ContentConfig(
//         title: "Customize Qura'n",
//          styleTitle: GoogleFonts.openSans(
//              color: injector<AppCustomColor>().mainContentColor,
//              fontSize: 30,
//              fontWeight:FontWeight.bold
//          ),
//          styleDescription: GoogleFonts.pacifico(
//            color: injector<AppCustomColor>().mainContentColor,
//            fontSize: 21,
//          ),
//         description:
//         "User can able to favorite its Ayah, can copy and share, customize the fonts and able to add the notes for specific ayah",
//         centerWidget: SvgPicture.asset('assets/icons/qur.svg',
//           fit: BoxFit.cover,
//           width: 300.w,
//           height: 300.h,
//         ),
//          backgroundColor: injector<AppCustomColor>().mainAppColor,      ),
//     );
//     listContentConfig.add(
//        ContentConfig(
//         title: "Alarm Scheduling",
//          styleTitle: GoogleFonts.openSans(
//              color: injector<AppCustomColor>().mainContentColor,
//              fontSize: 30,
//              fontWeight:FontWeight.bold
//          ),
//          styleDescription: GoogleFonts.pacifico(
//            color: injector<AppCustomColor>().mainContentColor,
//            fontSize: 21,
//          ),
//         description:
//         "Allow Ayah ALarm, the main purpose is to reminding user to read the Qur'an ",
//          centerWidget: SvgPicture.asset('assets/icons/alarma.svg',
//            fit: BoxFit.cover,
//            width: 300.w,
//            height: 300.h,
//          ),
//         backgroundColor: injector<AppCustomColor>().mainAppColor,
//       ),
//     );
//     listContentConfig.add(
//        ContentConfig(
//         title: "Nearby Mosques",
//          styleTitle: GoogleFonts.openSans(
//            color: injector<AppCustomColor>().mainContentColor,
//            fontSize: 30,
//            fontWeight:FontWeight.bold
//          ),
//          styleDescription: GoogleFonts.pacifico(
//            color: injector<AppCustomColor>().mainContentColor,
//            fontSize: 21,
//          ),
//         description:
//         "Allow user to find the nearby mosques with their ratings and even user can navigate to that mosques",
//          centerWidget: SvgPicture.asset('assets/icons/mosque.svg',
//            fit: BoxFit.cover,
//            width: 300.w,
//            height: 300.h,
//          ),
//          backgroundColor: injector<AppCustomColor>().mainAppColor,      ),
//     );
//   }
//
//   Future<void> onDonePress() async {
//     await prefs.setBool('repeat', true);
//     navigatorKey.currentState?.pushReplacementNamed(DashboardScreen.id);
//     log("End of slides");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return IntroSlider(
//       key: UniqueKey(),
//       listContentConfig: listContentConfig,
//       onDonePress: onDonePress,
//     );
//   }
// }