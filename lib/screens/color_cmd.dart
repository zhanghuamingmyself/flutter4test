import 'dart:ffi';

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
  BluetoothConnectionState _connectionState =
      BluetoothConnectionState.disconnected;
  BluetoothCharacteristic? _colorCmdCharacteristic;
  int _index = 0;

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

  Future<void> onBtnPressed(int index) async {
    setState(() {
      _index = index;
    });
    if (_colorCmdCharacteristic == null) {
      return;
    }
    await _colorCmdCharacteristic!.write([0x00, 0x00, 0x00]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title: const Text('Color Command'),
      ),
      body: ListView(children: <Widget>[
        Text("Connection State: " + _connectionState.toString()),
        TextButton(
          onPressed: () => onBtnPressed(1),
          child: Text(widget.device.platformName),
        ),
        ListTile(leading: Icon(Icons.map), title: Text('Map')),
        ListTile(leading: Icon(Icons.photo_album), title: Text('Album')),
        ListTile(leading: Icon(Icons.phone), title: Text('Phone')),
        MaterialPicker(
          pickerColor: Colors.red,
          onColorChanged: (color) {
            print('选中颜色: $color');
            _colorCmdCharacteristic!
                .write([color.red, color.green, color.blue]);
          },
        ),
        ..._services.map((it) => Text(it.uuid.str.toUpperCase())),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          GestureDetector(
              onTap: () => onBtnPressed(0),
              child: Column(
                children: [
                  Icon(Icons.kitchen,
                      color: _index == 0 ? Colors.green[500] : Colors.red[500],
                      size: 50),
                  Text(
                    "关",
                    style: TextStyle(
                        color:
                            _index == 0 ? Colors.green[500] : Colors.red[500]),
                  ),
                ],
              )),
          GestureDetector(
              onTap: () => onBtnPressed(1),
              child: Column(children: [
                Icon(Icons.kitchen,
                    color: _index == 1 ? Colors.green[500] : Colors.red[500],
                    size: 50),
                Text(
                  "开",
                  style: TextStyle(
                      color: _index == 1 ? Colors.green[500] : Colors.red[500]),
                ),
              ])),
          GestureDetector(
              onTap: () => onBtnPressed(2),
              child: Column(children: [
                Icon(Icons.kitchen,
                    color: _index == 2 ? Colors.green[500] : Colors.red[500],
                    size: 50),
                Text(
                  "关",
                  style: TextStyle(
                      color: _index == 2 ? Colors.green[500] : Colors.red[500]),
                ),
              ])),
        ]),
        const Image(image: AssetImage('assets/images/app.png')),
        Image.network('https://picsum.photos/250?image=9'),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: onBtnPressed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'me',
          ),
        ],
      ),
    );
  }
}
