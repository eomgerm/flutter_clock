import 'package:flutter/material.dart';
import 'package:flutter_clock/painter/seconds_painter.dart';
import 'package:flutter_clock/widget/clock_text.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF4c53de),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: const Text(
            'Time zones',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: false,
          actions: [
            ElevatedButton(
              onPressed: (() {}),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: Colors.black.withAlpha(50),
                elevation: 0,
                splashFactory: NoSplash.splashFactory,
                shadowColor: Colors.transparent,
              ),
              child: const Icon(
                Icons.add,
                size: 40,
              ),
            ),
            ElevatedButton(
              onPressed: (() {}),
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.black.withAlpha(50),
                  elevation: 0,
                  splashFactory: NoSplash.splashFactory,
                  shadowColor: Colors.transparent),
              child: const Icon(
                Icons.settings,
                size: 40,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 260,
                    width: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(140),
                      border: Border.all(width: 15, color: Colors.white),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 20,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xFF6368f7)),
                  ),
                  SizedBox(
                    width: 190,
                    height: 190,
                    child: CustomPaint(
                      painter: SecondsPainter(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const ClockText(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: 'alarm',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.language),
              label: 'global',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer_outlined),
              label: 'timer',
            )
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          selectedItemColor: const Color(0xFF4c53de),
        ),
      ),
    );
  }
}
