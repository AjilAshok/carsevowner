import 'dart:math';

import 'package:carsevowner/controller/ownerservice.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:data_table_2/data_table_2.dart';
class Report_page extends StatelessWidget {
  Report_page({Key? key}) : super(key: key);
  // List<Orderstatus> data = Orderstatus.data;
 DateTime last24Hours = DateTime.now().subtract(const Duration(days: 1));
  DateTime lastWeek = DateTime.now().subtract(const Duration(days: 7));
  DateTime lastMonth = DateTime.now().subtract(const Duration(days: 30));
 

  @override
  Widget build(BuildContext context) {
    final controler = Get.put(Ownerservice());
    // print(DateTime.now().millisecondsSinceEpoch);
    DateTime currentPhoneDate = DateTime.now();

    // Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate);
    // print(myTimeStamp);
    // formattime(myTimeStamp);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Report",
            style:
                TextStyle(color: Colors.black, fontSize: 25, letterSpacing: 1),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0XFF738878),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 TextButton(onPressed: (){
                   controler.sortOrderCustom(last24Hours);

                  }, child: Text("Day")),
                 TextButton(onPressed: (){
                   controler.sortOrderCustom(lastWeek);
                 }, child: Text("Weekly")),
                 TextButton(onPressed: (){
                   controler.sortOrderCustom(lastMonth);
                 }, child: Text("Montly"))
               ],
             ),
             GetBuilder<Ownerservice>(
               builder: (controller) => 
                Padding(padding: EdgeInsets.all(10),
               child: DataTable2(
                 columnSpacing: 12,
               horizontalMargin: 12,
               minWidth: 600,
                 columns:[
                    DataColumn2(
                label: Text('Userid'),
                size: ColumnSize.L,
                         ),
                         DataColumn(
                label: Text('Works'),
                         ),
                         DataColumn(
                label: Text('Name of user'),
                         ),
                         DataColumn(
                label: Text('Amount'),
                         ),
                         DataColumn(
                label: Text('Payment'),
                numeric: true,
                         ),
                 ] ,
                  rows:List<DataRow>.generate(
                controler.username.length,
                (index) {
                 
                  return DataRow(cells: [
                      DataCell(Text(controler.allorders[index].toString())),
                      DataCell(Text(controler.orderslist[index].toString())),
                      DataCell(Text(controler.username[index].toString())),
                      DataCell(Text(controler.amount[index].toString())),
                      DataCell(Text(controler.payment[index].toString()))
                    ]);
                })), ),
             ),
             
            ],
          ),
        ),
      ),
    );
  }

  
 
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}
