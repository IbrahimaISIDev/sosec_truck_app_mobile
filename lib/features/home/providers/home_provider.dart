import 'package:flutter/material.dart';
import '../../../core/models/task.dart';

class HomeProvider with ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      title: "Scanner le compteur",
      subtitle: "À faire avant départ",
      isCompleted: false,
      iconPath: "camera",
    ),
    Task(
      title: "Scanner tickets",
      subtitle: "À faire après chaque course",
      isCompleted: false,
      iconPath: "document",
    ),
    Task(
      title: "Enregistrer les dépenses",
      subtitle: "Carburant, péages et maintenance",
      isCompleted: true,
      iconPath: "wallet",
    ),
  ];

  bool _isSynced = true;

  List<Task> get tasks => _tasks;
  bool get isSynced => _isSynced;

  void toggleTaskCompletion(int index) {
    _tasks[index] = Task(
      title: _tasks[index].title,
      subtitle: _tasks[index].subtitle,
      isCompleted: !_tasks[index].isCompleted,
      iconPath: _tasks[index].iconPath,
    );
    notifyListeners();
  }

  void toggleSync() {
    _isSynced = !_isSynced;
    notifyListeners();
  }
}