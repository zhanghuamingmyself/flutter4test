import 'package:json_annotation/json_annotation.dart';

// 设备数据模型
class Device {
  final String id;
  final String name;
  final String type;
  final String status;
  final String ipAddress;
  final int signalStrength;
  final bool isConnected;
  final DateTime lastSeen;
  final String icon;

  Device({
    required this.id,
    required this.name,
    required this.type,
    required this.status,
    required this.ipAddress,
    required this.signalStrength,
    required this.isConnected,
    required this.lastSeen,
    required this.icon,
  });

  // 从JSON创建设备对象
  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      status: json['status'],
      ipAddress: json['ipAddress'],
      signalStrength: json['signalStrength'],
      isConnected: json['isConnected'],
      lastSeen: DateTime.parse(json['lastSeen']),
      icon: json['icon'],
    );
  }
}
