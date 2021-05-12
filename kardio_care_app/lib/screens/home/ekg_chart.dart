import 'package:flutter/material.dart';
import 'package:kardio_care_app/constants/app_constants.dart';
import 'package:fl_chart/fl_chart.dart';

class EKGChart extends StatefulWidget {
  const EKGChart({
    Key key,
    this.dataValue,
    this.minValue,
    this.maxValue,
  }) : super(key: key);

  final double dataValue;

  final double minValue;
  final double maxValue;

  @override
  _ChartState createState() => _ChartState();
}

const int num_samples_plotted = 40;

class _ChartState extends State<EKGChart> {
  final Duration animDuration = const Duration(milliseconds: 0);

  // list of spots that is updated and shifted for plotting
  List<FlSpot> plottingValues = [
    for (double i = 0; i < num_samples_plotted; i += 1) FlSpot(i, 0.0)
  ];

  List<FlSpot> myList = [
    for (double i = 0; i < num_samples_plotted; i += 1) FlSpot(i, 0.0)
  ];
  int myListIndex = 0;

  // some of the layout needs work to be more adaptive to screen size
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: kBackgroundColor,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    'Lead I Data',
                    style: TextStyle(
                        color: const Color(0xff0f4a3c),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: plotData(widget.dataValue),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChart plotData(double dataValue) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          handleBuiltInTouches: false,
        ),
        borderData: FlBorderData(
          show: false,
        ),
        gridData: FlGridData(
          drawVerticalLine: true,
          show: false,
        ),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: false,
            interval: 1,
            reservedSize: 100,
            // : const TextStyle(
            //   color: Color(0xff72719b),
            //   fontWeight: FontWeight.bold,
            //   fontSize: 16,
            // ),
            margin: 10,
            // getTitles: (value) {
            //   return getTitles(value);
            // },
          ),
          leftTitles: SideTitles(showTitles: true, interval: 100),
        ),
        minX: 0,
        maxX: plottingValues.length.toDouble(),
        maxY: widget.maxValue,
        minY: widget.minValue,
        lineBarsData: linesBarDataMain(dataValue),
      ),
      swapAnimationDuration: animDuration,
    );
  }

  List<LineChartBarData> linesBarDataMain(double dataValue) {
    LineChartBarData updatedLineData = LineChartBarData(
      spots: updatePlottingValues(dataValue),
      isCurved: false,
      colors: [kEKGLineColor, kEKGLineColor],
      curveSmoothness: 0,
      barWidth: 1,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );

    return [
      updatedLineData,
    ];
  }

  // function to shift a list by the argument amount
  List<Object> leftShift(List<Object> list, int shiftAmount) {
    if (list == null || list.isEmpty) return list;
    var i = shiftAmount % list.length;
    return list.sublist(i)..addAll(list.sublist(0, i));
  }

  // update the plotting values with the argument dataValue
  List<FlSpot> updatePlottingValues(double dataValue) {
    // shift the plotting values left by one
    plottingValues = leftShift(plottingValues, 1);

    // adjust the x values to match for shift
    for (var i = 0; i < plottingValues.length; i++) {
      plottingValues[i] =
          plottingValues[i].copyWith(x: plottingValues[i].x - 1);
    }

    // update the last plot point with the data from the bluetooth
    plottingValues.last = FlSpot(plottingValues.length.toDouble(), dataValue);

    return plottingValues;
  }
}
