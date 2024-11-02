import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pie_chart/pie_chart.dart' as pie;
import 'package:gradp2p/controller/transactionHistory_controller.dart';

class Dashboard extends StatelessWidget {
  final TransactionhistoryControllerImp controller =
      Get.put(TransactionhistoryControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: Obx(() {
        double totalIncome = controller.calculateTotalIncome();
        double totalOutcome = controller.calculateTotalOutcome();
        int totalTransactions = controller.countTotalTransactions();

        List<FlSpot> transactionData = controller.getTransactionData();

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filter by Date:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFilterButton(
                          'Last Hour',
                          DateTime.now().subtract(Duration(hours: 1)),
                          DateTime.now()),
                      _buildFilterButton(
                          'Last Day',
                          DateTime.now().subtract(Duration(days: 1)),
                          DateTime.now()),
                      _buildFilterButton(
                          'Last Month',
                          DateTime.now().subtract(Duration(days: 30)),
                          DateTime.now()),
                      _buildFilterButton(
                          'Last 6 Months',
                          DateTime.now().subtract(Duration(days: 180)),
                          DateTime.now()),
                      _buildFilterButton(
                          'Last Year',
                          DateTime.now().subtract(Duration(days: 365)),
                          DateTime.now()),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCard('Total Income:', '$totalIncome LE'),
                    _buildCard('Total Outcome:', '$totalOutcome LE'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCard('Transactions:', '$totalTransactions'),
                  ],
                ),
                SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: _buildPieChartSection(
                      'Income vs Outcome:', totalIncome, totalOutcome),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildCard(String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(
      String label, DateTime startDate, DateTime endDate) {
    return ElevatedButton(
      onPressed: () {
        controller.applyDateFilter(startDate, endDate);
      },
      child: Text(label),
    );
  }

  Widget _buildPieChartSection(
      String title, double totalIncome, double totalOutcome) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 200.0,
          child: pie.PieChart(
            dataMap: {
              "Income": totalIncome,
              "Outcome": totalOutcome,
            },
            colorList: [Colors.green, Colors.red],
            chartType: pie.ChartType.ring,
            ringStrokeWidth: 32,
            chartValuesOptions: pie.ChartValuesOptions(
              showChartValuesInPercentage: true,
              showChartValuesOutside: true,
              decimalPlaces: 1,
            ),
            legendOptions: pie.LegendOptions(
              showLegendsInRow: false,
              legendPosition: pie.LegendPosition.right,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
