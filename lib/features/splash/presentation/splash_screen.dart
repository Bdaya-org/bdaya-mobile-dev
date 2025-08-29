import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool moveUp = false;
  bool moveRight = false;
  bool moveLeft = false;
  bool moveDown = false;

  String bdayaText = "";
  final String fullBdaya = "Bdaya";
  bool showAiTherapist = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          moveUp = true;
          moveRight = true;
          moveLeft = true;
          moveDown = true;
        });
      }
    });

    Future.delayed(const Duration(seconds: 1), () {
      int index = 0;
      Timer.periodic(const Duration(milliseconds: 270), (timer) {
        if (index < fullBdaya.length) {
          setState(() {
            bdayaText += fullBdaya[index];
          });
          index++;
        } else {
          timer.cancel();
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted) {
              setState(() {
                showAiTherapist = true;
              });
            }
          });
        }
      });
    });

    Future.delayed(const Duration(seconds: 6), () {
  if (mounted) {
    context.go('/home');
  }
});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 200),
                Text(
                  bdayaText,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    letterSpacing: 1.5,
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: showAiTherapist ? 1 : 0,
                  child: const Text(
                    "AI Therapist",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),

            AnimatedAlign(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              alignment: moveUp ? const Alignment(0, -0.08) : Alignment.center,
              child: Image.asset("assets/images/happy.png", width: 60),
            ),
            AnimatedAlign(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              alignment:
                  moveRight ? const Alignment(0.15, 0) : Alignment.center,
              child: Image.asset("assets/images/sad.png", width: 60),
            ),
            AnimatedAlign(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              alignment:
                  moveLeft ? const Alignment(-0.15, 0) : Alignment.center,
              child: Image.asset("assets/images/emotion.png", width: 60),
            ),
            AnimatedAlign(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              alignment: moveDown ? const Alignment(0, 0.08) : Alignment.center,
              child: Image.asset("assets/images/angry.png", width: 60),
            ),
          ],
        ),
      ),
    );
  }
}
