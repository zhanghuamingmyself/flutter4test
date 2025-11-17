import 'package:flutter/material.dart';
import 'package:flutter4test/utils/extra.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../utils/snackbar.dart';

class ColorCmdScreen extends StatefulWidget {
  const ColorCmdScreen({super.key, required this.device});

  final BluetoothDevice device;


  @override
  State<ColorCmdScreen> createState() => _ColorCmdScreenState();
}

class _ColorCmdScreenState extends State<ColorCmdScreen> {
  List<BluetoothService> _services = [];
  BluetoothConnectionState _connectionState = BluetoothConnectionState.disconnected;
  BluetoothCharacteristic? _colorCmdCharacteristic;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.device.connectionState.listen((state) async {
      _connectionState = state;
      try {
        _services = await widget.device.discoverServices();
        _colorCmdCharacteristic = _services
            .firstWhere((it) => it.uuid.str == "1815")
            .characteristics
            .first;
        Snackbar.show(ABC.c, "Discover Services: Success", success: true);
      } catch (e, backtrace) {
        Snackbar.show(ABC.c, prettyException("Discover Services Error:", e),
            success: false);
        print(e);
        print("backtrace: $backtrace");
      }
      Snackbar.show(ABC.c, "Connect: Success", success: true);
    });
    widget.device.connectAndUpdateStream().catchError((e) {
      Snackbar.show(ABC.c, prettyException("Connect Error:", e),
          success: false);
    });
  }

  Future<void> onBtnPressed() async {
    if (_colorCmdCharacteristic == null) {
      return;
    }
    await _colorCmdCharacteristic!.write([0xFF, 0x02, 0x03]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Command'),
      ),
      body: ListView(
        children: <Widget>[
          Text("Connection State: " + _connectionState.toString()),
          TextButton(
            onPressed: onBtnPressed,
            child: Text(widget.device.platformName),
          ),
          BlockPicker(

            pickerColor: Colors.red,
            onColorChanged: (color) {
              print('选中颜色: $color');
              _colorCmdCharacteristic!
                  .write([color.red, color.green, color.blue]);
            },
          ),
          ..._services.map((it) => Text(it.uuid.str.toUpperCase()))
        ],
      ),
    );
  }
}
