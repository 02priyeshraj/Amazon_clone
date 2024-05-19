import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  double totalSales = 0.0;
  List<BarChartGroupData> earnings = [];

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  void getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'].map<BarChartGroupData>((sales) {
      return BarChartGroupData(
        x: sales.label,
        barRods: [
          BarChartRodData(
            toY: sales.earning,
            width: 20,
            color: Colors.blue,
          ),
        ],
      );
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analytics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Total Sales: \$${totalSales.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: earnings,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 22,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index >= 0 && index < earnings.length) {
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(
                                earnings[index].x.toString(),
                                style: TextStyle(
                                  color: Color(0xff68737d),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(''),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final index = (value / 100).round() - 1;
                          if (index >= 0 && index < earnings.length) {
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(
                                '\$${(index * 100).round()}',
                                style: TextStyle(
                                  color: Color(0xff68737d),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(''),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
