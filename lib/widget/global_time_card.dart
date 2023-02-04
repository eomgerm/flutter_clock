import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clock/model/world_time_model.dart';
import 'package:flutter_clock/services/api_service.dart';
import 'package:intl/intl.dart';

class CityTimeCard extends StatefulWidget {
  const CityTimeCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CityTimeCard> createState() => _CityTimeCardState();
}

class _CityTimeCardState extends State<CityTimeCard> {
  late WorldTimeModel timeInfo = WorldTimeModel();
  DateTime now = DateTime.now().toUtc();
  String timeText = '';
  String dateText = '';

  void formatDateTime(DateTime now) {
    timeText = DateFormat('HH:mm').format(now);
    dateText = DateFormat('EEE, MM/dd').format(now);
  }

  @override
  void initState() {
    super.initState();
    ApiService.getTimeInfo('America/New_York').then((value) {
      timeInfo = value;
      setState(() {});
    });

    Timer.periodic(const Duration(seconds: 1), getTime);
  }

  void getTime(Timer t) {
    now = DateTime.now().toUtc();
    now = timeInfo.add
        ? now.add(timeInfo.offsetFromUtc)
        : now.subtract(timeInfo.offsetFromUtc);
    formatDateTime(now);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'New York',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  dateText,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            Text(
              timeText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
