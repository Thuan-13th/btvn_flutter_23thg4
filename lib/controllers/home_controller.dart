import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item_model.dart';

class HomeController extends ChangeNotifier {
  void add(ItemModel item) {
    final lastId = items.length != 0 ? items.last.id : '00';
    int indexId = int.parse('$lastId') + 1;
    String id = indexId < 10 ? '0$indexId' : '$indexId';
    items.add(ItemModel(
      id: id,
      name: '${item.name}',
      description: '${item.description}',
    ));
    notifyListeners();
  }

  void update(int index, ItemModel item) {
    items[index] = item;
    notifyListeners();
  }

  void delete(ItemModel item) {
    items.remove(item);
    notifyListeners();
  }
}

HomeController homeController = HomeController();
