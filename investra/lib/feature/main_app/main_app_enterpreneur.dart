import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/core/widgets/custom_svg_picture.dart';
import 'package:investra/feature/home_page/screens/enterepreneur_home.dart';
import 'package:investra/feature/setting/screen/entrepreneur_setting_screen.dart';
import 'package:investra/feature/setting/screen/investor_setting_screen.dart';

class MainAppEnterpreneurScreen extends StatefulWidget {
  const MainAppEnterpreneurScreen({super.key, this.selectedIndex});
  final int? selectedIndex;

  @override
  State<MainAppEnterpreneurScreen> createState() => MainAppScreenState();
}

class MainAppScreenState extends State<MainAppEnterpreneurScreen> {
  int currentIndex = 0;
  late ScrollController _scrollController;
  bool _isVisible = true;

  // 1. تعريف القائمة كـ late لتهيئتها لاحقاً
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex ?? 0;
    _scrollController = ScrollController();

    // 2. تهيئة القائمة هنا بعد إنشاء الـ _scrollController
    screens = [
      EntrepreneurHomePage(scrollController: _scrollController),
      const Center(child: Text("Chat")),
      const SettingsScreen(),
      const AccountScreen(),
    ];

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible) setState(() => _isVisible = false);
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible) setState(() => _isVisible = true);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      // 3. إصلاح الـ AppBar (استخدام leading بدلاً من icon)
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            AppImages.rocketSvg,
          ), // الأيقونة في مكانها الصحيح
        ),
        title: const Text(
          'Investra',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
          icon: CustomSvgPicture(path: AppImages.aichatbotSvg),
          activeIcon: CustomSvgPicture(
            path: AppImages.aichatbotSvg,
            color: AppColors.primaryColor,
          ),
          label: 'AI Chatbot',
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
