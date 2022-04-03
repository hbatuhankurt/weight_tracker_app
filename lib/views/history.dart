import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker_app/widgets/record_list_tile.dart';

import '../controllers/controller.dart';
import '../models/record.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    List<Record> records = _controller.records;

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: _controller.addRecord,
              icon: const Icon(Icons.add),
            ),
          ],
          centerTitle: true,
          title: const Text("History"),
        ),
        body: records.isEmpty
            ? const Center(
                child: Text("Please Add Some Records"),
              )
            : ListView(
                children: records
                    .map((record) => RecordListTile(record: record))
                    .toList(),
              ),
      ),
    );
  }
}
