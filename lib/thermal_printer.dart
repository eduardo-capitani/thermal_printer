import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';

abstract class thermalPrinter {
  Future initPlataform();

  List<DropdownMenuItem<BluetoothDevice>> getImpressoras();

  connect();

  disconnect();

  printer();
}