import 'package:http/http.dart' as http;
import 'dart:convert';

class ListViewModal {
  final int id;
  final String title;
  final bool status;
  final int? userId;

  ListViewModal({
    required this.id,
    required this.title,
    required this.status,
    this.userId,
  });

  factory ListViewModal.fromJson(Map<String,dynamic> json){
    return ListViewModal(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        status: json['completed'] ?? json['status'] ?? false ,
        userId: json['userId'] ,
    );
  }
}