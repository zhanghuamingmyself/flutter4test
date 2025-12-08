import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter4test/screens/scan_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../bean/album.dart';
import '../bean/device.dart';
import '../routers/index.dart';
import '../widgets/theme_switch.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tab_index = 0;
  int _counter = 0;
  Album _album = Album(userId: 1, id: 2, title: "title");

  Future<Album> fetchAlbum() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  void _incrementCounter() async {
    _album = await fetchAlbum();
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
    //打印statusCode
    print(_album);
    //传递参数
    // Get.toNamed(Routes.deviceScreen, arguments: _album);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    String title = _album.title;

    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _tab_index == 0
            ? const HomeScreen()
            : _tab_index == 1
                ? const DeviceListScreen()
                : const MyScreen(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tab_index,
        onTap: (index) {
          _tab_index = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'My',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        actions: const [
          ThemeToggleButton(),
          SizedBox(width: 8),
        ],
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(' MyScreen'),
      ),
      body: const Center(
        child: Text("My Screen"),
      ),
    );
  }
}

class DeviceListScreen extends StatefulWidget {
  const DeviceListScreen({super.key});

  @override
  State<DeviceListScreen> createState() => _DeviceListScreenState();
}

class _DeviceListScreenState extends State<DeviceListScreen> {
  final TextEditingController _searchController = TextEditingController();
  final _scrollController = ScrollController();
  List<Device> _deviceList = [];

  void _getDevice() async {
    //睡眠5秒
    await Future.delayed(const Duration(seconds: 5));

    _deviceList = [
      Device(
          id: "1",
          name: "name",
          type: "type",
          status: "status",
          ipAddress: "ip",
          signalStrength: 1,
          isConnected: true,
          lastSeen: DateTime.now(),
          icon: "icon"),
      Device(
          id: "3",
          name: "name",
          type: "type",
          status: "status",
          ipAddress: "ip",
          signalStrength: 2,
          isConnected: true,
          lastSeen: DateTime.now(),
          icon: "icon"),
      Device(
          id: "4",
          name: "name",
          type: "type",
          status: "status",
          ipAddress: "ip",
          signalStrength: 3,
          isConnected: true,
          lastSeen: DateTime.now(),
          icon: "icon"),
      Device(
          id: "5",
          name: "name",
          type: "type",
          status: "status",
          ipAddress: "ip",
          signalStrength: 4,
          isConnected: true,
          lastSeen: DateTime.now(),
          icon: "icon"),
    ];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            _buildAppBar(),
          ];
        },
        body: _buildDeviceList(),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 120,
      pinned: true,
      floating: true,
      snap: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _showAddDeviceDialog,
          tooltip: '添加设备',
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: _showMoreOptions,
          tooltip: '更多选项',
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 10,
            children: [
              Expanded(
                child: SearchBar(
                  padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 16)),
                  controller: _searchController,
                  hintText: '搜索设备...',
                  onChanged: (value) {
                    // 实现搜索功能
                  },
                  trailing: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        _getDevice();
                      },
                    ),
                  ],
                ),
              ),
              const Stack(
                children: [
                  Icon(
                    Icons.eighteen_mp_outlined,
                    size: 60,
                  ),
                  Positioned(
                      right: 0,
                      top: 0,
                      child: Chip(
                        avatar: Icon(Icons.close),
                        label: Text("3"),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceList() {
    return Column(
      children: _deviceList.isNotEmpty
          ? _deviceList.map((device) => _buildDeviceItem(device)).toList()
          : [_buildEmptyState()],
    );
  }

  Widget _buildDeviceItem(Device device) {
    return ListTile(
      leading: const Icon(Icons.home),
      title: Text(device.name),
      subtitle: Text(device.lastSeen.toString()),
      trailing: Text(device.status),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.devices_other,
            size: 80,
            color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            '暂无设备',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
          ),
          const SizedBox(height: 8),
          Text(
            '点击下方按钮添加新设备',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _showAddDeviceDialog,
      child: const Icon(Icons.add),
    );
  }

  void _showAddDeviceDialog() {
    showDialog(
        context: context,
        builder: (context) => Container(
              child: AlertDialog(
                content: Center(
                  child: Text("123"),
                ),
              ),
            ));
  }

  void _showMoreOptions() {
    showModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
              height: 20,
              child: Row(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text("_showMoreOptions"),
                    ),
                  ),
                ],
              ),
            ));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: const ScanScreen()
    );
  }
}
