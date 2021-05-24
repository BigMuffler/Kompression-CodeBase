import 'package:flutter/material.dart';
import 'package:kardio_care_app/app_theme.dart';
import 'package:kardio_care_app/screens/heart_calendar/daily_stats.dart';
import 'package:kardio_care_app/screens/heart_calendar/recording_card.dart';
import 'package:kardio_care_app/widgets/block_radio_button.dart';
import 'package:kardio_care_app/screens/heart_calendar/heart_rate_chart.dart';
import 'package:kardio_care_app/screens/heart_calendar/hrv_chart.dart';

class DailyTrendCharts extends StatefulWidget {
  DailyTrendCharts({Key key}) : super(key: key);

  @override
  _DailyTrendChartsState createState() => _DailyTrendChartsState();
}

class _DailyTrendChartsState extends State<DailyTrendCharts> {
  int radioButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Column(
          children: [
            radioButtonIndex == 0
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Text(
                            'Heart Rate Variability Today',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 12, 30, 5),
                          child: Text('0 - 100 score'),
                        ), // ? will this be 0 - 100 ?
                        HRVChart(),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Text(
                            'Heart Rate Today',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 12, 30, 5),
                          child: Text('Beats per minute'),
                        ),
                        HeartRateChart(),
                      ],
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: BlockRadioButton(
                buttonLabels: ['HRV', 'HR'],
                circleBorder: false,
                backgroundColor: Colors.white,
                callback: callback,
              ),
            )
          ],
        ),
      ),
    );
  }

  callback(int newIndex) {
    setState(() {
      radioButtonIndex = newIndex;
    });
  }
}