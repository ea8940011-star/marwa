// import 'package:flutter/material.dart';
// import 'package:investra/core/constants/app_images.dart';
// import 'package:investra/core/styles/colors.dart';
// import 'package:investra/core/widgets/custom_svg_picture.dart';
// import 'package:investra/feature/home_page/screens/enterepreneur_home.dart';
// import 'package:investra/feature/home_page/screens/investor_home.dart';
// import 'package:investra/feature/setting/screen/entrepreneur_setting_screen.dart';
// import 'package:investra/feature/setting/screen/investor_setting_screen.dart';

// class MainAppInvestorScreen extends StatefulWidget {
//   const MainAppInvestorScreen({super.key, this.selectedIndex});
//   final int? selectedIndex;

//   @override
//   State<MainAppInvestorScreen> createState() => MainAppScreenState();
// }

// class MainAppScreenState extends State<MainAppInvestorScreen> {
//   int currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     currentIndex = widget.selectedIndex ?? 0;
//   }

//   final List<Widget> screens = [
//     const InvestorHomePage(),
//     const Center(child: Text("Chat")),
//     const SettingsScreen(),
//     const AccountScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bgColor,
//       body: IndexedStack(index: currentIndex, children: screens),
//       bottomNavigationBar: _bottomNavBar(),
//     );
//   }

//   BottomNavigationBar _bottomNavBar() {
//     return BottomNavigationBar(
//       backgroundColor: Colors.white,
//       currentIndex: currentIndex,
//       onTap: (index) {
//         setState(() {
//           currentIndex = index;
//         });
//       },
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: AppColors.primaryColor,
//       unselectedItemColor: AppColors.grayColor,
//       elevation: 0,
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
import 'package:flutter/rendering.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/feature/home_page/screens/investor_home.dart';
import 'package:investra/feature/setting/screen/entrepreneur_setting_screen.dart';
import 'package:investra/feature/setting/screen/investor_setting_screen.dart';

class MainAppInvestorScreen extends StatefulWidget {
  const MainAppInvestorScreen({super.key, this.selectedIndex});
  final int? selectedIndex;

  @override
  State<MainAppInvestorScreen> createState() => MainAppScreenState();
}

class MainAppScreenState extends State<MainAppInvestorScreen> {
  int currentIndex = 0;
  late ScrollController _scrollController;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex ?? 0;
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible) {
          setState(() {
            _isVisible = false;
          });
        }
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  late final List<Widget> screens = [
    InvestorHomePage(scrollController: _scrollController),
    const Center(child: Text("Chat")),
    const SettingsScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _isVisible
            ? kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom
            : 0,
        child: Wrap(children: [_bottomNavBar()]),
      ),
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
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
          icon: CustomSvgPicture(path: AppImages.chatSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.chatSvg,
            color: AppColors.primaryColor,
          ),
          label: 'Chat',
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
