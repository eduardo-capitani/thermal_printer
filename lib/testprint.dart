import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:thermal_printer/printerenum.dart';

///Test printing
class TestPrint {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  sample() async {
    //image max 300px X 300px
    String teste =
        "  tstestestestesteste   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium quam vulputate dignissim suspendisse in est. Donec ultrices tincidunt arcu non sodales neque sodales ut. Eget dolor morbi non arcu risus quis varius quam. Scelerisque in dictum non consectetur. Faucibus ornare suspendisse sed nisi lacus sed viverra. Nam libero justo laoreet sit. Enim sed faucibus turpis in eu mi. Pretium lectus quam id leo in vitae. Augue mauris augue neque gravida.";

    ///image from File path

    final List<Map<String, dynamic>> data = [
      {'title': 'Cadbury Dairy Milk', 'price': 15, 'qty': 2},
      {'title': 'Parle-G Gluco Biscut', 'price': 5, 'qty': 5},
      {'title': 'Fresh Onion - 1KG', 'price': 20, 'qty': 1},
      {'title': 'Fresh Sweet Lime', 'price': 20, 'qty': 5},
      {'title': 'Maggi', 'price': 10, 'qty': 5},
    ];

    String dir = (await getApplicationDocumentsDirectory()).path;

    Future<void> printMapList(
        List<Map<String, dynamic>> mapList, int size) async {
      for (Map<String, dynamic> mapItem in mapList) {
        // Aqui, convertemos o mapa em uma representação de string simples.
        String text = mapItem.entries
            .map((entry) => '${entry.key}: ${entry.value}')
            .join(', ');

        await bluetooth.printCustom(text, size, 0);
      }
    }

    ///image from Network
    var response = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/kakzaki/blue_thermal_printer/master/example/assets/images/yourlogo.png"));
    Uint8List bytesNetwork = response.bodyBytes;
    Uint8List imageBytesFromNetwork = bytesNetwork.buffer
        .asUint8List(bytesNetwork.offsetInBytes, bytesNetwork.lengthInBytes);

    bluetooth.isConnected.then((isConnected) {
      if (isConnected == true) {
        bluetooth.printNewLine();
        bluetooth.printCustom(
            "HEADER", Sizep.boldMedium.val, Alignp.center.val);
        bluetooth.printNewLine();
        printMapList(data, 0);
        bluetooth
            .paperCut(); //some printer not supported (sometime making image not centered)
        //bluetooth.drawerPin2(); // or you can use bluetooth.drawerPin5();
      }
    });
  }
}
