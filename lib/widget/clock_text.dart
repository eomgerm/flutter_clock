import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockText extends StatefulWidget {
  const ClockText({super.key});

  @override
  State<ClockText> createState() => _ClockTextState();
}

class _ClockTextState extends State<ClockText> {
  late String timeText;
  late String dateText;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    formatDateTime(now);
    Timer.periodic(const Duration(seconds: 1), getTime);
  }

  void formatDateTime(DateTime now) {
    timeText = DateFormat('hh:mm a').format(now);
    dateText = DateFormat('MMMM d, y').format(now);
  }

  void getTime(Timer t) {
    final now = DateTime.now();
    formatDateTime(now);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          timeText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          dateText,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
