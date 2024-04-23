import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/style.dart';
import 'package:flutter_application_1/models/item_model.dart';
import 'package:flutter_application_1/views/edit_view.dart';

import '../controllers/home_controller.dart';

class DetailView extends StatelessWidget {
  final int index;
  final ItemModel item;
  const DetailView({
    super.key,
    required this.index,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: icon.edit,
              onPressed: () {
                showModalBottomSheet<String?>(
                  context: context,
                  builder: (context) => EditView(
                    index: index,
                    item: item,
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: Center(
        child: ListenableBuilder(
          listenable: homeController,
          builder: (context, child) => Column(
            children: [
              themes.items(null, index, item),
              themes.desrciption(item),
            ],
          ),
        ),
      ),
    );
  }
}
