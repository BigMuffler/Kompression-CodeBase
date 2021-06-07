import 'package:flutter/material.dart';
import 'package:kardio_care_app/app_theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class RhythmEventChart extends StatefulWidget {
  const RhythmEventChart({Key key, this.dataValue}) : super(key: key);

  final int dataValue;

  @override
  _RhythmEventChartState createState() => _RhythmEventChartState();
}

List<ChartData> chartData;

class _RhythmEventChartState extends State<RhythmEventChart> {
  @override
  Widget build(BuildContext context) {
    chartData = getData();
    // final List<SalesData> chartData = [
    //   SalesData(DateTime(2015, 1, 1, 7), 35),
    //   SalesData(DateTime(2015, 1, 1, 8), 28),
    //   SalesData(DateTime(2015, 1, 1, 10), 34),
    //   SalesData(DateTime(2015, 1, 1, 12), 32),
    //   SalesData(DateTime(2015, 1, 1, 14), 40),
    //   SalesData(DateTime(2015, 1, 1, 19), 40),
    //   SalesData(DateTime(2015, 1, 1, 20), 20),
    //   SalesData(DateTime(2015, 1, 1, 23), 22),
    // ];

    return SfCartesianChart(
      primaryXAxis: NumericAxis(
          // intervalType: NumericAxis',
          visibleMinimum: chartData[0].x.toDouble(),
          visibleMaximum: 250),
      zoomPanBehavior: ZoomPanBehavior(
        enablePanning: true,
      ),
      // series: <CartesianSeries<ChartData, DateTime>>[
      //   ColumnSeries(
      //     dataSource: chartData,
      //     xValueMapper: (ChartData tendencias, _) => tendencias.x,
      //     yValueMapper: (ChartData tendencias, _) => tendencias.y,
      //   )
      // ],
      series: <ChartSeries>[
        // Renders line chart
        LineSeries<ChartData, int>(
            // markerSettings: MarkerSettings(
            //     shape: DataMarkerType.circle,
            //     color: KardioCareAppTheme.detailRed,
            //     borderColor: Colors.white,
            //     isVisible: true),
            color: KardioCareAppTheme.detailRed,
            dataSource: chartData,
            xValueMapper: (ChartData tendencias, _) => tendencias.x,
            yValueMapper: (ChartData tendencias, _) => tendencias.y)
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final int y;
}

// class SalesData {
//   SalesData(this.year, this.sales);
//   final DateTime year;
//   final double sales;
// }

dynamic getData() {
  List<ChartData> data = [];
  for (int i = 0; i < goodDataList.length; i++) {
    data.add(ChartData(i, goodDataList[i]));
  }
  return data;
}

num getRandomInt(num min, num max) {
  final Random random = Random();
  return min + random.nextInt(max - min);
}

List<int> goodDataList = [
  952,
  901,
  660,
  1020,
  959,
  486,
  1023,
  956,
  585,
  1023,
  880,
  579,
  1023,
  894,
  339,
  845,
  499,
  757,
  781,
  316,
  552,
  517,
  310,
  510,
  27,
  561,
  420,
  298,
  605,
  112,
  460,
  538,
  198,
  471,
  489,
  530,
  568,
  59,
  609,
  501,
  440,
  665,
  196,
  508,
  614,
  224,
  619,
  530,
  637,
  560,
  136,
  631,
  574,
  120,
  736,
  530,
  624,
  690,
  220,
  495,
  637,
  350,
  592,
  386,
  601,
  552,
  161,
  649,
  534,
  244,
  643,
  432,
  589,
  747,
  297,
  641,
  631,
  287,
  692,
  301,
  649,
  625,
  273,
  712,
  678,
  236,
  759,
  309,
  715,
  758,
  428,
  623,
  695,
  338,
  625,
  218,
  817,
  622,
  253,
  705,
  680,
  529,
  766,
  271,
  732,
  793,
  354,
  683,
  721,
  474,
  612,
  201,
  705,
  645,
  264,
  731,
  583,
  497,
  702,
  233,
  682,
  727,
  297,
  617,
  636,
  653,
  625,
  165,
  729,
  633,
  373,
  676,
  588,
  662,
  844,
  337,
  844,
  1023,
  1023,
  748,
  1023,
  709,
  87,
  431,
  0,
  171,
  0,
  358,
  155,
  438,
  508,
  735,
  682,
  257,
  763,
  675,
  239,
  827,
  611,
  819,
  909,
  487,
  758,
  844,
  431,
  670,
  513,
  762,
  783,
  317,
  882,
  753,
  489,
  904,
  553,
  860,
  928,
  532,
  897,
  911,
  692,
  965,
  580,
  974,
  927,
  593,
  1023,
  978,
  409,
  1007,
  971,
  446,
  987,
  838,
  485,
  847,
  267,
  730,
  716,
  234,
  541,
  565,
  470,
  503,
  67,
  498,
  469,
  243,
  537,
  94,
  494,
  462,
  594,
  534,
  24,
  589,
  550,
  447,
  642,
  174,
  526,
  601,
  226,
  496,
  492,
  584,
  635,
  122,
  687,
  536,
  328,
  733,
  544,
  519,
  675,
  180,
  542,
  652,
  356,
  590,
  492,
  576,
  580,
  161,
  612,
  558,
  176,
  613,
  475,
  602,
  663,
  230,
  679,
  731,
  493,
  543,
  416,
  666,
  603,
  87,
  683,
  390,
  590,
  701,
  284,
  597,
  704,
  378,
  579,
  384,
  709,
  696,
  158,
  741,
  673,
  455,
  796,
  322,
  707,
  728,
  351,
  623,
  651,
  477,
  592,
  209,
  685,
  602,
  267,
  723,
  632,
  347,
  641,
  247,
  615,
  651,
  278,
  638,
  680,
  632,
  623,
  113,
  618,
  673,
  279,
  733,
  698,
  708,
  902,
  508,
  1023,
  1023,
  1023,
  390,
  734,
  507,
  0,
  144,
  282,
  332,
  63,
  556,
  542,
  600,
  730,
  246,
  685,
  845,
  405,
  579,
  694,
  755,
  757,
  259,
  747,
  648,
  313,
  757,
  610,
  741,
  817,
  432,
  788,
  800,
  304,
  769,
  623,
  846,
  807,
  407,
  895,
  871,
  500,
  931,
  677,
  922,
  973,
  493,
  1023,
  1023,
  925,
  702,
  1009,
  890,
  497,
  913,
  526,
  702,
  717,
  490,
  605,
  227,
  646,
  568,
  41,
  544,
  128,
  550,
  599,
  229,
  544,
  577,
  392,
  527,
  8,
  555,
  141,
  641,
  623,
  230,
  508,
  600,
  506,
  586,
  126,
  629,
  553,
  82,
  638,
  70,
  517,
  577,
  629,
  540,
  71,
  701,
  547,
  510,
  700,
  18,
  633,
  553,
  611,
  519,
  96,
  734,
  572,
  570,
  699,
  221,
  657,
  678,
  331,
  610,
  545,
  652,
  585,
  89,
  652,
  540,
  582,
  741,
  281,
  599,
  714,
  400,
  560,
  533,
  681,
  621,
  261,
  730,
  605,
  320,
  765,
  558,
  710,
  780,
  356,
  694,
  681,
  343,
  664,
  362,
  641,
  600,
  267,
  707,
  675,
  207,
  755,
  304,
  617,
  681,
  231,
  647,
  657,
  437,
  655,
  219,
  728,
  618,
  175,
  672,
  657,
  428,
  903,
  707,
  1023,
  1023,
  965,
  443,
  707,
  110,
  228,
  200,
  0,
  270,
  2,
  527,
  312,
  595,
  730,
  615,
  744,
  277,
  723,
  715,
  333,
  744,
  677,
  661,
  738,
  317,
  754,
  827,
  440,
  721,
  723,
  732,
  765,
  269,
  848,
  804,
  590,
  998,
  875,
  903,
  958,
  561,
  1023,
  1023,
  930,
  739,
  1023,
  946,
  692,
  1023,
  964,
  681,
  1023,
  958,
  617,
  955,
  422,
  757,
  728,
  363,
  614,
  381,
  555,
  464,
  142,
  527,
  439,
  66,
  572,
  8,
  432,
  29,
  554,
  340,
  509,
  593,
  167,
  489,
  616,
  333,
  557,
  105,
  579,
  542,
  155,
  613,
  528,
  263,
  641,
  203,
  542,
  626,
  149,
  532,
  556,
  424,
  479,
  93,
  649,
  595,
  439,
  706,
  204,
  588,
  634,
  281,
  546,
  624,
  606,
  688,
  154,
  623,
  578,
  254,
  698,
  574,
  536,
  701,
  272,
  607,
  701,
  346,
  521,
  547,
  576,
  605,
  184,
  698,
  629,
  282,
  765,
  608,
  710,
  835,
  248,
  704,
  712,
  359,
  742,
  619,
  760,
  735,
  377,
  764,
  619,
  373,
  617,
  505,
  629,
  694,
  272,
  633,
  604,
  350,
  617,
  401,
  595,
  604,
  77,
  715,
  393,
  648,
  710,
  180,
  557,
  651,
  406,
  696,
  286,
  720,
  724,
  426,
  1023,
  1023,
  1023,
  728,
  634,
  398,
  339,
  156,
  0,
  250,
  23,
  444,
  103,
  681,
  659,
  186,
  767,
  660,
  437,
  728,
  259,
  814,
  760,
  383,
  726,
  728,
  626,
  683,
  354,
  805,
  753,
  394,
  847,
  701,
  642,
  830,
  356,
  836,
  823,
  616,
  837,
  756,
  908,
  938,
  530,
  998,
  911,
  438,
  994,
  929,
  988,
  968,
  656,
  934,
  915,
  806,
  816,
  753,
  744,
  753,
  230,
  669,
  554,
  254,
  671,
  425,
  597,
  636,
  0,
  509,
  50,
  617,
  411,
  563,
  555,
  80,
  518,
  338,
  585,
  562,
  94,
  602,
  390,
  534,
  630,
  178,
  548,
  669,
  222,
  615,
  258,
  666,
  608,
  109,
  684,
  540,
  229,
  692,
  221,
  634,
  702,
  179,
  664,
  646,
  399,
  589,
  240,
  674,
  648,
  272,
  699,
  601,
  339,
  729,
  131,
  605,
  662,
  320,
  592,
  602,
  706,
  570,
  112,
  665,
  649,
  217,
  725,
  691,
  480,
  742,
  252,
  755,
  682,
  398,
  586,
  605,
  630,
  585,
  196,
  679,
  589,
  144,
  703,
  593,
  583,
  691,
  161,
  696,
  720,
  489,
  679,
  534,
  613,
  633,
  183,
  726,
  621,
  269,
  756,
  506,
  669,
  726,
  274,
  700,
  920,
  889,
  1023,
  1023,
  918,
  771,
  628,
  48,
  153,
  0,
  302,
  26,
  383,
  183,
  600,
  570,
  206,
  729,
  698,
  361,
  812,
  325,
  687,
  755,
  380,
  713,
  716,
  442,
  728,
  246,
  726,
  710,
  341,
  772,
  674,
  521,
  838,
  272,
  938,
  870,
  432,
  800,
  802,
  749,
  896,
  318,
  934,
  943,
  459,
  993,
  924,
  742,
  970,
  570,
  970,
  937,
  496,
  762,
  680,
  716,
  673,
  187,
  709,
  559,
  200,
  583,
  486,
  410,
  571,
  121,
  467,
  515,
  195,
  499,
  486,
  539,
  554,
  125,
  584,
  516,
  164,
  647,
  476,
  652,
  713,
  186,
  489,
  596,
  300,
  537,
  480,
  686,
  599,
  112,
  680,
  579,
  175,
  663,
  453,
  593,
  673,
  186,
  567,
  700,
  402,
  582,
  361,
  686,
  634,
  160,
  659,
  665,
  282,
  697,
  311,
  656,
  686,
  337,
  693,
  712,
  362,
  599,
  205,
  728,
  592,
  276,
  740,
  697,
  425,
  759,
  279,
  634,
  768,
  352,
  569,
  644,
  525,
  628,
  229,
  694,
  586,
  208,
  734,
  648,
  382,
  655,
  252,
  576,
  633,
  379,
  528,
  594,
  617,
  617,
  217,
  721,
  587,
  283,
  701,
  639,
  655,
  861,
  385,
  921,
  1023,
  1023,
  477,
  909,
  244,
  398,
  341,
  0,
  114,
  31,
  482,
  21,
  554,
  619,
  719,
  722,
  333,
  872,
  753,
  341,
  774,
  594,
  704,
  862,
  435,
  756,
  789,
  423,
  778,
  563,
  828,
  717,
  315,
  819,
  749,
  365,
  928,
  607,
  776,
  898,
  508,
  885,
  925,
  735,
  887,
  573,
  960,
  929,
  621,
  1023,
  980,
  582,
  1006,
  932,
  486,
  908,
  749,
  414,
  830,
  285,
  694,
  690,
  271,
  526,
  526,
  370,
  486,
  0,
  554,
  107,
  444,
  498,
  149,
  575,
  517,
  397,
  518,
  135,
  600,
  538,
  180,
  659,
  605,
  244,
  718,
  153,
  517,
  669,
  319,
  491,
  551,
  582,
  616,
  118,
  612,
  545,
  161,
  706,
  593,
  556,
  662,
  186,
  635,
  665,
  308,
  538,
  489,
  723,
  615,
  77,
  758,
  482,
  555,
  710,
  232,
  636,
  643,
  310,
  570,
  371,
  675,
  559,
  86,
  697,
  455,
  620,
  700,
  125,
  617,
  686,
  302,
  637,
  466,
  752,
  633,
  231,
  709,
  652,
  369,
  845,
  391,
  666,
  703,
  311,
  635,
  666,
  636,
  606,
  209,
  705,
  666,
  171,
  784,
  634,
  354,
  701,
  314,
  630,
  681,
  340,
  615,
  591,
  394,
  615,
  178,
  693,
  657,
  322,
  817,
  825,
  931,
  1023,
  1023,
  389,
  737,
  470,
  87,
  262,
  0,
  181,
  0,
  452,
  113,
  533,
  629,
  781,
  773,
  248,
  827,
  705,
  314,
  834,
  686,
  801,
  896,
  342,
  742,
  778,
  390,
  799,
  657,
  816,
  736,
  231,
  812,
  737,
  424,
  864,
  708,
  846,
  960,
  515,
  858,
  971,
  655,
  984,
  779,
  1023,
  1021,
  1023,
  804,
  1006,
  1023,
  962,
  718,
  949,
  458,
  774,
  770,
  398,
  715,
  278,
  564,
  487,
  131,
  506,
  466,
  43,
  486,
  107,
  502,
  442,
  366,
  529,
  0,
  571,
  143,
  575,
  629,
  154,
  566,
  559,
  413,
  470,
  43,
  680,
  477,
  418,
  630,
  159,
  534,
  716,
  289,
  564,
  550,
  434,
  546,
  165,
  669,
  578,
  243,
  622,
  576,
  585,
  728,
  205,
  655,
  674,
  307,
  605,
  643,
  585,
  608,
  165,
  615,
  575,
  240,
  688,
  553,
  588,
  725,
  200,
  651,
  733,
  448,
  644,
  493,
  683,
  662,
  167,
  698,
  653,
  337,
  771,
  526,
  602,
  683,
  271,
  728,
  697,
  521,
  723,
  454,
  726,
  694,
  205,
  826,
  702,
  374,
  747,
  366,
  644,
  691,
  267,
  593,
  729,
  424,
  600,
  189,
  655,
  582,
  150,
  602,
  593,
  338,
  712,
  235,
  606,
  662,
  245,
  633,
  605,
  479,
  629,
  234,
  748,
  694,
  413,
  1010,
  1023,
  1023,
  819,
  963,
  432,
  479,
  217,
  0,
  158,
  40,
  275,
  0,
  583,
  161,
  732,
  753,
  417,
  699,
  695,
  774,
  752,
  319,
  790,
  730,
  345,
  782,
  660,
  691,
  782,
  424,
  864,
  858,
  580,
  802,
  689,
  873,
  772,
  440,
  881,
  810,
  365,
  927,
  788,
  923,
  937,
  574,
  969,
  956,
  638,
  1000,
  1023,
  794,
  903,
  1023,
  800,
  1023,
  899,
  282,
  773,
  737,
  231,
  726,
  294,
  620,
  482,
  0,
  541,
  9,
  462,
  59,
  527,
  105,
  465,
  641,
  133,
  468,
  541,
  268,
  431,
  109,
  606,
  497,
  131,
  640,
  531,
  395,
  609,
  269,
  646,
  651,
  153,
  414,
  624,
  522,
  502,
  72,
  600,
  586,
  324,
  636,
  184,
  586,
  565,
  296,
  552,
  523,
  551,
  563,
  42,
  648,
  551,
  516,
  704,
  230,
  656,
  733,
  313,
  565,
  605,
  586,
  630,
  156,
  627,
  623,
  321,
  690,
  555,
  573,
  761,
  152,
  574,
  729,
  269,
  656,
  573,
  645,
  652,
  73,
  772,
  574,
  725,
  760,
  361,
  758,
  837,
  408,
  536,
  514,
  710,
  683,
  204,
  726,
  656,
  244,
  677,
  438,
  614,
  643,
  178,
  659,
  665,
  310,
  611,
  460,
  687,
  587,
  172,
  746,
  621,
  317,
  709,
  348,
  630,
  801,
  401,
  942,
  1023,
  859,
  1023,
  1023,
  661,
  304,
  291,
  0,
  107,
  7,
  325,
  98,
  452,
  105,
  705,
  717,
  214,
  830,
  732,
  564,
  891,
  274,
  732,
  769,
  439,
  738,
  779,
  596,
  795,
  227,
  805,
  728,
  272,
  858,
  755,
  653,
  905,
  507,
  825,
  923,
  639,
  833,
  861,
  999,
  983,
  541,
  986,
  996,
  605,
  997,
  927,
  1022,
  1023,
  932,
  449,
  1023,
  955,
  413,
  920,
  670,
  705,
  746,
  188,
  526,
  567,
  245,
  458,
  428,
  584,
  493,
  48,
  549,
  421,
  485,
  561,
  66,
  519,
  404,
  487,
  513,
  123,
  615,
  541,
  234,
  564,
  404,
  590,
  634,
  136,
  564,
  604,
  425,
  437,
  367,
  680,
  577,
  161,
  621,
  556,
  341,
  656,
  351,
  640,
  672,
  214,
  603,
  594,
  299,
  687,
  282,
  669,
  611,
  233,
  668,
  637,
  414,
  746,
  201,
  613,
  680,
  414,
  674,
  648,
  564,
  586,
  32,
  691,
  574,
  323,
  763,
  414,
  674,
  755,
  289,
  531,
  682,
  669,
  611,
  254,
  679,
  665,
  246,
  743,
  689,
  524,
  778,
  129,
  691,
  691,
  226,
  597,
  592,
  568,
  602,
  146,
  633,
  634,
  202,
  645,
  536,
  536,
  737,
  301,
  650,
  705,
  314,
  592,
  620,
  659,
  681,
  364,
  841,
  939,
  744,
  1023,
  1023,
  932,
  718,
  418,
  0,
  168,
  44,
  226,
  0,
  468,
  68,
  527,
  499,
  725,
  669,
  248,
  791,
  685,
  428,
  794,
  565,
  674,
  784,
  331,
  637,
  716,
  500,
  727,
  508,
  769,
  753,
  355,
  842,
  787,
  425,
  877,
  669,
  843,
  939,
  532,
  890,
  905,
  815,
  896,
  663,
  970,
  918,
  529,
  980,
  936,
  566,
  987,
  530,
  890,
  890,
  454,
  789,
  760,
  447,
  682,
  188,
  655,
  536,
  0,
  610,
  198,
  517,
  591,
  515,
  496,
  75,
  563,
  509,
  274,
  637,
  212,
  589,
  621,
  193,
  452,
  536,
  381,
  509,
  189,
  652,
  508,
  223,
  587,
  524,
  509,
  621,
  105,
  639,
  689,
  290,
  538,
  588,
  617,
  589,
  116,
  636,
  620,
  204,
  645,
  538,
  655,
  737,
  175,
  575,
  739,
  538,
  591,
  533,
  560,
  596,
  200,
  704,
  643,
  343,
  652,
  557,
  633,
  799,
  324,
  638,
  782,
  405,
  631,
  592,
  721,
  719,
  250,
  780,
  670,
  347,
  807,
  491,
  664,
  695,
  206,
  567,
  639,
  398,
  661,
  395,
  706,
  639,
  178,
  707,
  643,
  283,
  671,
  431,
  657,
  711,
  276,
  623,
  768,
  390,
  786,
  548,
  1023,
  1023,
  1023,
  612,
  664,
  532,
  110,
  132,
  0,
  327,
  85,
  383,
  490,
  363,
  578,
  194,
  763,
  677,
  245,
  778,
  674,
  326,
  732,
  287,
  910,
  759,
  431,
  715,
  741,
  543,
  746,
  300,
  743,
  725,
  392,
  879,
  744,
  392,
  895,
  361,
  907,
  941,
  511,
  841,
  881,
  894,
  968,
  581,
  1023,
  903,
  886,
  978,
  898,
  565,
  990,
  826,
  824,
  846,
  424,
  609,
  667,
  409,
  461,
  486,
  575,
  521,
  0,
  540,
  173,
  542,
  475,
  191,
  554,
  375,
  519,
  542,
  4,
  585,
  218,
  569,
  607,
  321,
  469,
  438,
  686,
  578,
  24,
  700,
  478,
  639,
  696,
  213,
  554,
  568,
  330,
  588,
  364,
  633,
  589,
  103,
  619,
  597,
  152,
  727,
  375,
  547,
  651,
  351,
  576,
  627,
  332,
  597,
  296,
  695,
  653,
  157,
  730,
  609,
  368,
  753,
  309,
  609,
  693,
  235,
  656,
  658,
  489,
  725,
  208,
  666,
  690,
  250,
  766,
  674,
  401,
  808,
  234,
  696,
  670,
  288,
  738,
  676,
  591,
  631,
  141,
  732,
  579,
  199,
  691,
  598,
  458,
  674,
  235,
  654,
  745,
  261,
  624,
  667,
  587,
  703,
  226,
  761
];
