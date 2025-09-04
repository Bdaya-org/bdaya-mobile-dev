import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showLogo = false;
  bool showAiTherapist = false;
  bool showProgress = false;
  bool showBdaya = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) setState(() => showLogo = true);
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) setState(() => showBdaya = true);
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) setState(() => showAiTherapist = true);
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => showProgress = true);
    });

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 100),

            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: showLogo ? 1 : 0,
              child: AnimatedScale(
                duration: const Duration(seconds: 1),
                scale: showLogo ? 1 : 0.5,
                curve: Curves.easeOutBack,
                child: Image.asset("assets/images/bdayaLogo.png", width: 100),
              ),
            ),

            AnimatedSlide(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
              offset: showBdaya ? Offset.zero : const Offset(0, 0.5),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: showBdaya ? 1 : 0,
                child: const Text(
                  "Bdaya",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff544e86),
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),

            AnimatedSlide(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
              offset: showAiTherapist ? Offset.zero : const Offset(0, 0.5),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: showAiTherapist ? 1 : 0,
                child: const Text(
                  "AI Therapist",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 20,
                    color: Color(0xff544e86),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            if (showProgress) ...[
              SizedBox(
                width: 150,
                child: LinearProgressIndicator(
                  color: Colors.deepPurple,
                  backgroundColor: Colors.deepPurple.shade100,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ],
        ),
      ),
    );
  }
}
