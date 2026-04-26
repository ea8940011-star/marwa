import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/feature/setting/widget/build_Icon_Container.dart';
import 'package:investra/feature/setting/widget/build_Security_Tile.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        title: const Text(
          ' Investra',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppImages.notificationSvg,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppImages.helpSvg,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/0d/4d/92/0d4d92723d87114f2e33e57456deb3e0.jpg',
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 Title Section
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Account",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Manage your private bank profile",
                        style: TextStyle(
                          color: AppColors.grayColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 28,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.bgColor,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withValues(alpha: 0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                'https://i.pinimg.com/736x/0d/4d/92/0d4d92723d87114f2e33e57456deb3e0.jpg',
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.bgColor,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: AppColors.bgColor,
                                size: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Esraa Alaa",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 4),

                        Text(
                          "ea8940011@gmail.com",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 20),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFB2FFB2),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Text(
                            "ELITE TIER MEMBER",
                            style: TextStyle(
                              color: Color(0xFF2E7D32),
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 35),

                /// 🔹 Security Section
                Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.securitySvg,
                      colorFilter: ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                      width: 26,
                      height: 26,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Security",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                buildSecurityTile(
                  icon: SvgPicture.asset(
                    AppImages.passwordSvg,
                    height: 18,
                    width: 18,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: "Password",
                  subtitle: "Last updated 14 days ago",
                ),
                const SizedBox(height: 12),
                buildSecurityTile(
                  icon: SvgPicture.asset(
                    AppImages.verifiedSvg,
                    height: 25,
                    width: 25,
                    colorFilter: ColorFilter.mode(
                      AppColors.green1Color,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: "Two-Factor Auth",
                  subtitle: "Enabled via Authenticator",
                  subtitleColor: AppColors.green1Color,
                ),
                const SizedBox(height: 35),

                Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.settingSvg,
                      colorFilter: ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                      height: 25,
                      width: 25,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Account Management",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: buildIconContainer(
                          icon: SvgPicture.asset(
                            AppImages.notification2Svg,
                            width: 24,
                            height: 24,
                            colorFilter: ColorFilter.mode(
                              AppColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        title: const Text(
                          "Notifications",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        trailing: Transform.scale(
                          scale: 0.8,
                          child: Switch(
                            value: true,
                            onChanged: (val) {},
                            materialTapTargetSize: MaterialTapTargetSize
                                .shrinkWrap, // لتقليل المساحة المحيطة
                            activeTrackColor: AppColors.darkgreen,
                            activeThumbColor: AppColors.bgColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(color: AppColors.bgGray, height: 1),
                      ),
                      ListTile(
                        leading: buildIconContainer(
                          icon: SvgPicture.asset(
                            AppImages.appearanceSvg,
                            colorFilter: ColorFilter.mode(
                              AppColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                            width: 22,
                          ),
                        ),
                        title: const Text(
                          "Appearance",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "System Default",
                              style: TextStyle(
                                color: AppColors.grayColor,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 4),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                /// 🔹 Logout Button
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "SIGN OUT",
                      style: TextStyle(
                        color: AppColors.errorColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
