import 'package:get/get.dart';
import '../models/record.dart';

class Controller extends GetxController {
  var records = <Record>[].obs;

  void addRecord() {
    records.add(Record(weight: 50, dateTime: DateTime.now(), note: 'XXXXX'));
    print(records.length);
  }

  void deleteRecord(Record record) {
    records.remove(record);
  }
}
