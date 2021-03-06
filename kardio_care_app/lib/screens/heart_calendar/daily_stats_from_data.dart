import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kardio_care_app/screens/heart_calendar/daily_stats.dart';

class DailyStatsFromData extends StatelessWidget {
  const DailyStatsFromData(
      {Key key, this.combinedHRData})
      : super(key: key);

  // final List<RecordingData> todaysData;
  final Map<DateTime, double> combinedHRData;

  @override
  Widget build(BuildContext context) {
    double maxHR;
    double minHR;
    String maxHRTimeString;
    String minHRTimeString;

    // check if there is no data
    if ( combinedHRData.length == 0) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(19, 15, 19, 0),
        child: DailyStats(),
      );
    }

    // find the max and min HR and the time of day they happen
    maxHR = combinedHRData.values.first;
    minHR = combinedHRData.values.first;
    DateTime maxHRTime = combinedHRData.keys.first;
    DateTime minHRTime = combinedHRData.keys.first;

    combinedHRData.forEach((sampleTime, heartRate) {
      if (heartRate > maxHR) {
        maxHR = heartRate;
        maxHRTime = sampleTime;
      }
      if (heartRate < minHR) {
        minHR = heartRate;
        minHRTime = sampleTime;
      }
    });

    if (maxHRTime != null) {
      maxHRTimeString =
          TimeOfDay(hour: maxHRTime.hour, minute: maxHRTime.minute)
              .format(context);
    }

    if (minHRTime != null) {
      minHRTimeString =
          TimeOfDay(hour: minHRTime.hour, minute: minHRTime.minute)
              .format(context);
    }


    return Padding(
      padding: const EdgeInsets.fromLTRB(19, 15, 19, 15),
      child: DailyStats(
        avgHR: (combinedHRData.values.toList().reduce((a, b) => a + b) ~/
                combinedHRData.values.length)
            .toInt(),
        maxHR: maxHR.toInt(),
        minHR: minHR.toInt(),
        maxHRTime: maxHRTimeString,
        minHRTime: minHRTimeString,
      ),
    );
  }
}
