import 'dart:convert';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class TransactionhistoryController extends GetxController {
  Future<void> Gethistory();
  double calculateTotalIncome();
  double calculateTotalOutcome();
  int countTotalTransactions();
  void applyDateFilter(DateTime startDate, DateTime endDate);
  List<FlSpot> getIncomeData();
  List<FlSpot> getOutcomeData();
  getTransactionData();
}

class TransactionhistoryControllerImp extends TransactionhistoryController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var transaction = [].obs; // Observable list to store transactions
  var allTransactions =
      [].obs; // Observable list to store all fetched transactions

  String? filterFromEmail;
  String? filterToEmail;
  double? filterMinAmount;
  double? filterMaxAmount;
  String? userEmail;

  @override
  void onInit() {
    super.onInit();
    _loadUserEmail();
    Gethistory(); // Fetch initial data
  }

  Future<void> _loadUserEmail() async {
    final SharedPreferences prefs = await _prefs;
    userEmail = prefs.getString('smartEmail');
  }

  @override
  Future<void> Gethistory() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final token = prefs.getString('token');

      if (token == null) {
        Get.snackbar("Error", "Token not found. Please login again.");
        return;
      }

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var request = http.Request('GET',
          Uri.parse('https://smart-pay.onrender.com/api/v0/transactions/'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        allTransactions
            .assignAll(jsonResponse['data']); // Store the response data
        applyFilters(); // Apply filters to the fetched data
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }

  void applyFilters() {
    List filteredTransactions = allTransactions;

    if (filterFromEmail != null && filterFromEmail!.isNotEmpty) {
      filteredTransactions = filteredTransactions
          .where((transaction) => transaction['from']
              .toLowerCase()
              .contains(filterFromEmail!.toLowerCase()))
          .toList();
    }

    if (filterToEmail != null && filterToEmail!.isNotEmpty) {
      filteredTransactions = filteredTransactions
          .where((transaction) => transaction['to']
              .toLowerCase()
              .contains(filterToEmail!.toLowerCase()))
          .toList();
    }

    if (filterMinAmount != null) {
      filteredTransactions = filteredTransactions
          .where((transaction) => transaction['amount'] >= filterMinAmount!)
          .toList();
    }

    if (filterMaxAmount != null) {
      filteredTransactions = filteredTransactions
          .where((transaction) => transaction['amount'] <= filterMaxAmount!)
          .toList();
    }

    transaction.assignAll(filteredTransactions);
  }

  @override
  double calculateTotalIncome() {
    return transaction
        .where((transaction) =>
            transaction['to'].toLowerCase() == userEmail?.toLowerCase())
        .fold(0, (sum, transaction) => sum + transaction['amount']);
  }

  @override
  double calculateTotalOutcome() {
    return transaction
        .where((transaction) =>
            transaction['from'].toLowerCase() == userEmail?.toLowerCase())
        .fold(0, (sum, transaction) => sum + transaction['amount']);
  }

  @override
  int countTotalTransactions() {
    return transaction.length;
  }

  @override
  void applyDateFilter(DateTime startDate, DateTime endDate) {
    transaction.assignAll(allTransactions.where((transaction) {
      DateTime createdAt = DateTime.parse(transaction['createdAt']);
      return createdAt.isAfter(startDate) && createdAt.isBefore(endDate);
    }).toList());
  }

  @override
  List<FlSpot> getIncomeData() {
    return transaction
        .where((transaction) =>
            transaction['to'].toLowerCase() == userEmail?.toLowerCase())
        .map((transaction) {
      DateTime date = DateTime.parse(transaction['createdAt']);
      double amount = (transaction['amount'] as num).toDouble();
      return FlSpot(date.millisecondsSinceEpoch.toDouble(), amount);
    }).toList();
  }

  @override
  List<FlSpot> getOutcomeData() {
    return transaction
        .where((transaction) =>
            transaction['from'].toLowerCase() == userEmail?.toLowerCase())
        .map((transaction) {
      DateTime date = DateTime.parse(transaction['createdAt']);
      double amount = (transaction['amount'] as num).toDouble();
      return FlSpot(date.millisecondsSinceEpoch.toDouble(), amount);
    }).toList();
  }

  @override
  List<FlSpot> getTransactionData() {
    return transaction.map((transaction) {
      DateTime date = DateTime.parse(transaction['createdAt']);
      double amount = (transaction['amount'] as num).toDouble();
      return FlSpot(date.millisecondsSinceEpoch.toDouble(), amount);
    }).toList();
  }
}
