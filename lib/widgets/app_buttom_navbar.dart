import 'package:flutter/material.dart';

class AppBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          16,
          0,
          16,
          12,
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),

          child: NavigationBar(

            selectedIndex: currentIndex,

            onDestinationSelected: onTap,

            height: 70,

            elevation: 8,

            backgroundColor: Colors.white,

            shadowColor: Colors.black12,

            indicatorColor:
                const Color(0xffDDF4E3),

            labelBehavior:
                NavigationDestinationLabelBehavior
                    .alwaysShow,

            destinations: const [

              NavigationDestination(

                icon: Icon(
                  Icons.home_outlined,
                  size: 22,
                ),

                selectedIcon: Icon(
                  Icons.home_rounded,
                  size: 24,
                  color: Color(0xff2E8B57),
                ),

                label: "Home",

              ),

              NavigationDestination(

                icon: Icon(
                  Icons.chat_bubble_outline,
                  size: 22,
                ),

                selectedIcon: Icon(
                  Icons.chat,
                  size: 24,
                  color: Color(0xff2E8B57),
                ),

                label: "Konsultasi",

              ),

              NavigationDestination(

                icon: Icon(
                  Icons.info_outline,
                  size: 22,
                ),

                selectedIcon: Icon(
                  Icons.info,
                  size: 24,
                  color: Color(0xff2E8B57),
                ),

                label: "About",

              ),

            ],

          ),
        ),
      ),
    );
  }
}