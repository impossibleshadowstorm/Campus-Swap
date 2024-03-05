import 'dart:async';

import 'package:campus_swap/constants/image_strings.dart';
import 'package:campus_swap/constants/text_strings.dart';
import 'package:campus_swap/views/main_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  @override
  void initState() {
    // implement splash logic here
    super.initState();
    startAnimation();
    // Timer(
    //   const Duration(seconds: 2),
    //   () => Get.offAll(() => const MainHomeScreen()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SafeArea(
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                bottom: !animate ? 0 : 35.h,
                child: Container(
                  height: 50.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        swapImage,
                      ),
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                bottom: !animate ? 0 : 20.h,
                // left: !animate ? 0 : 5.w,
                child: Container(
                  width: 100.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          appName,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 19.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          appSlogan,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 5000));
    Get.offAll(() => const MainHomeScreen());
  }
}
