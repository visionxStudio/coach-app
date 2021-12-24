import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncfusionChart extends StatelessWidget {
  const SyncfusionChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: NumericAxis(isVisible: false),
      primaryYAxis: NumericAxis(isVisible: false),
      legend: Legend(
        isVisible: true,
        opacity: 0.7,
        position: LegendPosition.top,
        alignment: ChartAlignment.near,
      ),
      plotAreaBorderWidth: 0,
      series: _getSplieAreaSeries(),
      tooltipBehavior: TooltipBehavior(
        enable: true,
      ),
    );
  }

  List<ChartSeries<_SplineAreaData, double>> _getSplieAreaSeries() {
    final List<_SplineAreaData> chartData = <_SplineAreaData>[
      // hardcoded vlaues
      _SplineAreaData(0, 10.53, 4.6, 1.2),
      _SplineAreaData(1, 8, 5.4, 1.8),
      _SplineAreaData(2, 8, 6.4, 3.5),
      _SplineAreaData(3, 9.4, 2.62, 5.6),
      _SplineAreaData(4, 5.8, 3.4, 4.3),
      _SplineAreaData(5, 10, 3.6, 1.6),
      _SplineAreaData(6, 4.5, 4, 3.4),
      _SplineAreaData(7, 8.6, 5.6, 5.5),
    ];
    return <ChartSeries<_SplineAreaData, double>>[
      SplineAreaSeries<_SplineAreaData, double>(
        gradient: LinearGradient(colors: [
          const Color(0xffFEEBEB),
          const Color(0xffEBDFDF).withOpacity(0.12),
        ]),
        dataSource: chartData,
        color: const Color(0xffEB5757),
        borderColor: const Color(0xffEB5757),
        borderWidth: 2,
        name: 'Yoga',
        xValueMapper: (_SplineAreaData sales, _) => sales.day,
        yValueMapper: (_SplineAreaData sales, _) => sales.y1,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          labelAlignment: ChartDataLabelAlignment.top,

          // color: Colors.grey,
          textStyle: TextStyle(color: Colors.grey, fontSize: 8.0),
        ),
        markerSettings: const MarkerSettings(
          isVisible: true,
          color: Color(0xffEB5757),
        ),
      ),
      SplineAreaSeries<_SplineAreaData, double>(
        dataSource: chartData,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xffDBFFEA),
            const Color(0xff6FCF97).withOpacity(0),
          ],
        ),
        borderColor: const Color(0xff6FCF97),
        color: const Color(0xff6FCF97),
        borderWidth: 2,
        name: 'Mediation',
        xValueMapper: (_SplineAreaData sales, _) => sales.day,
        yValueMapper: (_SplineAreaData sales, _) => sales.y2,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          labelAlignment: ChartDataLabelAlignment.top,
          textStyle: TextStyle(color: Colors.grey, fontSize: 8.0),
        ),
        markerSettings: const MarkerSettings(
          isVisible: true,
          color: Color(0xff6FCF97),
        ),
      ),
      SplineAreaSeries<_SplineAreaData, double>(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xffBB6BD9).withOpacity(0.6),
            const Color(0xffEFCCFD).withOpacity(0.36),
          ],
        ),
        dataSource: chartData,
        color: const Color(0xffBB6BD9),
        borderColor: const Color(0xffBB6BD9),
        borderWidth: 2,
        name: 'Pilates',
        xValueMapper: (_SplineAreaData sales, _) => sales.day,
        yValueMapper: (_SplineAreaData sales, _) => sales.y3,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          labelAlignment: ChartDataLabelAlignment.top,

          // color: Colors.grey,
          textStyle: TextStyle(color: Color(0xffBB6BD9), fontSize: 8.0),
        ),
        markerSettings: const MarkerSettings(
          isVisible: true,
          color: Color(0xffBB6BD9),
        ),
      ),
    ];
  }
}

class _SplineAreaData {
  _SplineAreaData(this.day, this.y1, this.y2, this.y3);
  final double day;
  final double y1;
  final double y2;
  final double y3;
}
