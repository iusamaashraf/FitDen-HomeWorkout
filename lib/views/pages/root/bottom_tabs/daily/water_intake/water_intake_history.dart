import 'package:fitden_homeworkout/controllers/basic_controller.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/pages/root/bottom_tabs/daily/components/water_progress_bar.dart';
import 'package:fitden_homeworkout/views/pages/root/bottom_tabs/daily/components/water_tracker_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WaterInktakeHistoryPage extends StatefulWidget {
  const WaterInktakeHistoryPage({Key? key}) : super(key: key);

  @override
  State<WaterInktakeHistoryPage> createState() =>
      _WaterInktakeHistoryPageState();
}

class _WaterInktakeHistoryPageState extends State<WaterInktakeHistoryPage> {
  final BasicController con = Get.put(BasicController());
  late List<SalesData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final List<SalesData> chartData = [
    //   SalesData(DateTime.now(), 35),
    //   SalesData(DateTime.now(), 28),
    //   SalesData(DateTime.now(), 34),
    //   SalesData(DateTime.now(), 32),
    //   SalesData(DateTime.now(), 40)
    // ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Text('Water Tracker',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            SizedBox(height: 2 * SizeConfig.heightMultiplier),
            SizedBox(
              height: 120,
              width: 120,
              child: WaterCircularProgressBar(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WaterTrackerButton(
                  onTap: () {
                    con.decrement();
                  },
                  text: '-',
                ),
                SizedBox(width: 9 * SizeConfig.widthMultiplier),
                WaterTrackerButton(
                  onTap: () {
                    con.increment();
                  },
                  text: '+',
                ),
              ],
            ),
            SizedBox(
              height: 40 * SizeConfig.heightMultiplier,
              width: 100 * SizeConfig.widthMultiplier,
              child: SfCartesianChart(
                title: ChartTitle(text: 'Water Intake Analysis'),
                legend: Legend(isVisible: true),
                tooltipBehavior: _tooltipBehavior,
                series: <FastLineSeries>[
                  FastLineSeries<SalesData, double>(
                    name: 'Water',
                    dataSource: _chartData,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true,
                    color: Colors.orange,
                    width: 4,
                    opacity: 0.4,
                    // dashArray: const <double>[5, 5],
                  )
                ],
                primaryXAxis: NumericAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                ),
                primaryYAxis: NumericAxis(
                  labelFormat: '{value}',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(2017, 25),
      SalesData(2018, 12),
      SalesData(2019, 24),
      SalesData(2020, 18),
      SalesData(2021, 30),
      SalesData(2022, 25),
      SalesData(2023, 12),
      SalesData(2024, 24),
      SalesData(2025, 18),
      SalesData(2026, 30)
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}
// class SalesData {
//   SalesData(this.year, this.sales);
//   final DateTime year;
//   final double sales;
// }
