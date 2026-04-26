// import 'package:flutter/material.dart';
// import 'package:investra/core/constants/app_images.dart';
// import 'package:investra/core/styles/colors.dart';
// import 'package:investra/core/widgets/custom_svg_picture.dart';
// import 'package:investra/feature/setting/screen/entrepreneur_setting_screen.dart';
// import 'package:investra/feature/setting/screen/investor_setting_screen.dart';

// // تأكدي من استيراد كل الشاشات بشكل صحيح هنا
// // import 'package:investra/feature/home/home_screen.dart';
// // import 'package:investra/feature/ai_chat/ai_chatbot_screen.dart';
// // import 'package:investra/feature/account/account_screen.dart';

// // 1. هذا الجزء كان ناقصاً في الكود الخاص بكِ (كلاس الـ Widget)
// class MainAppScreen extends StatefulWidget {
//   const MainAppScreen({super.key, this.selectedIndex});
//   final int? selectedIndex;

//   @override
//   State<MainAppScreen> createState() => MainAppScreenState();
// }

// // 2. كلاس الـ State
// class MainAppScreenState extends State<MainAppScreen> {
//   int currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     // استخدام widget. للوصول لبيانات الكلاس الأساسي
//     currentIndex = widget.selectedIndex ?? 0;
//   }

//   // قائمة الشاشات
//   // ملاحظة: تأكدي أن الأسماء (HomeScreen, AccountScreen...) تطابق أسماء الكلاسات في ملفاتها
//   final List<Widget> screens = [
//     const Center(
//       child: Text("Home"),
//     ), // استبدليها بـ const HomeScreen() بعد الـ import
//     const Center(child: Text("Chat")), // استبدليها بـ const AIChatbotScreen()
//     const SettingsScreen(), // استبدليها بـ const SearchScreen()
//     const AccountScreen(), // الشاشة التي صممناها
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(index: currentIndex, children: screens),
//       bottomNavigationBar: _bottomNavBar(),
//     );
//   }

//   BottomNavigationBar _bottomNavBar() {
//     return BottomNavigationBar(
//       currentIndex: currentIndex,
//       onTap: (index) {
//         setState(() {
//           currentIndex = index;
//         });
//       },
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: AppColors.primaryColor,
//       unselectedItemColor: AppColors.grayColor,
//       showSelectedLabels: true,
//       showUnselectedLabels: true,
//       selectedFontSize: 12,
//       unselectedFontSize: 12,
//       items: [
//         BottomNavigationBarItem(
//           icon: CustomSvgPicture(path: AppImages.homeSvg),
//           activeIcon: CustomSvgPicture(
//             path: AppImages.homeSvg,
//             color: AppColors.primaryColor,
//           ),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: CustomSvgPicture(path: AppImages.aichatbotSvg),
//           activeIcon: CustomSvgPicture(
//             path: AppImages.aichatbotSvg,
//             color: AppColors.primaryColor,
//           ),
//           label: 'AI Chatbot',
//         ),
//         BottomNavigationBarItem(
//           icon: CustomSvgPicture(path: AppImages.searchSvg),
//           activeIcon: CustomSvgPicture(
//             path: AppImages.searchSvg,
//             color: AppColors.primaryColor,
//           ),
//           label: 'Search',
//         ),
//         BottomNavigationBarItem(
//           icon: CustomSvgPicture(path: AppImages.profileSvg),
//           activeIcon: CustomSvgPicture(
//             path: AppImages.profileSvg,
//             color: AppColors.primaryColor,
//           ),
//           label: 'Profile',
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/feature/setting/screen/entrepreneur_setting_screen.dart';
import 'package:investra/feature/setting/screen/investor_setting_screen.dart';

// تأكدي من فك التعليق (Uncomment) عن الاستيرادات أدناه عندما تجهز الملفات
// import 'package:investra/feature/home/home_screen.dart';
// import 'package:investra/feature/ai_chat/ai_chatbot_screen.dart';
// import 'package:investra/feature/account/account_screen.dart';
// import 'package:investra/feature/setting/screen/settings_screen.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key, this.selectedIndex});
  final int? selectedIndex;

  @override
  State<MainAppScreen> createState() => MainAppScreenState();
}

class MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // تعيين الشاشة الابتدائية بناءً على القيمة الممرة أو الافتراضية (0)
    currentIndex = widget.selectedIndex ?? 0;
  }

  // قائمة الشاشات التي يتم التنقل بينها
  final List<Widget> screens = [
    const Center(
      child: Text("Home"),
    ), // استبدليها بـ const HomeScreen() بعد الـ import
    const Center(child: Text("Chat")), // استبدليها بـ const AIChatbotScreen()
    const SettingsScreen(), // استبدليها بـ const SearchScreen()
    const AccountScreen(), // استبدلي بـ AccountScreen() التي صممناها
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔹 جعل خلفية الصفحة بيضاء بالكامل
      backgroundColor: AppColors.bgColor,
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      // 🔹 جعل خلفية شريط التنقل بيضاء لتندمج مع الصفحة
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.grayColor,
      // 🔹 إزالة الظل (الخط الفاصل) لجعل التصميم انسيابي وأبيض بالكامل
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      items: [
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.homeSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.homeSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.aichatbotSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.aichatbotSvg,
            color: AppColors.primaryColor,
          ),
          label: 'AI Chatbot',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.searchSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.searchSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.profileSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.profileSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
